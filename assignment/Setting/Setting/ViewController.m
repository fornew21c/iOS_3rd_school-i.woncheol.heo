//
//  ViewController.m
//  Setting
//
//  Created by Woncheol on 2017. 2. 22..
//  Copyright © 2017년 fornew21c. All rights reserved.
//

#import "ViewController.h"
#import "TableContents.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.navigationItem.title = @"Main";
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(self.view.frame.size.width/2 -40, self.view.frame.size.height/2 -20, 80, 40);
    [btn setTitle:@"Setting" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    btn.layer.borderWidth = 1;
    [self.view addSubview:btn];
    [btn addTarget:self action:@selector(btnTouched:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)btnTouched:(UIButton*) sender
{
    TableContents *tableContents = [[TableContents alloc] init];
    [self.navigationController pushViewController:tableContents animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
