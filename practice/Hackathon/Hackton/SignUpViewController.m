//
//  SignUpViewController.m
//  Hackton
//
//  Created by abyssinaong on 2017. 3. 13..
//  Copyright © 2017년 KimYunseo. All rights reserved.
//

#import "SignUpViewController.h"
@import Firebase;
@interface SignUpViewController ()
<UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *idTF;
@property (weak, nonatomic) IBOutlet UITextField *passWordTF;
@property (weak, nonatomic) IBOutlet UITextField *pwConfirm;

@end

@implementation SignUpViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.idTF.tag = 0;
    self.idTF.delegate = self;
    self.passWordTF.tag = 1;
    self.passWordTF.delegate = self;
    self.pwConfirm.tag = 2;
    self.pwConfirm.delegate = self;
    
    UIBarButtonItem *leftBarItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemUndo target:self action:@selector(actionBack:)];
    
    self.navigationItem.leftBarButtonItem = leftBarItem;
    
}
-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    CGFloat h =  -self.view.frame.size.height/7;
    CGFloat width = self.view.frame.size.width;
    CGFloat height = self.view.frame.size.height;
    if (textField.tag == 0) {
        self.idTF.text = textField.text;
        [UIView animateWithDuration:0.5 animations:^{
            self.view.frame = CGRectMake(0, h, width, height);
        }];
        
        [self.idTF resignFirstResponder];
        [self.passWordTF becomeFirstResponder];
    } else if (textField.tag == 1) {
        self.passWordTF.text = textField.text;
        h += h;
        [UIView animateWithDuration:0.5 animations:^{
            self.view.frame = CGRectMake(0, h, width, height);
        }];
        [self.passWordTF resignFirstResponder];
        [self.pwConfirm becomeFirstResponder];
    } else if (textField.tag == 2) {
        self.pwConfirm.text = textField.text;
        [self.pwConfirm resignFirstResponder];
        [UIView animateWithDuration:0.8 animations:^{
            self.view.frame = CGRectMake(0, 0, width, height);
        }];
    } else {
        NSLog(@"오류입니다.");
    }
    
    return YES;
}

- (void)actionBack:(UIBarButtonItem *)sender{
    
    [self removeFromParentViewController];
    
}


- (IBAction)laterAction:(id)sender {
    
    [self.navigationController popViewControllerAnimated:YES];
    
}
- (IBAction)signUpAction:(id)sender {
    
    if ([self.passWordTF.text isEqualToString:self.pwConfirm.text]) {
        NSString *email = self.idTF.text;
        NSString *password = self.pwConfirm.text;
        [[FIRAuth auth]
         createUserWithEmail:email
         password:password
         completion:^(FIRUser *_Nullable user,
                      NSError *_Nullable error) {
             if (error)
             {
                 UIAlertController *temp = [UIAlertController alertControllerWithTitle:@"가입오류" message:@"비밀번호가 일치하지 않거나, 같은 이메일이 존재합니다." preferredStyle:UIAlertControllerStyleAlert];
                 UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"확인" style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {
                     NSLog(@"확인");
                 }];
                 
                 [temp addAction:okAction];
                 return;
             } else {
                 [self.navigationController popViewControllerAnimated:YES];
             }
         }];
    }
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
