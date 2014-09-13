//
//  TPDWeakProxyTests.m
//  TPDWeakProxyTests
//
//  Created by Mark Ferlatte on 9/10/14.
//  Copyright (c) 2014 Tetherpad. All rights reserved.
//

@import UIKit;
@import XCTest;

#import "TPDWeakProxy.h"

@interface TPDWeakProxyTests : XCTestCase

@end

@implementation TPDWeakProxyTests

// Object messaging is fast enough that we have to message many times in order to see a difference in performance
// from the proxy.
const int iterations = 100000;

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testProxyReturnsSameResult {
    NSNumber *numberOne = @1;
    id proxy = [[TPDWeakProxy alloc] initWithObject:numberOne];
    XCTAssertEqualObjects([numberOne stringValue], [proxy stringValue]);
}

- (void)testProxyWorksWithNilObject {
    id proxy = [[TPDWeakProxy alloc] initWithObject:nil];
    XCTAssertNil([proxy copy]);
}

// This "test" is simply to give us a reference for the proxy's performance
- (void)testMessagePerformance {
    NSNumber *numberOne = @1;
    [self measureBlock:^{
        for (int i = 0; i < iterations; i += 1) {
            [numberOne stringValue];
        }
    }];
}

// If you comment out forwardingTargetForSelector: in TPDWeakProxy.m, you can
// see how much faster the fast path is than the slow path.
- (void)testMessageProxyPerformance {
    NSNumber *numberOne = @1;
    id proxy = [[TPDWeakProxy alloc] initWithObject:numberOne];
    [self measureBlock:^{
        for (int i = 0; i < iterations; i += 1) {
            [proxy stringValue];
        }
    }];
}

@end
