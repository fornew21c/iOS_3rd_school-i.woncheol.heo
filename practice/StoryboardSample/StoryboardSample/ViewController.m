//
//  ViewController.m
//  StoryboardSample
//
//  Created by Woncheol on 2017. 2. 27..
//  Copyright © 2017년 fornew21c. All rights reserved.
//

#import "ViewController.h"
#import "CustomView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.customView1.backgroundColor = [UIColor lightGrayColor];
    
    
    //self.customView1.imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"arrow"]];
   // [imageView setFrame:self.customView1.imageView.frame];
   // [image setBackgroundColor:[UIColor redColor]];
    //[self.customView1 addSubview:imageView];

    self.customView1.imageView.image = [UIImage imageNamed:@"arrow"];
    //self.testView.backgroundColor = [UIColor redColor];
    //self.customView2.backgroundColor = [UIColor lightGrayColor];
    
    //self.customView3.backgroundColor = [UIColor lightGrayColor];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    //self.customView1.backgroundColor = [UIColor yellowColor];
}

- (IBAction) btnAction:(UIButton *) sender {
    [self.btn1 setTitle:@"버튼 터치" forState:UIControlStateNormal] ;
}

- (IBAction) btnAction2:(UIButton *) sender {
    [self.btn2 setTitle:@"버튼 터치2" forState:UIControlStateNormal] ;
}
@end
