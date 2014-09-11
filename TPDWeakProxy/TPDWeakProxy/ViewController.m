//
//  ViewController.m
//  TPDWeakProxy
//
//  Created by Mark Ferlatte on 9/10/14.
//  Copyright (c) 2014 Tetherpad. All rights reserved.
//

#import "ViewController.h"
#import "TPDWeakProxy.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSNumber *number = @1;
    id proxy = [[TPDWeakProxy alloc] initWithObject:number];
    NSLog(@"number: %@", [number stringValue]);
    NSLog(@"proxy: %@", [proxy stringValue]);

    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
