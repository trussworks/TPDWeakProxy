//
//  TPDWeakProxy.h
//  TPDWeakProxy
//
//  Copyright © 2013 Tetherpad.
//

@import Foundation;

@interface TPDWeakProxy : NSProxy

- (instancetype)initWithObject:(id)object;

@end
