//
//  ViewController.m
//  Navi
//
//  Created by Woncheol on 2017. 2. 21..
//  Copyright © 2017년 fornew21c. All rights reserved.
//

#import "ViewController.h"
#import "SecondViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
//    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
//    [btn setTitle:@"button" forState:UIControlStateNormal];
//    btn.backgroundColor = [UIColor greenColor];
//    btn.frame = CGRectMake(20, 100, 100, 100);
//    [self.view addSubview:btn];
    self.navigationItem.title = @"My Navi";
    [self.navigationController.navigationBar setBarTintColor:[UIColor lightGrayColor]];
    
    UIButton *backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    backBtn.frame = CGRectMake(0, 0, 35, 35);
    [backBtn setImage:[UIImage imageNamed:@"back1.ico"] forState:UIControlStateNormal];
    [backBtn setImage:[UIImage imageNamed:@"back2"] forState:UIControlStateHighlighted];
//    [backBtn addTarget:self action:@selector(backBtnTouched:) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *menuBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    menuBtn.frame = CGRectMake(0, 0, 35, 35);
    [menuBtn setImage:[UIImage imageNamed:@"menu"] forState:UIControlStateNormal];
   //[menuBtn setImage:[UIImage imageNamed:@"arrowbackdua"] forState:UIControlStateHighlighted];
    //[menuBtn addTarget:self action:@selector(menuBtnTouched) forControlEvents:UIControlEventTouchUpInside];
    
    //UIBarButtonItem *leftButtonItem = [[UIBarButtonItem alloc] initWithCustomView:backBtn];
    
    UIBarButtonItem *leftButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAction target:self action:@selector(leftBtnTouched:)];
    self.navigationItem.leftBarButtonItem = leftButtonItem;
    
    //UIBarButtonItem *rightButtonItem = [[UIBarButtonItem alloc] initWithCustomView:menuBtn];
    UIBarButtonItem *rightButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemEdit target:self action:@selector(menuBtnTouched)];
    self.navigationItem.rightBarButtonItem = rightButtonItem;
    self.navigationController.toolbarHidden = YES;
}

- (void)leftBtnTouched:(UIButton *) sender
{
    SecondViewController *sVC = [[SecondViewController alloc] init];
    [self.navigationController pushViewController:sVC animated:YES];
    NSLog(@"back btn touched");
}

- (void)menuBtnTouched
{
    NSLog(@"menu btn touched");
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
