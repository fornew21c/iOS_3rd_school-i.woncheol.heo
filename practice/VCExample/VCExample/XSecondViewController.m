//
//  XSecondViewController.m
//  VCExample
//
//  Created by Woncheol on 2017. 2. 20..
//  Copyright © 2017년 fornew21c. All rights reserved.
//

#import "XSecondViewController.h"

@interface XSecondViewController ()

@end

@implementation XSecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    // Do any additional setup after loading the view.
    UIButton *previousBtn = [[UIButton alloc] initWithFrame:CGRectMake(30, 100, 100, 40)];
    [previousBtn addTarget:self action:@selector(onPreviousBtn) forControlEvents:UIControlEventTouchUpInside];
    [previousBtn setTitle:@"PREVIOUS" forState:UIControlStateNormal];
    [previousBtn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [previousBtn setTitleColor:[UIColor greenColor] forState:UIControlStateHighlighted];
    [self.view addSubview:previousBtn];
}

- (void)onPreviousBtn {
    //[self dismissViewControllerAnimated:YES completion:nil];
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
