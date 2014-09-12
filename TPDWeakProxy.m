//
//  TPDWeakProxy.m
//  TPDWeakProxy
//
//  Copyright © 2013 Tetherpad.
//

#import "TPDWeakProxy.h"

@interface TPDWeakProxy ()

@property (nonatomic, weak) id theObject;

@end

@implementation TPDWeakProxy

- (id)initWithObject:(id)object {
    // No init method in superclass
    self.theObject = object;
    return self;
}

- (void)forwardInvocation:(NSInvocation *)anInvocation {
    NSLog(@"%s %@", __PRETTY_FUNCTION__, [anInvocation description]);
    [anInvocation invokeWithTarget:self.theObject];
}

- (NSMethodSignature *)methodSignatureForSelector:(SEL)aSelector {
    NSMethodSignature *methodSignature;
    // Keep a strong reference so we can safely send a message
    id obj = self.theObject;
    if (obj) {
        methodSignature = [obj methodSignatureForSelector:aSelector];
    } else {
        // If obj is nil, we need to synthesize a NSMethodSignature. Smallest signature
        // is (self, _cmd) according to the documention for NSMethodSignature.
        NSString *types = [NSString stringWithFormat:@"%s%s", @encode(id), @encode(SEL)];
        methodSignature = [NSMethodSignature signatureWithObjCTypes:[types UTF8String]];
    }
    return methodSignature;
}

@end
