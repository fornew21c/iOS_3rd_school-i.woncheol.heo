//
//  ViewController.m
//  GCDClass
//
//  Created by Woncheol on 2017. 2. 21..
//  Copyright © 2017년 fornew21c. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
<UITextFieldDelegate>

@property UITextField *num1Textfield;
@property UITextField *num2Textfield;
@property UILabel *resultLabel;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.num1Textfield = [[UITextField alloc] initWithFrame:CGRectMake(100, 80, 200, 50)];
    self.num1Textfield.layer.borderWidth = 1;
    self.num1Textfield.tag = 1;
    self.num1Textfield.delegate = self;
    self.num1Textfield.textAlignment = 2;
    [self.view addSubview:self.num1Textfield];
    
    self.num2Textfield = [[UITextField alloc] initWithFrame:CGRectMake(100, 140, 200, 50)];
    self.num2Textfield.layer.borderWidth = 1;
    self.num2Textfield.tag = 2;
    self.num2Textfield.delegate = self;
    self.num1Textfield.textAlignment = 2;
    [self.view addSubview:self.num2Textfield];
    
    self.resultLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, 230, 400, 50)];
    self.resultLabel.text = @"result: ";
    [self.view addSubview:self.resultLabel];

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    if(textField.tag == 1) {
        [self.num1Textfield resignFirstResponder];
        [self.num2Textfield becomeFirstResponder];
    }
    else if(textField.tag == 2) {
        NSUInteger num1 = [self.num1Textfield.text integerValue];
        NSUInteger num2 = [self.num2Textfield.text integerValue];
        NSUInteger GCD = [self getGCD:num1 num2:num2];
        NSUInteger LCM = [self getLCM:num1 num2:num2];
        self.resultLabel.text = [NSString stringWithFormat:@"result: 최대공약수는 %lu, 최소공배수는 %lu입니다.", GCD, LCM];
        
        
    }
    return YES;
}

// 최대공약수 구하는 메소드
- (NSUInteger) getGCD:(NSUInteger)num1 num2:(NSUInteger)num2
{
    NSUInteger GCD = 1;
    NSUInteger range;
    
    if(num1 < num2) {
        range =  num1;
    }
    else {
        range = num2;
    }
    for(NSUInteger i = range; i >= 1; i--){
        if(num1 % i == 0 && num2 % i == 0) {
            GCD = i;
            break;
        }
    }
    return GCD;
}

//최소공배수 구하는 메소드
- (NSUInteger) getLCM:(NSUInteger)num1 num2:(NSUInteger)num2
{
    NSUInteger LCM = 1;
    NSUInteger chkNum;
    
    if(num1 > num2) {
        chkNum =  num1;
    }
    else {
        chkNum = num2;
    }
    while(YES) {
        if(chkNum % num1 == 0 && chkNum % num2 == 0) {
            LCM = chkNum;
            break;
        }
        chkNum++;
    }
    return LCM;
}

@end
