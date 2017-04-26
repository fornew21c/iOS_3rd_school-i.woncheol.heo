//
//  ViewController.m
//  BloackSample2
//
//  Created by Woncheol on 2017. 3. 23..
//  Copyright © 2017년 fornew21c. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
//    [self simpleMethod:^(NSString *name) {
//        NSLog(@"inner Param %@", name);
//    }];
    
    self.simpleMethod(@"aaaa");
    
}

- (void)simpleMethod:(void(^)(NSString *name))param
{
    NSLog(@"before StarBlock");
    param(@"in param");
    NSLog(@"after EndBlock");
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
