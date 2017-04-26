//
//  ViewController.m
//  DynamicScrollview
//
//  Created by Woncheol on 2017. 4. 4..
//  Copyright © 2017년 fornew21c. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *myLabel;
@property (weak, nonatomic) IBOutlet UIButton *myButton;
@property (weak, nonatomic) IBOutlet UIImageView *myImage;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.myLabel.text = @"blablababbbbbbbbbbbb  blablababbbbbbbbbbbbblablababbbbbbbbbbbbblablababbbbbbbbbbbbblablababbbbbbbbbbbbblablababbbbbbbbbbbbblablababbbbbbbbbbbbblablababbbbbbbbbbbbblablababbbbbbbbbbbbblablababbbbbbbbbbbbblablababbbbbbbbbbbbblablababbbbbbbbbbbbblablababbbbbbbbbbbbblablababbbbbbbbbbbbblablababbbbbbbbbbbbblablababbbbbbbbbbbbblablababbbbbbbbbbbbblablababbbbbbbbbbbbblablababbbbbbbbbbbbblablababbbbbbbbbbbbblablababbbbbbbbbbbbblablababbbbbbbbbbbbblablababbbbbbbbbbbbblablababbbbbbbbbbbbblablababbbbbbbbbbbbblablababbbbbbbbbbbbblablababbbbbbbbbbbbblablababbbbbbbbbbbbblablababbbbbbbbbbbbblablababbbbbbbbbbbbblablababbbbbbbbbbbbblablababbbbbbbbbbbbblablababbbbbbbbbbbbblablababbbbbbbbbbbbblablababbbbbbbbbbbbblablababbbbbbbbbbbbblablababbbbbbbbbbbbblablababbbbbbbbbbbbblablababbbbbbbbbbbbblablababbbbbbbbbbbbblablababbbbbbbbbbbbblablababbbbbbbbbbbbblablababbbbbbbbbbbbblablababbbbbbbbbbbbblablababbbbbbbbbbbbblablababbbbbbbbbbbb";
    
    [self.myLabel sizeToFit];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
