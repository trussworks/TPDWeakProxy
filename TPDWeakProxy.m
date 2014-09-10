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
    [anInvocation invokeWithTarget:self.theObject];
}

- (NSMethodSignature *)methodSignatureForSelector:(SEL)aSelector {
    return [self.theObject methodSignatureForSelector:aSelector];
}

@end
