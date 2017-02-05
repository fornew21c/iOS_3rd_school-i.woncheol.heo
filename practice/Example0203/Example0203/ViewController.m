//
//  ViewController.m
//  Example0203
//
//  Created by Woncheol on 2017. 2. 3..
//  Copyright © 2017년 fornew21c. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    UIView *subview1 = [[UIView alloc] initWithFrame:CGRectMake(10, 30, self.view.frame.size.width-20, 80)];
    //subview1.backgroundColor = [UIColor grayColor];
    subview1.layer.borderColor = [UIColor grayColor].CGColor;
    subview1.layer.borderWidth = 1;
    [self.view addSubview:subview1];
    
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(10, 10, 60, 60)];
    imageView.image = [UIImage imageNamed:@"godmina.jpg"];
    imageView.contentMode = UIViewContentModeScaleToFill;
    [subview1 addSubview:imageView];
    
    UILabel *titleView = [[UILabel alloc] initWithFrame:CGRectMake(80, 10, self.view.frame.size.width-90, 40)];
    titleView.text = @"민아신 짱!!!";
    titleView.textColor = [UIColor purpleColor];
    //titleView.textColor = [UIColor colorWithRed:100/255.0 green:100/255.0  blue:100/255.0  alpha:0.8];
    titleView.font = [UIFont systemFontOfSize:35];
    [subview1 addSubview:titleView];
    
    UILabel *subTitleView = [[UILabel alloc] initWithFrame:CGRectMake(80, 60, self.view.frame.size.width-90, 10)];
    subTitleView.text = @"민아신 내일 그대와 출연확정";
    subTitleView.textColor = [UIColor redColor];
    subTitleView.font = [UIFont systemFontOfSize:15];
    [subview1 addSubview:subTitleView];
    
    NSUInteger offsetY = subview1.frame.size.height + 50;

    
    UIButton *uiBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    uiBtn.layer.borderWidth = 1;
    uiBtn.frame = CGRectMake(subview1.frame.size.width/2 - 50, offsetY, 100, 35);
    [uiBtn setImage:[UIImage imageNamed:@"godmina.jpg"] forState:UIControlStateNormal];
//    [uiBtn.imageView setFrame:CGRectMake(5, 5, 30, 30)];
//    [uiBtn.imageView setContentMode:UIViewContentModeScaleAspectFit];
    [uiBtn setTitle:@"Touch me" forState:UIControlStateNormal];
    
    [uiBtn setTitleColor:[UIColor purpleColor] forState:UIControlStateNormal];
    [uiBtn setTitle:@"Let me free" forState:UIControlStateHighlighted];
    [uiBtn addTarget:self action:@selector(actionForTouchEvent:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:uiBtn];
}

- (void)actionForTouchEvent:(UIButton *)sender {
    NSLog(@"버튼에서 손을 땠네요");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
