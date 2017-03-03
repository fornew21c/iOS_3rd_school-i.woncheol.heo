//
//  ViewController.m
//  Example0207
//
//  Created by Woncheol on 2017. 2. 7..
//  Copyright © 2017년 fornew21c. All rights reserved.
//

#import "ViewController.h"
#import "SignUpViewController.h"
#import "DataCenter.h"
#import "TableContents.h"

@interface ViewController ()
<UITextFieldDelegate, UIScrollViewDelegate>

@property UITextField *idTextField;
@property UITextField *pwTextField;
@property UIScrollView *scrollView;
@property NSString *myId;
@property NSString *password;
@property UILabel *resultLabel;
@property UIView *footView;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
//    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
//    [scrollView setContentSize:CGSizeMake(scrollView.frame.size.width, scrollView.frame.size.height*3)];
//    scrollView.delegate = self;
//    scrollView.pagingEnabled = YES;
//    [self.view addSubview:scrollView];
//    
//    UIView *uiView1 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
//    uiView1.backgroundColor = [UIColor greenColor];
//    [scrollView addSubview:uiView1];
//    
//    UIView *uiView2 = [[UIView alloc] initWithFrame:CGRectMake(0, scrollView.frame.size.height, self.view.frame.size.width, self.view.frame.size.height)];
//    uiView2.backgroundColor = [UIColor redColor];
//    [scrollView addSubview:uiView2];
//    
//    UIView *uiView3= [[UIView alloc] initWithFrame:CGRectMake(0, scrollView.frame.size.height*2, self.view.frame.size.width, self.view.frame.size.height)];
//    uiView3.backgroundColor = [UIColor blueColor];
//    [scrollView addSubview:uiView3];
    
    UIView *baseView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height*0.35)];
    [self.view addSubview:baseView];
    
    UILabel *uiLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 100, baseView.frame.size.width, 100)];
    uiLabel.text = @"My Login Page";
    uiLabel.textColor = [UIColor blackColor];
    uiLabel.font = [UIFont systemFontOfSize:30];
    uiLabel.textAlignment = 1;
    [baseView addSubview:uiLabel];
    
    self.scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, baseView.frame.size.height, self.view.frame.size.width, 200)];
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
    
    UIButton *loginBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    loginBtn.frame = CGRectMake(120, 140, 70, 40);
    [loginBtn setTitle:@"Login" forState:UIControlStateNormal];
    [loginBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    loginBtn.layer.borderWidth = 1;
    [loginBtn addTarget:self action:@selector(loginBtnTouched:) forControlEvents:UIControlEventTouchUpInside];
    [self.scrollView addSubview:loginBtn];
    
    self.resultLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, self.view.frame.size.height*0.85, self.view.frame.size.width, 100)];
    self.resultLabel.text = @"";
    self.resultLabel.font = [UIFont systemFontOfSize:25];
    self.resultLabel.textAlignment = 1;
    [self.view addSubview:self.resultLabel];
    
    UIButton *registerBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    registerBtn.frame = CGRectMake(200, 140, 70, 40);
    [registerBtn setTitle:@"Sign Up" forState:UIControlStateNormal];
    [registerBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    registerBtn.layer.borderWidth = 1;
    [registerBtn addTarget:self action:@selector(signUpBtnTouched:) forControlEvents:UIControlEventTouchUpInside];
    [self.scrollView addSubview:registerBtn];
    
    self.footView = [[UIView alloc] initWithFrame:CGRectMake(0, self.view.frame.size.height-50, self.view.frame.size.width, 50)];
    self.footView.backgroundColor = [UIColor purpleColor];
    [self.view addSubview:self.footView];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(getNoti:) name:@"notiKey" object:nil];
    [NSNotificationCenter.defaultCenter addObserver:self selector:@selector(getSystemNoti:) name:UIKeyboardWillShowNotification object:nil];
   [NSNotificationCenter.defaultCenter addObserver:self selector:@selector(getSystemNoti2:) name:UIKeyboardWillHideNotification object:nil];
}

- (void)getSystemNoti:(NSNotification *) notiSender
{
   
    CGSize keyboardSize = [[notiSender.userInfo objectForKey:UIKeyboardFrameBeginUserInfoKey] CGRectValue].size;
    CGRect originFrame = self.footView.frame;
    
    [UIView animateWithDuration:5 animations:^{
        //NSLog(@"%ld",originFrame.origin.y - keyboardSize.height);
        self.footView.frame = CGRectMake(originFrame.origin.x, originFrame.origin.y - keyboardSize.height, originFrame.size.width, originFrame.size.height);
    }];
}

- (void)getSystemNoti2:(NSNotification *) notiSender
{
    
    CGSize keyboardSize = [[notiSender.userInfo objectForKey:UIKeyboardFrameBeginUserInfoKey] CGRectValue].size;
    CGRect originFrame = self.footView.frame;
    
    [UIView animateWithDuration:5 animations:^{
        //NSLog(@"%ld",originFrame.origin.y - keyboardSize.height);
        self.footView.frame = CGRectMake(originFrame.origin.x, originFrame.origin.y + keyboardSize.height, originFrame.size.width, originFrame.size.height);
    }];
}


- (void)getNoti:(NSNotification *) notiSender {
    NSLog(@"Notification call");
    NSLog(@"object: %@", notiSender.object);
    NSLog(@"dictionary: %@", notiSender.userInfo);
}
- (void)loginBtnTouched:(UIButton*) sender
{
//    self.myId = @"fornew21c";
//    self.password = @"1234";
    
    [self.scrollView setContentOffset:CGPointMake(0, 20) animated:YES];
    

//    if([self.myId isEqualToString:self.idTextField.text] && [self.password isEqualToString:self.pwTextField.text])
//    {
//        self.resultLabel.text = @"로그인에 성공하셨습니다.";
//    }
//    else if(![self.myId isEqualToString:self.idTextField.text]) {
//        self.resultLabel.text = @"ID가 존재하지 않습니다.";
//    }
//    else if(![self.password isEqualToString:self.pwTextField.text]) {
//        self.resultLabel.text = @"비밀번호가 틀립니다.";
//    }
    
    [DataCenter sharedInstance].ID = [[NSUserDefaults standardUserDefaults] objectForKey:@"ID"];
    [DataCenter sharedInstance].PW = [[NSUserDefaults standardUserDefaults] objectForKey:@"PW"];
    
    if( [[DataCenter sharedInstance].ID isEqualToString:self.idTextField.text] && [[DataCenter sharedInstance].PW  isEqualToString:self.pwTextField.text])
    {
        self.resultLabel.text = @"로그인에 성공하셨습니다.";
        UIAlertController *alert=   [UIAlertController
                                      alertControllerWithTitle:@"로그인 성공"
                                      message:@"초기화면으로 이동합니다."
                                      preferredStyle:UIAlertControllerStyleAlert];
        
        [self presentViewController:alert animated:YES completion:nil];
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [alert dismissViewControllerAnimated:YES completion:nil];
            TableContents *tableContents = [[TableContents alloc] init];
            [self.navigationController pushViewController:tableContents animated:YES];
        });
    }
    else if(![[DataCenter sharedInstance].ID isEqualToString:self.idTextField.text]) {
        self.resultLabel.text = @"ID가 존재하지 않습니다.";
    }
    else if(![[DataCenter sharedInstance].PW  isEqualToString:self.pwTextField.text]) {
        self.resultLabel.text = @"비밀번호가 틀립니다.";
    }
}

- (void)signUpBtnTouched:(UIButton *) sender
{
    SignUpViewController *signUpVC = [[SignUpViewController alloc] initWithNibName:@"SignUpViewController" bundle:nil];
    [self.navigationController pushViewController:signUpVC animated:YES];
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    
    NSLog(@"scrollViewDidScroll");
}

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    NSLog(@"scrollViewWillBeginDragging");
}

- (void)scrollViewWillEndDragging:(UIScrollView *)scrollView withVelocity:(CGPoint)velocity targetContentOffset:(inout CGPoint *)targetContentOffset
{
    
    NSLog(@"scrollViewWillEndDragging");
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
    if(textField.tag == 2) {
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
//        [UIView animateWithDuration:1 animations:^{
//            CGRect originFrame = self.footView.frame;
//            self.footView.frame = CGRectMake(originFrame.origin.x, self.view.frame.size.height - 50, originFrame.size.width, originFrame.size.height);
//        }];
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

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}


@end
