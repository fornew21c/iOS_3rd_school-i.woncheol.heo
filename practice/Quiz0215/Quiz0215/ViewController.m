//
//  ViewController.m
//  Quiz0215
//
//  Created by Woncheol on 2017. 2. 15..
//  Copyright © 2017년 fornew21c. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
<UITextFieldDelegate, UITableViewDelegate>
@property UITextField *tf;
@property UILabel *resultLabel;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.tf = [[UITextField alloc] initWithFrame:CGRectMake(100, 50, 150, 50)];
    self.tf.layer.borderWidth = 1;
    self.tf.delegate = self;
    [self.view addSubview:self.tf];
    
    self.resultLabel = [[UILabel alloc] initWithFrame:CGRectMake(100, 110, 200, 50)];
    self.resultLabel.text = @"결과: ";
    [self.view addSubview:self.resultLabel];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    NSUInteger num = [textField.text integerValue];
    NSUInteger sum = 0;
    
    for(NSUInteger i = 1; i <=num; i++) {
        if(num % i == 0) {
            sum += i;
        }
    }
    self.resultLabel.text = @"결과: ";
    self.resultLabel.text = [NSString stringWithFormat:@"%@ %ld", self.resultLabel.text, sum];
    self.tf.text = @"";
    return YES;
}

@end
