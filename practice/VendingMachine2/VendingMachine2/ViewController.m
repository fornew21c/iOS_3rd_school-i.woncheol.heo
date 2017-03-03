//
//  ViewController.m
//  VendingMachine2
//
//  Created by Woncheol on 2017. 2. 27..
//  Copyright © 2017년 fornew21c. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *image1;
@property (weak, nonatomic) IBOutlet UIImageView *image2;
@property (weak, nonatomic) IBOutlet UIImageView *image3;
@property (weak, nonatomic) IBOutlet UIImageView *image4;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.image1.image = [UIImage imageNamed:@"cocacola.jpg"];
    self.image1.contentMode = UIViewContentModeScaleAspectFit;
    self.view1.layer.borderWidth = 1;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
