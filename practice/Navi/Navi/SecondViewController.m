//
//  SecondViewController.m
//  Navi
//
//  Created by Woncheol on 2017. 2. 21..
//  Copyright © 2017년 fornew21c. All rights reserved.
//

#import "SecondViewController.h"

@interface SecondViewController ()

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.navigationItem.title = @"Second View";
    [self.navigationController.navigationBar setBarTintColor:[UIColor purpleColor]];
    
    UIButton *backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    backBtn.frame = CGRectMake(0, 0, 35, 35);
    [backBtn setImage:[UIImage imageNamed:@"back1.ico"] forState:UIControlStateNormal];
    [backBtn setImage:[UIImage imageNamed:@"back2"] forState:UIControlStateHighlighted];
    [backBtn addTarget:self action:@selector(backBtnTouched:) forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem *leftButtonItem = [[UIBarButtonItem alloc] initWithCustomView:backBtn];
    self.navigationItem.leftBarButtonItem = leftButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)backBtnTouched:(UIButton *)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
