//
//  ViewController.m
//  Example0210
//
//  Created by Woncheol on 2017. 2. 10..
//  Copyright © 2017년 fornew21c. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
<UITextFieldDelegate>

@property UITextField *textfield;
@property UILabel *resultLabel;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    //NSArray *list = @[@"K",@"O",@"R",@"E",@"A"];
    NSArray *list = @[@"E",@"R",@"A",@"S",@"E",@"R"];
    //NSLog(@"%lu", list.count);
    NSUInteger halfIndex = list.count / 2;
    
    if(list.count % 2 == 0) {
       
        NSLog(@"%@", [list objectAtIndex:halfIndex-1]);
        NSLog(@"%@", [list objectAtIndex:halfIndex]);
        
    }
    else {
        NSLog(@"%@", [list objectAtIndex:halfIndex]);
    }
    
    self.textfield = [[UITextField alloc] initWithFrame:CGRectMake(50, 100, 100, 50)];
    self.textfield.layer.borderWidth = 1;
    self.textfield.delegate = self;
    [self.view addSubview:self.textfield];
    
    self.resultLabel = [[UILabel alloc] initWithFrame:CGRectMake(50, 160, 100, 50)];
    self.resultLabel.text = @"결과: ";
    [self.view addSubview:self.resultLabel];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    NSLog(@"%@", textField.text);
    NSMutableArray *list = [[NSMutableArray alloc] init];
    
    for(NSUInteger i = 0; i < textField.text.length; i++) {
        [list addObject:[textField.text substringWithRange:NSMakeRange(i,1)]];
    }
    NSUInteger halfIndex = list.count / 2;
    NSString *resultStr;
    if(list.count == 0) {
        self.resultLabel.text = @"문자를 입력해주세요.";
        return NO;
    }
    if(list.count % 2 == 0) {
        resultStr = [NSString stringWithFormat:@"%@%@", [list objectAtIndex:halfIndex-1], [list objectAtIndex:halfIndex]];
        
    }
    else {
        resultStr = [NSString stringWithFormat:@"%@", [list objectAtIndex:halfIndex]];
    }
    
    self.resultLabel.text = [NSString stringWithFormat:@"결과: %@", resultStr];
    
    //self.resultLabel.text = [textField.text stringByAppendingString:resultStr];
    [textField resignFirstResponder];
    
    return YES;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
