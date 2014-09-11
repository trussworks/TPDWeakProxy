//
//  TPDWeakProxyTests.m
//  TPDWeakProxyTests
//
//  Created by Mark Ferlatte on 9/10/14.
//  Copyright (c) 2014 Tetherpad. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "TPDWeakProxy.h"

@interface TPDWeakProxyTests : XCTestCase

@end

@implementation TPDWeakProxyTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testProxyReturnsSameResult {
    NSNumber *numberOne = [[NSNumber alloc] initWithInteger:1];
    id proxy = [[TPDWeakProxy alloc] initWithObject:numberOne];
    XCTAssertEqualObjects([numberOne stringValue], [proxy stringValue]);
}

@end
