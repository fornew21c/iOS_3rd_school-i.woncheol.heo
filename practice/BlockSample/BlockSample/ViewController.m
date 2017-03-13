//
//  ViewController.m
//  BlockSample
//
//  Created by Woncheol on 2017. 3. 10..
//  Copyright © 2017년 fornew21c. All rights reserved.
//

#import "ViewController.h"
#import "BlockView.h"

typedef NSUInteger number;

@interface ViewController ()
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self testMethod];
    [self testMethod2];
    
    void (^simpleBlock)(void);
    
    simpleBlock = ^{
        NSLog(@"This is a block");
    };
    
    simpleBlock();
    
    void (^simpleBlock2)(void) = ^{
        NSLog(@"This is a simple block2");
    };
    
    simpleBlock2();
    
    NSUInteger multiplier = 7;
    
    NSUInteger (^myBlock)(NSUInteger) = ^(NSUInteger num) {
        return num * multiplier;
    };
    
    NSLog(@"Return value is %lu", myBlock(7));
    
    CGFloat (^multiplyTowValues)(CGFloat, CGFloat) = ^(CGFloat num1, CGFloat num2) {
        return num1*num2;
    };
    
    CGFloat result = multiplyTowValues(5.5, 7.5);
    
    NSLog(@"Result is %lf", result);
    
    [self simpleMethod:^(NSString *name) {
        NSLog(@"inner Param %@", name);
    }];
    
    [self simpleMethod:^(NSString *name) {
        NSLog(@"inner Param22222 %@", name);
    }];
    
    BlockView *customView = [[BlockView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height) withAction:^NSString *{
        
        return @"aaaaaaa";
    }];
    
    
    
    
//    customView.backgroundColor = [UIColor purpleColor];
//    
//    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
//    button.backgroundColor = [UIColor whiteColor];
//    button addT
//    button.frame = CGRectMake(100, 100, 100, 50);
    
//    [customView addSubview:button];
//    [self.view addSubview:customView];
    
    [self.view addSubview:customView];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)testMethod {
    NSUInteger integer = 42;
    
    void(^testBlock)(void) = ^{
        NSLog(@"Integer is: %lu", integer);
    };
    
    integer = 84;
    testBlock();
}

- (void)testMethod2 {
    __block NSUInteger integer = 42;
    
    void (^testBlock)(void) = ^{
        NSLog(@"Integr is: %lu", integer);
        integer = 100;
    };
    
    testBlock();
    NSLog(@"Original integer:%lu", integer);
}

- (void)simpleMethod:(void(^)(NSString *name))param
{
    NSLog(@"before StartBlock");
    
    param(@"in Block");
    
    NSLog(@"after EndBlock");
}




@end
