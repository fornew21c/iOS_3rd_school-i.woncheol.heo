//
//  SignUpViewController.m
//  NetworkProject
//
//  Created by Woncheol on 2017. 3. 17..
//  Copyright © 2017년 fornew21c. All rights reserved.
//

#import "SignUpViewController.h"
#import "MainViewController.h"

@interface SignUpViewController ()
<UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *idTextField;
@property (weak, nonatomic) IBOutlet UITextField *pwTextField;
@property (weak, nonatomic) IBOutlet UITextField *confirmTextField;
@end

@implementation SignUpViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.idTextField.tag = 1;
    self.idTextField.delegate = self;
    
    
    self.pwTextField.tag = 2;
    self.pwTextField.delegate = self;
    self.pwTextField.secureTextEntry = YES;
    
    self.confirmTextField.tag = 3;
    self.confirmTextField.delegate = self;
    self.confirmTextField.secureTextEntry = YES;
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
- (IBAction)signUpBtnTouched:(UIButton *)sender {
    //session 생성
    NSURLSession *session = [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
    
    //Request 생성
    NSURL *url = [NSURL URLWithString:@"https://fc-ios.lhy.kr/api/member/signup/"];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    
    //Data 생성
    //NSString *username = [[NSUserDefaults standardUserDefaults] objectForKey:@"username"];
    
    NSString *username = self.idTextField.text;
    NSString *password = self.pwTextField.text;
    NSString *confirm = self.confirmTextField.text;
    NSString *noteDataString = [NSString stringWithFormat:@"username=%@&password1=%@&password2=%@", username, password, confirm];
    
    request.HTTPMethod = @"POST";
    request.HTTPBody = [noteDataString dataUsingEncoding:NSUTF8StringEncoding];
    
    //post Task 요청
    NSURLSessionUploadTask *postDataTask =
    [session uploadTaskWithRequest:request
                          fromData:nil
                 completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error)
     {
         if(error == nil) {
             NSDictionary *responseData = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil];
             
             NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse *) response;
             NSUInteger statusCode = (NSUInteger) [httpResponse statusCode];
             NSDictionary *responseHeaderFields = [(NSHTTPURLResponse *)response allHeaderFields];
             
             NSLog(@"responsData: %@", responseData);
             NSLog(@"statusCode: %lu", statusCode);
             // 받은 header들을 dictionary형태로 받고
             
             if(statusCode == 201) {
                 NSLog(@"회원가입 성공");
                 dispatch_async(dispatch_get_main_queue(), ^{
                     UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"회원가입 성공" message:@"회원가입에 성공하였습니다. 메인화면으로 이동하겠습니다." preferredStyle:UIAlertControllerStyleAlert];
                     

                     UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"확인" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                            dispatch_async(dispatch_get_main_queue(), ^{
                                MainViewController *mainView = [self.storyboard instantiateViewControllerWithIdentifier:@"MainViewController"];
                                [self.navigationController pushViewController:mainView animated:YES];
                            });

                     }];
                     
                     [alertController addAction:okAction];
                     [self presentViewController:alertController animated:YES completion:nil];

                 });
                 

                 dispatch_async(dispatch_get_main_queue(), ^{

                 });
             }
             else  {
                 NSLog(@"회원가입 실패");
                 NSLog(@"non_field_errors: %@", [responseData objectForKey:@"non_field_errors"]);
                 dispatch_async(dispatch_get_main_queue(), ^{
                     UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"회원가입 실패" message:@"회원가입에 실패하였습니다." preferredStyle:UIAlertControllerStyleAlert];
                     
                     UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"확인" style:UIAlertActionStyleDefault handler:nil];
                     
                     
                     [alertController addAction:okAction];
                     [self presentViewController:alertController animated:YES completion:nil];
                 });
             }
             
         }
         else {
             
         }
         
         
     }];
    [postDataTask resume];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    NSLog(@"tag: %lu", textField.tag);
    if(textField.tag == 1) {
        [self.idTextField resignFirstResponder];
        [self.pwTextField becomeFirstResponder];
    }
    else if(textField.tag == 2) {
        [self.pwTextField resignFirstResponder];
        [self.confirmTextField becomeFirstResponder];
    }
    else if(textField.tag == 3) {
        [self.confirmTextField resignFirstResponder];
    }
    return YES;
}
@end
