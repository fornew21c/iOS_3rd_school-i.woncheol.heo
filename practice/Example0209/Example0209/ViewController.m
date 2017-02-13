//
//  ViewController.m
//  Example0209
//
//  Created by Woncheol on 2017. 2. 9..
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
    
//    self.resultLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, 50, 200, 100)];
//    self.resultLabel.font = [UIFont systemFontOfSize:20];
//    [self.view addSubview:self.resultLabel];
//    
//    NSArray *array1 = [[NSArray alloc] initWithObjects:@"1",@"2",@"3",@"4",@"5", nil];
//    NSArray *array2 = @[@"1",@"2",@"3",@"4",@"5"];
//    
//    for(NSUInteger i = 0; i < array1.count; i++)
//    {
//        NSNumber *num = [array1 objectAtIndex:i];
//       // NSLog(@"%@", num);
//    }
//    
//    for(NSNumber *num in array2) {
//       // NSLog(@"%@", num);
//    }
//    
//    NSDictionary *dic1 = [[NSDictionary alloc] initWithObjects:@[@"value1",@"value2",@"value3"] forKeys:@[@"key1",@"key2",@"key3"]];
//    NSDictionary *dic2 = @{@"key1":@"value1",@"key2":@"value2",@"key3":@"value3"};
//    
//    NSString *resultStr = @"";
//    for(NSString *key in dic1) {
//        NSString *str = [dic2 objectForKey:key];
//        resultStr = [resultStr stringByAppendingString:[NSString stringWithFormat:@"%@|", str]];
//       // NSLog(@"%@", key);
//    }
//   // resultLabel.text = resultStr;
//    
//    self.tf = [[UITextField alloc] initWithFrame:CGRectMake(20, 200, 200, 50)];
//    self.tf.layer.borderWidth = 1;
//    self.tf.delegate = self;
//    [self.view addSubview:self.tf];
//    
//    UIButton *btn1 = [UIButton buttonWithType:UIButtonTypeCustom];
//    btn1.frame = CGRectMake(250, 200, 100, 50);
//    btn1.layer.borderWidth = 1;
//    [btn1 setTitle:@"button" forState:UIControlStateNormal];
//    [btn1 setTitleColor:[UIColor purpleColor] forState:UIControlStateNormal];
//    [btn1 addTarget:self action:@selector(btn1Touched) forControlEvents:UIControlEventTouchUpInside];
//    [self.view addSubview:btn1];
//    
//    NSUInteger num[7];
//    num[0] = 5;
//    num[1] = 3;
//    num[2] = 7;
//    num[3] = 1;
//    num[4] = 6;
//    num[5] = 9;
//    num[6] = 2;
    NSMutableArray *num = [[NSMutableArray alloc] initWithObjects:@5, @3, @7, @1, @6, @9, @2, nil];
    
//    NSLog(@"%@", num);
//    NSLog(@"After bubble sort");
//    NSLog(@"%@", [self bubbleSort:num]);
//    NSLog(@"After insert sort");
    //[self selectionSort:num];
    NSLog(@"%@", [self selectionSort:num]);
    
}

- (NSArray*)bubbleSort:(NSMutableArray*)num
{
    for(NSUInteger j = 0; j < num.count; j++) {
        for(NSUInteger i = 0; i < num.count-j-1; i++) {
            NSNumber *temp;
            if(num[i] > num[i+1]) {
                temp = num[i];
                num[i] = num[i+1];
                num[i+1] = temp;
            }
        }
    }
    
    return num;
}

- (NSArray*)selectionSort:(NSMutableArray*)num
{
    
   // NSMutableArray *sortedNum = [[NSMutableArray alloc] init];
    NSUInteger index;
   for(NSUInteger i = 0; i < num.count; i++){
       index = i;
        for(NSUInteger j = i+1; j < num.count; j++) {
            NSUInteger num1 = [[num objectAtIndex:index] integerValue];
            NSUInteger num2 = [[num objectAtIndex:j] integerValue];
            if(num1 > num2) {
                index = j;
            }
        }
        [num exchangeObjectAtIndex:index withObjectAtIndex:i];
    }
    return num;
}
- (NSArray*)insertSort:(NSMutableArray*)num
{
    return num;
}

- (void)btn1Touched{
    NSString *str = self.tf.text;
    self.resultLabel.text = @"";
    NSMutableArray *strArray = [[NSMutableArray alloc] init];
   // NSMutableArray *arrangedArray = [[NSMutableArray alloc] init];
    NSString *findStr = @"";
    
    //findStr = [findStr stringByAppendingString:@"1"];
    for(NSUInteger i = 0; i < str.length; i++) {
        strArray[i] = [str substringWithRange:NSMakeRange(i, 1)];
    }
    
    for(NSUInteger i = 0; i < strArray.count; i++) {
         //NSLog(@"%@", strArray[i]);
        BOOL isCheck = [findStr containsString:strArray[i]];
       
        if(isCheck == NO) {
           findStr = [findStr stringByAppendingString:strArray[i]];
            
            //NSLog(@"%@", findStr);
        }
    }
    
    self.resultLabel.text = findStr;
    //NSLog(@"%@", findStr);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [self.tf resignFirstResponder];
    [self btn1Touched];
    return YES;
    
}

@end
