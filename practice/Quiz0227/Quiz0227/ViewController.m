//
//  ViewController.m
//  Quiz0227
//
//  Created by Woncheol on 2017. 2. 27..
//  Copyright © 2017년 fornew21c. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
<UITextFieldDelegate, UITableViewDelegate>
@property UITextField *tf;
@property UILabel *resultLabel;

@property NSUInteger cnt;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    // Do any additional setup after loading the view, typically from a nib.
    self.tf = [[UITextField alloc] initWithFrame:CGRectMake(100, 50, 150, 50)];
    self.tf.layer.borderWidth = 1;
    self.tf.delegate = self;
    [self.view addSubview:self.tf];
    
    self.resultLabel = [[UILabel alloc] initWithFrame:CGRectMake(100, 110, 200, 50)];
    self.resultLabel.text = @"결과: ";
    [self.view addSubview:self.resultLabel];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    NSUInteger cnt = 0; // 약수갯수 입력하는 변수, cnt == 2이면 소수
    NSUInteger primeNumCnt = 0;
    NSUInteger num = [textField.text integerValue];
    for(NSUInteger i = 1; i < num; i++) {
        cnt = 0;
        for(NSUInteger j = 1; j <= i; j++) {
            if(i % j == 0) {
                cnt++;
            }
        }
        if(cnt == 2) {
            NSLog(@"%lu", i);
            primeNumCnt++;
        }
    }

    self.resultLabel.text = @"결과: ";
    self.resultLabel.text = [NSString stringWithFormat:@"%@ %ld", self.resultLabel.text, primeNumCnt];
    self.tf.text = @"";
    
    return YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
