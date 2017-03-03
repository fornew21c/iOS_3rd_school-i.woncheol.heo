//
//  ViewController.m
//  Quiz0216
//
//  Created by Woncheol on 2017. 2. 16..
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
    self.cnt = 0;
    
//    while(YES) {
//        if(num % 2 == 0) {
//            num = num / 2;
//        }
//        else if(num % 2 == 1) {
//            num = num * 3 + 1;
//        }
//        cnt = cnt + 1;
//        if(num == 1)
//            break;
//    }
//    if(cnt > 500) {
//        cnt  = -1;
//    }
    //[self collatzConjecture:(NSUInteger)num];

    self.resultLabel.text = @"결과: ";
    self.resultLabel.text = [NSString stringWithFormat:@"%@ %ld", self.resultLabel.text, [self collatzConjecture:(NSUInteger)num]];
    self.tf.text = @"";

    return YES;
}

- (NSUInteger)collatzConjecture:(NSUInteger)num {
    self.cnt = self.cnt + 1;

    if(num % 2 == 0) {
        num = num / 2;
        if(num == 1) {
            return self.cnt;
        }
        else {
            [self collatzConjecture:(NSUInteger)num];
        }
    }
    else if(num % 2 == 1) {
        num = num * 3 + 1;
        if(num == 1) {
            return self.cnt;
        }
        else {
            [self collatzConjecture:(NSUInteger)num];
        }
    }
    
    if(self.cnt > 500) {
        self.cnt  = -1;
    }
    NSLog(@"count : %lu", self.cnt);
    return self.cnt;
}

- (NSUInteger)evenNumMethod:(NSUInteger)num {
    NSUInteger resultNum = num / 2;
    
    return resultNum;
}

- (NSUInteger)oddNumMethod:(NSUInteger)num  {
    NSUInteger resultNum = num * 3 +1;
    return resultNum;
}
@end
