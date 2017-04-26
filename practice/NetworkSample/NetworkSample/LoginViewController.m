//
//  LoginViewController.m
//  NetworkSample
//
//  Created by Woncheol on 2017. 3. 15..
//  Copyright © 2017년 fornew21c. All rights reserved.
//

#import "LoginViewController.h"
#import "MainViewController.h"

@interface LoginViewController ()

@property (weak, nonatomic) IBOutlet UIButton *signInBtn;

@property (weak, nonatomic) IBOutlet UITextField *IDTextField;
@property (weak, nonatomic) IBOutlet UITextField *PWTextField;

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //[self.signInBtn setImage:[UIImage imageNamed:@"Field"] forState:UIControlStateNormal];
    [self.signInBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
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
- (IBAction)signInBtnTouched:(id)sender {
    
    //session 생성
    NSURLSession *session = [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
    
    //Request 생성
    NSURL *url = [NSURL URLWithString:@"https://fc-ios.lhy.kr/api/member/login/"];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    
    //Data 생성
    //NSString *username = [[NSUserDefaults standardUserDefaults] objectForKey:@"username"];
    NSString *username = self.IDTextField.text;
    NSString *password = self.PWTextField.text;
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
            //NSLog(@"responsData: %@", responseData);
            NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse *) response;
            NSUInteger statusCode = (NSUInteger) [httpResponse statusCode];
            NSDictionary *responseHeaderFields;
            
            NSLog(@"%lu", statusCode);
            // 받은 header들을 dictionary형태로 받고
            responseHeaderFields = [(NSHTTPURLResponse *)response allHeaderFields];
            if(statusCode == 200) {
                NSLog(@"성공");
          //      UIStoryboard *mainStoryboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
          //      ViewController *mainView = [mainStoryboard instantiateViewControllerWithIdentifier:@"ViewController"];
          //      [self.navigationController pushViewController:mainView animated:YES];
//                MainViewController *mainView = [self.storyboard instantiateViewControllerWithIdentifier:@"MainViewController"];
//                [self.navigationController pushViewController:mainView animated:YES];
                
                
            }
            else if(statusCode == 400) {
                NSLog(@"%@", [responseData objectForKey:@"non_field_errors"]);
                UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"로그인 에러" message:@"로그인에 실패하였습니다." preferredStyle:UIAlertControllerStyleAlert];
                
                UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"확인" style:UIAlertActionStyleDefault handler:nil];
            
                
                [alertController addAction:okAction];
                [self presentViewController:alertController animated:YES completion:nil];
                
            }
            
        }
        else {
            
        }
        
        
    }];
    [postDataTask resume];
    
                             
}

@end
