# TPWeakProxy

An NSProxy object for turning strong references into weak references.

## Usage

    TPWeakProxy *proxy = [[TPWeakProxy alloc] initWithObject:myObject];
    
    // Now, you can use proxy anywhere you'd normally use myObject,
    // except that myObject will have a weak reference to it always.
    
    // NSTimer maintains a strong reference to its target. Sometimes
    // this isn't what you want.
    NSTimer *myWeakRefTimer = [NSTimer scheduledTimerWithTimeInterval:1.0
                                                               target:proxy
                                                             selector:@selector(myWeakRefTimerFired:)
                                                             userInfo:nil
                                                              repeats:NO];
                                                              
## Installation

Easiest way: use Cocoapods. Otherwise, copy the .h and .m into your project.

    $ edit Podfile
    platform :ios, '6.1'
    pod 'TPWeakProxy', '~> 1.0.0'
    
    $ pod install
    
    $ open App.xcworkspace
    
## Motivation

A fairly common pattern in iOS development is to have a
UIViewController that needs to use an NSTimer to trigger a refresh
event periodically. Ideally, when the ViewController goes away, we'd
like the timer to also go away. The naive approach:

    @interface

    @property (strong, non-atomic) NSTimer *myTimer;
    
    @end

    @implementation
    
    -(void)dealloc {
        [self.myTimer invalidate];
    }
    
    -(void)viewDidLoad {
        [super viewDidLoad];
        self.myTimer = [NSTimer scheduledTimerWithTimeInterval:30.0
                                                        target:self
                                                      selector:@selector(myTimerFired:)
                                                      userInfo:nil
                                                       repeats:NO];
     }

    @end
    
This has a problem: NSTimer has a strong reference to target:, and the
target has a strong reference to the NSTimer (via the myTimer
property). Now we have a reference loop, and therefor we have a memory leak.

We can fix that pretty easily; the NSTimer is strongly referenced by
the NSRunLoop that it's scheduled to run on, so we can change our
reference to it to be weak:

    @property (weak, non-atomic) NSTimer *myTimer;
    
Yay! Now we don't have a memory leak any more, but we still have a
problem. Since the NSTimer has a strong reference to the
UIViewController, we don't actually dealloc the view controller until
after the NSTimer has fired. If your NSTimer is going to fire a long
time from now, that at least wastes resources, and may actually cause
subtle bugs. Unfortunately, the NSTimer API is fixed; it's not likely
Apple will provide an NSTimer with a weak reference to its target any
time soon. So we fix it with TPWeakProxy, like so:

    -(void)viewDidLoad {
        [super viewDidLoad];
        TPWeakProxy *proxy = [[TPWeakProxy alloc] initWithObject:self];
        self.myTimer = [NSTimer scheduledTimerWithTimeInterval:30.0
                                                        target:proxy
                                                      selector:@selector(myTimerFired:)
                                                      userInfo:nil
                                                       repeats:NO];
     }

Now, the NSTimer won't prevent the UIViewController from being
dealloc'd when it's popped off the stack, and the dealloc() will now
invalidate the timer correctly.
