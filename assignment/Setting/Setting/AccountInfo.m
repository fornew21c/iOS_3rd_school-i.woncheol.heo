//
//  AccountInfo.m
//  Setting
//
//  Created by Woncheol on 2017. 2. 22..
//  Copyright © 2017년 fornew21c. All rights reserved.
//

#import "AccountInfo.h"

@interface AccountInfo ()

@end

@implementation AccountInfo

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.navigationItem.title = @"NAVER";
    
    UIButton *logoutBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    logoutBtn.frame = CGRectMake(20, 220, self.view.frame.size.width-40, 60);
    [logoutBtn setTitle:@"로그아웃" forState:UIControlStateNormal];
    logoutBtn.titleLabel.font = [UIFont systemFontOfSize:20];
    [logoutBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [logoutBtn setBackgroundColor:[UIColor greenColor]];
    [self.view addSubview:logoutBtn];
    
    UIButton *onceLoginBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    onceLoginBtn.frame = CGRectMake(20, 290, self.view.frame.size.width-40, 60);
    [onceLoginBtn setTitle:@"일회용 로그인 번호 받기" forState:UIControlStateNormal];
    [onceLoginBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [onceLoginBtn setBackgroundColor:[UIColor lightGrayColor]];
    [self.view addSubview:onceLoginBtn];
    
    
    
    
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
