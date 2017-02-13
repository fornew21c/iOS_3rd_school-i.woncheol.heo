//
//  ViewController.m
//  Quiz0213
//
//  Created by Woncheol on 2017. 2. 13..
//  Copyright © 2017년 fornew21c. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
<UITextFieldDelegate>

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

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    NSMutableArray *list = [[NSMutableArray alloc] init];
    NSUInteger sum = 0;
    NSUInteger num = [textField.text integerValue];
    NSString *resultStr = [[NSString alloc] init];
    
    for(NSUInteger i = 0; i < textField.text.length; i++) {
        [list addObject:[textField.text substringWithRange:NSMakeRange(i,1)]];
    }
    
    for(NSUInteger i = 0; i < list.count; i++) {
        sum += [[list objectAtIndex:i] integerValue];
    }
    
    if(num % sum == 0) {
        resultStr = @"Harshad Number!";
        //[self.resultLabel.text stringByAppendingString:resultStr];
        //self.resultLabel.text = @"결과: Harshad Number!";
        self.resultLabel.text = [NSString stringWithFormat:@"%@ %@", self.resultLabel.text, resultStr];
    }
    else {
        self.resultLabel.text = @"결과: Not Harshad Number!";
    }
    return YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
