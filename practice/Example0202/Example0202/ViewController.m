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


//    UIView *subview1 = [[UIView alloc] initWithFrame:CGRectMake(self.view.center.x-50 , self.view.center.y-50, 90, 10)];
//    subview1.backgroundColor = [UIColor redColor];
//    [self.view addSubview:subview1];
//    
//    UIView *subview2 = [[UIView alloc] initWithFrame:CGRectMake(self.view.center.x-50 , self.view.center.y-40, 10, 90)];
//    subview2.backgroundColor = [UIColor grayColor];
//    [self.view addSubview:subview2];
//    
//    UIView *subview3 = [[UIView alloc] initWithFrame:CGRectMake(self.view.center.x-40 , self.view.center.y+40, 90, 10)];
//    subview3.backgroundColor = [UIColor greenColor];
//    [self.view addSubview:subview3];
//    
//    UIView *subview4 = [[UIView alloc] initWithFrame:CGRectMake(self.view.center.x+40 , self.view.center.y-50, 10, 90)];
//    subview4.backgroundColor = [UIColor blueColor];
//    [self.view addSubview:subview4];

    
    UIView *subview1 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 80)];
    subview1.backgroundColor = [UIColor redColor];
    [self.view addSubview:subview1];
    
    UIView *subview2 = [[UIView alloc] initWithFrame:CGRectMake(10, 10, 60, 60)];
    subview2.backgroundColor = [UIColor greenColor];
    [subview1 addSubview:subview2];
    
    UIView *subview3 = [[UIView alloc] initWithFrame:CGRectMake(80, 10, self.view.frame.size.width-90, 40)];
    subview3.backgroundColor = [UIColor blueColor];
    [subview1 addSubview:subview3];
    
    UIView *subview4 = [[UIView alloc] initWithFrame:CGRectMake(80, 60, self.view.frame.size.width-90, 10)];
    subview4.backgroundColor = [UIColor blueColor];
    [subview1 addSubview:subview4];

    
//    UIView *subview1 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 168)];
//    subview1.backgroundColor = [UIColor grayColor];
//    [self.view addSubview:subview1];
//    
//    UIView *subview2 = [[UIView alloc] initWithFrame:CGRectMake(self.view.center.x-40, 128, 80, 80)];
//    subview2.backgroundColor = [UIColor redColor];
//    [self.view addSubview:subview2];
//    
//    UIView *subview3 = [[UIView alloc] initWithFrame:CGRectMake(self.view.center.x-40, 211, 80, 25)];
//    subview3.backgroundColor = [UIColor greenColor];
//    [self.view addSubview:subview3];
//
//    UIView *subview4 = [[UIView alloc] initWithFrame:CGRectMake(self.view.center.x-40, 238, 80, 13)];
//    subview4.backgroundColor = [UIColor greenColor];
//    [self.view addSubview:subview4];
//    
//    UIView *subview5 = [[UIView alloc] initWithFrame:CGRectMake(0, 268, self.view.frame.size.width/4, 45)];
//    subview5.backgroundColor = [UIColor blackColor];
//    [self.view addSubview:subview5];
//
//    UIView *subview6 = [[UIView alloc] initWithFrame:CGRectMake(self.view.frame.size.width/4, 268, self.view.frame.size.width/4, 45)];
//    subview6.backgroundColor = [UIColor redColor];
//    [self.view addSubview:subview6];
//
//    UIView *subview7 = [[UIView alloc] initWithFrame:CGRectMake(self.view.frame.size.width/2, 268, self.view.frame.size.width/4, 45)];
//    subview7.backgroundColor = [UIColor blueColor];
//    [self.view addSubview:subview7];
//    
//    UIView *subview8 = [[UIView alloc] initWithFrame:CGRectMake(self.view.frame.size.width*0.75, 268, self.view.frame.size.width/4, 45)];
//    subview8.backgroundColor = [UIColor greenColor];
//    [self.view addSubview:subview8];
//    
//    UIView *subview9 = [[UIView alloc] initWithFrame:CGRectMake(5, 5, subview8.frame.size.width-10,15)];
//    subview9.backgroundColor = [UIColor grayColor];
//    [subview5 addSubview:subview9];
//    
//    UIView *subview10 = [[UIView alloc] initWithFrame:CGRectMake(5, 25, subview8.frame.size.width-10,15)];
//    subview10.backgroundColor = [UIColor grayColor];
//    [subview5 addSubview:subview10];
//  
//    UIView *subview11 = [[UIView alloc] initWithFrame:CGRectMake(5, 5, subview8.frame.size.width-10,15)];
//    subview11.backgroundColor = [UIColor grayColor];
//    [subview6 addSubview:subview11];
//    
//    UIView *subview12 = [[UIView alloc] initWithFrame:CGRectMake(5, 25, subview8.frame.size.width-10,15)];
//    subview12.backgroundColor = [UIColor grayColor];
//    [subview6 addSubview:subview12];
//  
//    UIView *subview13 = [[UIView alloc] initWithFrame:CGRectMake(5, 5, subview8.frame.size.width-10,15)];
//    subview13.backgroundColor = [UIColor grayColor];
//    [subview7 addSubview:subview13];
//    
//    UIView *subview14 = [[UIView alloc] initWithFrame:CGRectMake(5, 25, subview8.frame.size.width-10,15)];
//    subview14.backgroundColor = [UIColor grayColor];
//    [subview7 addSubview:subview14];
//    
//    UIView *subview15 = [[UIView alloc] initWithFrame:CGRectMake(5, 5, subview8.frame.size.width-10,15)];
//    subview15.backgroundColor = [UIColor grayColor];
//    [subview8 addSubview:subview15];
//    
//    UIView *subview16 = [[UIView alloc] initWithFrame:CGRectMake(5, 25, subview8.frame.size.width-10,15)];
//    subview16.backgroundColor = [UIColor grayColor];
//    [subview8 addSubview:subview16];
    

    

    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    
}

- (void)changeColor{
    self.subView3.backgroundColor = [UIColor whiteColor];
}

@end
