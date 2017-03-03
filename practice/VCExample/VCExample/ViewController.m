//
//  ViewController.m
//  VCExample
//
//  Created by Woncheol on 2017. 2. 20..
//  Copyright © 2017년 fornew21c. All rights reserved.
//

#import "ViewController.h"
#import "SecondViewController.h"
#import "XSecondViewController.h"
#import "SecondViewController2.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    UIButton *nextBtn = [[UIButton alloc] initWithFrame:CGRectMake(30, 100, 100, 40)];
    [nextBtn addTarget:self action:@selector(onSelectedBtn) forControlEvents:UIControlEventTouchUpInside];
    [nextBtn setTitle:@"NEXT" forState:UIControlStateNormal];
    [nextBtn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [nextBtn setTitleColor:[UIColor greenColor] forState:UIControlStateHighlighted];
    [self.view addSubview:nextBtn];
}

- (void)onSelectedBtn {
    //Storyboard로 화면전환
    //1.스토리보드 객체 생성
    //UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
    
    //2. 뷰컨트롤러 객체 생성
    //UIViewController *sVC = [storyboard instantiateViewControllerWithIdentifier:@"SecondViewController"];
    
    //XSecondViewController *xVC = [[XSecondViewController alloc] init];
    XSecondViewController *xVC = [[XSecondViewController alloc] initWithNibName:@"XSecondViewController" bundle:nil];
    //3. 페이지 전환
    //[self presentViewController:sVC animated:YES completion:nil];
    //[xVC setModalTransitionStyle:UIModalTransitionStylePartialCurl];
    //[self presentViewController:xVC animated:YES completion:nil];
    //SecondViewController2 *sVC2 = [[SecondViewController2 alloc] init];
    //[self presentViewController:sVC2 animated:YES completion:nil];
    [self.navigationController pushViewController:xVC animated:YES];
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
