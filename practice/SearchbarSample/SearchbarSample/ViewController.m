//
//  ViewController.m
//  SearchbarSample
//
//  Created by Woncheol on 2017. 3. 24..
//  Copyright © 2017년 fornew21c. All rights reserved.
//

#import "ViewController.h"
#import "TargetConditionals.h"


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [[UIDevice currentDevice] systemVersion];
    
#ifndef DEBUG
    NSLog(@"debug mode");
    
#else 
    NSLog(@"Realese mode");
#endif
    
  
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
