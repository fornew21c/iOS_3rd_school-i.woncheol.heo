//
//  ContentController.m
//  Example0216
//
//  Created by Woncheol on 2017. 2. 16..
//  Copyright © 2017년 fornew21c. All rights reserved.
//

#import "ContentController.h"

@interface ContentController ()

@end

@implementation ContentController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(self.view.frame.size.width/2 - 40, self.view.frame.size.height*0.85, 80, 50);
    button.layer.borderWidth = 2;

    [button setTitle:@"닫기" forState:UIControlStateNormal];
    button.backgroundColor = [UIColor blackColor];
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [button addTarget:self action:@selector(closeBtnActioned) forControlEvents:UIControlEventTouchUpInside];
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:button];
    
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(20, 50, self.view.frame.size.width-40, self.view.frame.size.height * 0.6)];
    imageView.image = [UIImage imageNamed:self.selectedImageName];
    
    [self.view addSubview:imageView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)closeBtnActioned
{
    [self dismissViewControllerAnimated:YES completion:nil];
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
