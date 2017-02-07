//
//  ViewController.m
//  Example0206
//
//  Created by Woncheol on 2017. 2. 6..
//  Copyright © 2017년 fornew21c. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
<UITextFieldDelegate>

@property UIButton *beforeBtn;
@property UIButton *beforeBtn2;

@property UIButton *btn1;
@property UIButton *btn2;
@property UIButton *btn3;
@property UIButton *btn4;
@property UILabel *displayLabel;

@property UITextField *tf;
@property UILabel *displayLabel2;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
//    UIView *baseView = [[UIView alloc] initWithFrame:CGRectMake(10, 20, self.view.frame.size.width-20, self.view.frame.size.height/3)];
//    baseView.layer.borderWidth = 1;
//    [self.view addSubview:baseView];
//    
//    self.btn1 = [UIButton buttonWithType:(UIButtonTypeRoundedRect)];
//    self.btn1.frame = CGRectMake(10, 10, baseView.frame.size.width/2 - 20, baseView.frame.size.height/3 - 20);
//    self.btn1.layer.borderWidth = 1;
//    [self.btn1 setTitle:@"1번 버튼" forState:UIControlStateNormal];
//    [self.btn1 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
//    [self.btn1 setTitleColor:[UIColor grayColor] forState:UIControlStateHighlighted];
//    [self.btn1 addTarget:self action:@selector(actionForButtonTouched:) forControlEvents:UIControlEventTouchUpInside];
//    self.btn1.tag = 1;
//    [baseView addSubview:self.btn1];
//    
//    self.btn2 = [UIButton buttonWithType:(UIButtonTypeRoundedRect)];
//    self.btn2 .frame = CGRectMake(baseView.frame.size.width/2, 10, baseView.frame.size.width/2 - 20, baseView.frame.size.height/3 - 20);
//    self.btn2.layer.borderWidth = 1;
//    [self.btn2  setTitle:@"2번 버튼" forState:UIControlStateNormal];
//    [self.btn2  setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
//    [self.btn2  setTitleColor:[UIColor grayColor] forState:UIControlStateHighlighted];
//    self.btn2.tag = 2;
//    [self.btn2  addTarget:self action:@selector(actionForButtonTouched:) forControlEvents:UIControlEventTouchUpInside];
//    [baseView addSubview:self.btn2 ];
//    
//    self.btn3 = [UIButton buttonWithType:(UIButtonTypeRoundedRect)];
//    self.btn3.frame = CGRectMake(10, baseView.frame.size.height/3, baseView.frame.size.width/2 - 20, baseView.frame.size.height/3 - 20);
//    self.btn3 .layer.borderWidth = 1;
//    [self.btn3  setTitle:@"3번 버튼" forState:UIControlStateNormal];
//    [self.btn3  setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
//    [self.btn3  setTitleColor:[UIColor grayColor] forState:UIControlStateHighlighted];
//    self.btn3.tag = 3;
//    [self.btn3  addTarget:self action:@selector(actionForButtonTouched:) forControlEvents:UIControlEventTouchUpInside];
//    [baseView addSubview:self.btn3 ];
//
//    self.btn4 = [UIButton buttonWithType:(UIButtonTypeRoundedRect)];
//    self.btn4.frame = CGRectMake(baseView.frame.size.width/2, baseView.frame.size.height/3, baseView.frame.size.width/2 - 20, baseView.frame.size.height/3 - 20);
//    self.btn4 .layer.borderWidth = 1;
//    [self.btn4  setTitle:@"4번 버튼" forState:UIControlStateNormal];
//    [self.btn4  setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
//    [self.btn4  setTitleColor:[UIColor grayColor] forState:UIControlStateHighlighted];
//    self.btn4.tag = 4;
//    [self.btn4  addTarget:self action:@selector(actionForButtonTouched:) forControlEvents:UIControlEventTouchUpInside];
//    [baseView addSubview:self.btn4 ];
//    
//    self.displayLabel = [[UILabel alloc]initWithFrame:CGRectMake(10, baseView.frame.size.height*0.7, baseView.frame.size.width, 50)];
//    self.displayLabel.text = @"";
//    self.displayLabel.textAlignment = 1;
//    [baseView addSubview:self.displayLabel];
//    
//    UIView *baseView2 = [[UIView alloc] initWithFrame:CGRectMake(10, baseView.frame.size.height+30, self.view.frame.size.width/2, self.view.frame.size.height/3)];
//    baseView2.layer.borderWidth = 1;
//    [self.view addSubview:baseView2];
// 
//    UIButton *btn5 = [UIButton buttonWithType:UIButtonTypeCustom];
//    btn5.frame = CGRectMake(10, 20, 100, 50);
//    btn5.layer.borderWidth = 1;
//    [btn5 setTitle:@"unselected" forState:UIControlStateNormal];
//    [btn5 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
//    [btn5 setTitle:@"selected" forState:UIControlStateSelected];
//    [btn5 setTitleColor:[UIColor purpleColor] forState:UIControlStateSelected];
//    btn5.selected = NO;
//    [btn5 addTarget:self action:@selector(actionMethod:) forControlEvents:UIControlEventTouchUpInside];
//    [baseView2 addSubview:btn5];
//    
//    UIButton *btn6 = [UIButton buttonWithType:UIButtonTypeCustom];
//    btn6.frame = CGRectMake(10, 120, 100, 50);
//    btn6.layer.borderWidth = 1;
//    [btn6 setTitle:@"unselected" forState:UIControlStateNormal];
//    [btn6 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
//    [btn6 setTitle:@"selected" forState:UIControlStateSelected];
//    [btn6 setTitleColor:[UIColor purpleColor] forState:UIControlStateSelected];
//    btn6.selected = NO;
//    [btn6 addTarget:self action:@selector(actionMethod:) forControlEvents:UIControlEventTouchUpInside];
//    [baseView2 addSubview:btn6];
    
    self.tf = [[UITextField alloc] initWithFrame:CGRectMake(40, 50, 180, 35)];
    self.tf.borderStyle = UITextBorderStyleRoundedRect;
    self.tf.layer.borderWidth = 1;
    self.tf.placeholder = @"텍스트 입력";
    self.tf.delegate = self;
    [self.view addSubview:self.tf];
    
    UIButton *btn1 = [UIButton buttonWithType:UIButtonTypeCustom];
    btn1.frame = CGRectMake(250, 50, 50, 35);
    btn1.layer.borderWidth = 1;
    [btn1 setTitle:@"확인" forState:UIControlStateNormal];
    [btn1 setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [btn1 addTarget:self action:@selector(btn1Clicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn1];
    
    self.displayLabel2 = [[UILabel alloc] initWithFrame:CGRectMake(40, 85, 300, 50)];
    [self.view addSubview:self.displayLabel2];
    
    
    
    
    
    
    
    
    
    
    
//    UIView *baseView2 = [[UIView alloc] initWithFrame:CGRectMake(10, baseView.frame.size.height + 20, 50, 200)];
//    baseView2.layer.borderWidth = 1;
    
}

- (void)btn1Clicked:(UIButton *) sender {
    self.displayLabel2.text = [NSString stringWithFormat:@"결과: %@", self.tf.text];
    [self.tf resignFirstResponder];
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    
   self.displayLabel2.text = [NSString stringWithFormat:@"결과: %@", self.tf.text];
    return YES;
}
- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    self.displayLabel2.text = [NSString stringWithFormat:@"결과: %@", self.tf.text];
    [self.tf resignFirstResponder];
    
    return YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)actionMethod:(UIButton*) sender {
    
    if (![self.beforeBtn2 isEqual:sender]) {
        self.beforeBtn2.selected = NO;
    }
   
//    
//
//    
   // self.beforeBtn2 = sender;
    
    if(sender.isSelected) {
        NSLog(@"OOOOOOOOOOOOOOOOOOOOO");
        sender.selected = NO;
    }
    else if(!sender.isSelected) {
        NSLog(@"XXXXXXXXXXXXXXXXXXXXX");
        sender.selected = YES;
    }
    

        self.beforeBtn2 = sender;
}

- (void)actionForButtonTouched:(UIButton*) sender
{

    
    [self.beforeBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [sender setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];

    self.beforeBtn = sender;
    
    
    self.displayLabel.text = [NSString stringWithFormat:@"선택된 버튼은: %lu번 버튼", sender.tag];
    
    
}
- (void)actionForBtn1Touched {
    
    //[self.beforeBtn
    
    //[sender setTitleColor:[UIColor blackColor] forState:UIControlStateNormal]
    
   //self.beforeBtn = sender;
    
    [self.btn1 setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [self.btn2 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.btn3 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.btn4 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    
    self.displayLabel.text = [NSString stringWithFormat:@"선택된 버튼은: 1번 버튼"];

}

- (void)actionForBtn2Touched {
    [self.btn2 setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [self.btn1 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.btn3 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.btn4 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    
    self.displayLabel.text = [NSString stringWithFormat:@"선택된 버튼은: 2번 버튼"];
}

- (void)actionForBtn3Touched {
    [self.btn3 setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [self.btn1 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.btn2 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.btn4 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    
    self.displayLabel.text = [NSString stringWithFormat:@"선택된 버튼은: 3번 버튼"];
}

- (void)actionForBtn4Touched {
    [self.btn4 setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [self.btn1 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.btn2 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.btn3 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    
    self.displayLabel.text = [NSString stringWithFormat:@"선택된 버튼은: 4번 버튼"];
}




@end
