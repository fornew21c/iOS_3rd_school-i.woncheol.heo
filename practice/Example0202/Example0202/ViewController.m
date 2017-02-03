//
//  ViewController.m
//  Example0202
//
//  Created by Woncheol on 2017. 2. 2..
//  Copyright © 2017년 fornew21c. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property UIView *myView;
@property UIView *subView3;
//@property UIView *uiView1;
//@property UIView *uiView2;
//@property UIView *uiView3;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
//    UIView *myView = [[UIView alloc] initWithFrame:CGRectMake(100, 100, 100, 300)];
//    myView.backgroundColor = [UIColor blueColor];
//    myView.clipsToBounds = YES;
//    myView.alpha = 0.8;
//   // [myView changeColor];
//    [self.view addSubview:myView];
//    
//    UIView *subView = [[UIView alloc] init];
//    subView.frame = CGRectMake(10, 30, 200, 200);
//    [subView setBackgroundColor:[UIColor redColor]];
//    
//    [myView addSubview:subView];
    
//    UIView *subView2 = [[UIView alloc] initWithFrame:CGRectMake(15, 15, self.view.frame.size.width - 30, 100)];
//    subView2.backgroundColor = [UIColor blueColor];
//    [self.view addSubview:subView2];
//    
//    UIView *subView3 = [[UIView alloc] initWithFrame:CGRectMake(15, 552, 345, 100)];
//    subView3.backgroundColor = [UIColor redColor];
//    [self.view addSubview:subView3];
    
//    UIView *uiview1 = [[UIView alloc] initWithFrame:CGRectMake(self.view.frame.origin.x + 15, self.view.frame.origin.y + 15, self.view.frame.size.width - 30, self.view.frame.size.height -30)];
//    uiview1.backgroundColor = [UIColor blueColor];
//    [self.view addSubview:uiview1];
//    
//    
//    UIView *uiview2 = [[UIView alloc] initWithFrame:CGRectMake(15, 15, uiview1.frame.size.width - 30, uiview1.frame.size.height -30)];
//    uiview2.backgroundColor = [UIColor redColor];
//    [uiview1 addSubview:uiview2];
//    
//    UIView *uiview3 = [[UIView alloc] initWithFrame:CGRectMake(15, 15, uiview2.frame.size.width - 30, uiview2.frame.size.height -30)];
//    uiview3.backgroundColor = [UIColor greenColor];
//    [uiview2 addSubview:uiview3];
    
    

    
    
//    UIView *subview1 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 64)];
//    subview1.backgroundColor = [UIColor redColor];
//    [self.view addSubview:subview1];
//    
//    UIView *subview2 = [[UIView alloc] initWithFrame:CGRectMake(0, self.view.frame.size.height-48, self.view.frame.size.width, 48)];
//    subview2.backgroundColor = [UIColor greenColor];
//    [self.view addSubview:subview2];


    UIView *subview1 = [[UIView alloc] initWithFrame:CGRectMake(self.view.center.x-50 , self.view.center.y-50, 90, 10)];
    subview1.backgroundColor = [UIColor redColor];
    [self.view addSubview:subview1];
    
    UIView *subview2 = [[UIView alloc] initWithFrame:CGRectMake(self.view.center.x-50 , self.view.center.y-40, 10, 90)];
    subview2.backgroundColor = [UIColor grayColor];
    [self.view addSubview:subview2];
    
    UIView *subview3 = [[UIView alloc] initWithFrame:CGRectMake(self.view.center.x-40 , self.view.center.y+40, 90, 10)];
    subview3.backgroundColor = [UIColor greenColor];
    [self.view addSubview:subview3];
    
    UIView *subview4 = [[UIView alloc] initWithFrame:CGRectMake(self.view.center.x+40 , self.view.center.y-50, 10, 90)];
    subview4.backgroundColor = [UIColor blueColor];
    [self.view addSubview:subview4];

    
//    UIView *subview1 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 80)];
//    subview1.backgroundColor = [UIColor redColor];
//    [self.view addSubview:subview1];
//    
//    UIView *subview2 = [[UIView alloc] initWithFrame:CGRectMake(10, 10, 60, 60)];
//    subview2.backgroundColor = [UIColor greenColor];
//    [subview1 addSubview:subview2];
//    
//    UIView *subview3 = [[UIView alloc] initWithFrame:CGRectMake(80, 10, self.view.frame.size.width-90, 60)];
//    subview3.backgroundColor = [UIColor blueColor];
//    [subview1 addSubview:subview3];
    

    

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    
}

- (void)changeColor{
    self.subView3.backgroundColor = [UIColor whiteColor];
}

@end
