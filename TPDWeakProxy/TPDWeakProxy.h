//
//  TPDWeakProxy.h
//  TPDWeakProxy
//
//  Copyright © 2013-2018 TrussWorks.
//

@import Foundation;

/**
 Instances of `TPDWeakProxy` hold a weak reference to the target object.
 */

@interface TPDWeakProxy : NSProxy

/**
 Initializes an `TPDWeakProxy` object with the specified target object.
 
 @param object The target object for the proxy.
 
 @return The newly initialized proxy.
 */
- (instancetype)initWithObject:(id)object;

@end
