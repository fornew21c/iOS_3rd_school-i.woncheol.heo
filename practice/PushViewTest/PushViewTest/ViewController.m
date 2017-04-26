//
//  ViewController.m
//  PushViewTest
//
//  Created by Woncheol on 2017. 3. 16..
//  Copyright © 2017년 fornew21c. All rights reserved.
//

#import "ViewController.h"
#import "MainViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)btnTouched:(id)sender {
    NSUInteger flag = 2;
    
    if(flag == 1) {
        MainViewController *mainView = [self.storyboard instantiateViewControllerWithIdentifier:@"MainViewController"];
        [self.navigationController pushViewController:mainView animated:YES];
    }
    else {
        NSLog(@"꺼저");
    }
}

@end
