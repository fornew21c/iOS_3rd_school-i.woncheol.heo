//
//  ViewController.m
//  TabbarExmaple
//
//  Created by Woncheol on 2017. 2. 21..
//  Copyright © 2017년 fornew21c. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(100, 100, 100, 50);
    
    [self.view addSubview:btn];
    
    UITabBarItem *item1 = [[UITabBarItem alloc] initWithTitle:@"테스트1" image:[UIImage imageNamed:@"icon1"] selectedImage:[UIImage imageNamed:@"icon1"]  ];
    self.tabBarItem = item1;
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
