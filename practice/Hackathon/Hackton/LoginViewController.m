//
//  LoginViewController.m
//  Hackton
//
//  Created by abyssinaong on 2017. 3. 13..
//  Copyright © 2017년 KimYunseo. All rights reserved.
//

#import "LoginViewController.h"
@import Firebase;

@interface LoginViewController ()
<UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *idTF;
@property (weak, nonatomic) IBOutlet UITextField *pwTF;

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.idTF.tag = 0;
    self.idTF.delegate = self;

    self.pwTF.tag =1;
    self.pwTF.delegate =self;
    
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    
    if (textField.tag == 0) {
        self.idTF.text = textField.text;
        [self.idTF resignFirstResponder];
        [UIView animateWithDuration:0.5 animations:^{
            self.view.frame = CGRectMake(0, -self.view.frame.size.height/5, self.view.frame.size.width, self.view.frame.size.height);
        }];
        
        [self.pwTF becomeFirstResponder];
    } else if (textField.tag == 1) {
        self.pwTF.text = textField.text;
        [UIView animateWithDuration:0.5 animations:^{
            self.view.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
        }];
        [self.pwTF resignFirstResponder];
        
    } else {
        
        NSLog(@"오류입니다.");
        
    }
    
    return YES;
}
- (IBAction)loginBtnAction:(id)sender {
    
    [[FIRAuth auth] signInWithEmail:_idTF.text
                           password:_pwTF.text
                         completion:^(FIRUser *user, NSError *error) {
                             if (error)
                             {
                                 UIAlertController *temp = [UIAlertController alertControllerWithTitle:@"인증오류" message:@"아이디 혹은 비밀번호가 일치하지 않습니다." preferredStyle:UIAlertControllerStyleAlert];
                                 UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"확인" style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {
                                     NSLog(@"확인");
                                 }];

                                 [temp addAction:okAction];
                                 
                                 [self presentViewController:temp animated:YES completion:nil];
                                 return;
                             } else {
                                 [self.navigationController popViewControllerAnimated:YES];
                                 
                             }
                         }];
    
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
