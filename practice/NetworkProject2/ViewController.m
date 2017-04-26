//
//  ViewController.m
//  NetworkProject
//
//  Created by Woncheol on 2017. 3. 16..
//  Copyright © 2017년 fornew21c. All rights reserved.
//

#import "ViewController.h"
#import "MainViewController.h"
#import "SignUpViewController.h"
#import "DataCenter.h"

@interface ViewController ()
<UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *idTextField;
@property (weak, nonatomic) IBOutlet UITextField *pwTextField;

@property (weak, nonatomic) IBOutlet UIButton *signInBtnTouched;
@property (weak, nonatomic) IBOutlet UIButton *signUpBtnTouched;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.idTextField.tag = 1;
    self.idTextField.delegate = self;
    
    
    self.pwTextField.tag = 2;
    self.pwTextField.delegate = self;
    self.pwTextField.secureTextEntry = YES;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)signInBtnTouched:(UIButton *)sender {
    //session 생성
    NSURLSession *session = [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
    
    //Request 생성
    NSURL *url = [NSURL URLWithString:@"https://fc-ios.lhy.kr/api/member/login/"];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    
    //Data 생성
    //NSString *username = [[NSUserDefaults standardUserDefaults] objectForKey:@"username"];
  

    
//    NSString *username = @"mtest1";
//    NSString *password = @"m1q2w3e4r";
    NSString *username = self.idTextField.text;
    NSString *password = self.pwTextField.text;
    NSString *noteDataString = [NSString stringWithFormat:@"username=%@&password=%@", username, password];
    
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
             NSLog(@"responsData: %@", responseData);
            NSLog(@"response: %@", response);
             //status code 추출
             NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse *) response;
             NSUInteger statusCode = (NSUInteger) [httpResponse statusCode];
             // 받은 header들을 dictionary형태로 받음
             //NSDictionary *responseHeaderFields = [(NSHTTPURLResponse *)response allHeaderFields];

             if(statusCode == 200) {
                 NSLog(@"로그인 성공");
                 NSLog(@"key: %@", [responseData objectForKey:@"key"]);;
                 [[DataCenter sharedInstance] setMyLoginToken:[responseData objectForKey:@"key"]];
                 dispatch_async(dispatch_get_main_queue(), ^{
                     MainViewController *mainView = [self.storyboard instantiateViewControllerWithIdentifier:@"MainViewController"];
                     [self.navigationController pushViewController:mainView animated:YES];
                 });
             }
             else if(statusCode == 400) {
                 NSLog(@"%@", [responseData objectForKey:@"non_field_errors"]);
                 dispatch_async(dispatch_get_main_queue(), ^{
                     UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"로그인 에러" message:@"로그인에 실패하였습니다." preferredStyle:UIAlertControllerStyleAlert];
                     
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
    }
    return YES;
}

//- (BOOL)shouldPerformSegueWithIdentifier:(NSString *)identifier sender:(id)sender{
//    
//    if ([identifier isEqualToString:@"segue_to_main"]) {
//        //로그인
//        
//        return YES;
//    }else
//    {
//        return NO;
//    }
//    
//}



- (IBAction)signUpBtnTouched:(UIButton *)sender {
//    SignUpViewController *signUpView = [self.storyboard instantiateViewControllerWithIdentifier:@"SignUpViewController"];
//    [self.navigationController pushViewController:signUpView animated:YES];
}

@end
