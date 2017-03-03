//
//  SignUpViewController.m
//  Example0207
//
//  Created by Woncheol on 2017. 2. 20..
//  Copyright © 2017년 fornew21c. All rights reserved.
//

#import "SignUpViewController.h"
#import "DataCenter.h"

@interface SignUpViewController ()
<UITextFieldDelegate, UIScrollViewDelegate>

@property UITextField *idTextField;
@property UITextField *pwTextField;
@property UITextField *reTextField;
@property UIScrollView *scrollView;
@property NSString *myId;
@property NSString *password;
@property UILabel *resultLabel;

@end

@implementation SignUpViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    UIView *baseView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height*0.35)];
    //baseView.backgroundColor = [UIColor greenColor];
    [self.view addSubview:baseView];
    
    UILabel *uiLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 100, baseView.frame.size.width, 100)];
    uiLabel.text = @"Signup Page";
    uiLabel.textColor = [UIColor blackColor];
    uiLabel.font = [UIFont systemFontOfSize:30];
    uiLabel.textAlignment = 1;
    [baseView addSubview:uiLabel];
    
    self.scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, baseView.frame.size.height, self.view.frame.size.width, 300)];
    //scrollView.backgroundColor = [UIColor greenColor];
    //scrollView.layer.borderWidth = 2;
    //scrollView.layer.borderColor = [UIColor redColor].CGColor;
    //self.scrollView.scrollEnabled = NO;
    [self.scrollView setContentSize:CGSizeMake(self.view.frame.size.width, 200)];
    [self.view addSubview:self.scrollView];
    
    UILabel *idLabel = [[UILabel alloc] initWithFrame:CGRectMake(50, 20, 35, 50)];
    idLabel.text = @"ID";
    idLabel.textColor = [UIColor blackColor];
    idLabel.textAlignment = 1;
    idLabel.font = [UIFont systemFontOfSize:20];
    [self.scrollView addSubview:idLabel];
    
    self.idTextField = [[UITextField alloc] initWithFrame:CGRectMake(100, 20, 200, 50)];
    self.idTextField.layer.borderWidth = 1;
    self.idTextField.tag = 1;
    self.idTextField.delegate = self;
    [self.scrollView addSubview:self.idTextField];
    
    UILabel *pwLabel = [[UILabel alloc] initWithFrame:CGRectMake(50, 80, 35, 50)];
    pwLabel.text = @"PW";
    pwLabel.textColor = [UIColor blackColor];
    pwLabel.textAlignment = 1;
    pwLabel.font = [UIFont systemFontOfSize:20];
    [self.scrollView addSubview:pwLabel];
    
    self.pwTextField = [[UITextField alloc] initWithFrame:CGRectMake(100, 80, 200, 50)];
    self.pwTextField.layer.borderWidth = 1;
    self.pwTextField.tag = 2;
    self.pwTextField.delegate = self;
    self.pwTextField.secureTextEntry = YES;
    [self.scrollView addSubview:self.pwTextField];
    
    UILabel *reLabel = [[UILabel alloc] initWithFrame:CGRectMake(50, 140, 35, 50)];
    reLabel.text = @"RE";
    reLabel.textColor = [UIColor blackColor];
    reLabel.textAlignment = 1;
    reLabel.font = [UIFont systemFontOfSize:20];
    [self.scrollView addSubview:reLabel];
    
    self.reTextField = [[UITextField alloc] initWithFrame:CGRectMake(100, 140, 200, 50)];
    self.reTextField.layer.borderWidth = 1;
    self.reTextField.tag = 3;
    self.reTextField.delegate = self;
    self.reTextField.secureTextEntry = YES;
    [self.scrollView addSubview:self.reTextField];
    
    self.resultLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, self.view.frame.size.height*0.85, self.view.frame.size.width, 100)];
    self.resultLabel.text = @"";
    self.resultLabel.font = [UIFont systemFontOfSize:25];
    self.resultLabel.textAlignment = 1;
    [self.view addSubview:self.resultLabel];
    
    UIButton *signUpBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    signUpBtn.frame = CGRectMake(self.view.frame.size.width/2-35, 200, 70, 40);
    [signUpBtn setTitle:@"Sign Up" forState:UIControlStateNormal];
    [signUpBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    signUpBtn.layer.borderWidth = 1;
    [signUpBtn addTarget:self action:@selector(signupBtnTouched:) forControlEvents:UIControlEventTouchUpInside];
    [self.scrollView addSubview:signUpBtn];

}
- (void)signupBtnTouched:(UIButton*) selector
{
    if([self.pwTextField.text isEqualToString:self.reTextField.text]) {
//        [DataCenter sharedInstance].ID = self.idTextField.text;
//        [[NSUserDefaults standardUserDefaults] setObject:[DataCenter sharedInstance].ID forKey:@"ID"];
//        [DataCenter sharedInstance].PW = self.pwTextField.text;
//        [[NSUserDefaults standardUserDefaults] setObject:[DataCenter sharedInstance].PW forKey:@"PW"];
        [[DataCenter sharedInstance] setMyID:self.idTextField.text];
        [[DataCenter sharedInstance] setMyPW:self.pwTextField.text];
 
        UIAlertController *alert=   [UIAlertController
                                      alertControllerWithTitle:@"회원가입완료"
                                      message:@"회원가입이 완료되었습니다. 로그인화면으로 전환됩니다."
                                      preferredStyle:UIAlertControllerStyleAlert];
        
        [self presentViewController:alert animated:YES completion:nil];
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [alert dismissViewControllerAnimated:YES completion:nil];
            [self.navigationController popViewControllerAnimated:YES];
        });
        
        
        
    }
    else {
        UIAlertController *alert=   [UIAlertController
                                     alertControllerWithTitle:@"비밀번호 불일치"
                                     message:@"비밀번호 확인이 일치하지 않습니다."
                                     preferredStyle:UIAlertControllerStyleAlert];
        
        [self presentViewController:alert animated:YES completion:nil];
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [alert dismissViewControllerAnimated:YES completion:nil];
        });
        NSLog(@"비밀번호 확인이 일치하지 않습니다.");
    }
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    [self.scrollView setContentOffset:CGPointMake(0, 20) animated:YES];
}

- (void)textFieldDidEndEditing:(UITextField *)textField
{
    if(textField.tag == 3) {
        [self.scrollView setContentOffset:CGPointMake(0, 0)];
    }
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    if(textField.tag == 1) {
        [self.idTextField resignFirstResponder];
        [self.pwTextField becomeFirstResponder];
    }
    else if(textField.tag == 2) {
        [self.pwTextField resignFirstResponder];
        [self.reTextField becomeFirstResponder];
    }
    else if(textField.tag == 3) {
        [self.reTextField resignFirstResponder];
    }
    return YES;
}

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
    
    //    NSLog(@"textFieldShouldBeginEditing: %lu", textField.text.length);
    //    if(textField.text.length > 10) {
    //        return NO;
    //    }
    self.resultLabel.text = @"";
    return YES;
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    
    NSLog(@"textFieldShouldBeginEditing: %lu", textField.text.length);
    if(textField.text.length > 10) {
        return NO;
    }
    return YES;
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
