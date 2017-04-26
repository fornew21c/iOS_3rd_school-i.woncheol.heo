//
//  AddViewController.m
//  NetworkProject
//
//  Created by Woncheol on 2017. 3. 17..
//  Copyright © 2017년 fornew21c. All rights reserved.
//

#import "AddViewController.h"
#import "DataCenter.h"

@interface AddViewController ()

@property (weak, nonatomic) IBOutlet UITextField *titleTextField;
@property (weak, nonatomic) IBOutlet UITextView *contentTextView;
@end

@implementation AddViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)uploadBtnTouched:(id)sender {
    NSString *boundary = @"BOUNDARY_STRING";
    NSMutableData *body = [NSMutableData data];
    
    //이미지
    [body appendData:[[NSString stringWithFormat:@"\r\n--%@\r\n", boundary] dataUsingEncoding:NSUTF8StringEncoding]];
    [body appendData:[[NSString stringWithFormat:@"Content-Disposition: form-data; name=\"img_cover\"; filename=\"jeju1.jpg\"\r\n"] dataUsingEncoding:NSUTF8StringEncoding]];
    [body appendData:[@"Content-Type: application/octet-stream\r\n\r\n" dataUsingEncoding:NSUTF8StringEncoding]];
    [body appendData:UIImageJPEGRepresentation([UIImage imageNamed:@"jeju1.jpg"], 0.5)];
 
    
    //타이틀
    [body appendData:[[NSString stringWithFormat:@"\r\n--%@\r\n", boundary] dataUsingEncoding:NSUTF8StringEncoding]];
    [body appendData:[[NSString stringWithFormat:@"Content-Disposition:form-data; name=\"title\"\r\n\r\n%@", @"title1010101010"] dataUsingEncoding:NSUTF8StringEncoding]];
    
    //컨텐츠
    [body appendData:[[NSString stringWithFormat:@"\r\n--%@\r\n", boundary] dataUsingEncoding:NSUTF8StringEncoding]];
    [body appendData:[[NSString stringWithFormat:@"Content-Disposition:form-data; name=\"content\"\r\n\r\n%@", @"content11"] dataUsingEncoding:NSUTF8StringEncoding]];
    [body appendData:[[NSString stringWithFormat:@"\r\n--%@\r\n", boundary] dataUsingEncoding:NSUTF8StringEncoding]];

    //session 생성
    NSURLSession *session = [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
    
    //Request 생성
    NSURL *url = [NSURL URLWithString:@"https://fc-ios.lhy.kr/api/post/"];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];

    
    // 헤더 세팅
    NSString *loginToken = [[DataCenter sharedInstance] getMyLoginToken];
    NSString* MultiPartContentType = [NSString stringWithFormat:@"multipart/form-data; boundary=%@", boundary];
    [request setValue:MultiPartContentType forHTTPHeaderField: @"Content-Type"];
    [request setValue:[NSString stringWithFormat:@"token %@", loginToken] forHTTPHeaderField:@"Authorization"];
    
    //Data 생성
    //NSString *noteDataString = [NSString stringWithFormat:@"username=%@&password=%@", username, password];
    //NSLog(@"body: %@", body);
    request.HTTPMethod = @"POST";
    
    //bady에 셋팅
    request.HTTPBody = body;

    
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
             // 받은 header들을 dictionary형태로 받음
             NSDictionary *responseHeaderFields = [(NSHTTPURLResponse *)response allHeaderFields];
             NSLog(@"responseHeaderFields: %@", responseHeaderFields);
             if(statusCode == 201) {
                 NSLog(@"쓰기 성공");
                 NSLog(@"responseData: %@", responseData);
//                 dispatch_async(dispatch_get_main_queue(), ^{
//                     MainViewController *mainView = [self.storyboard instantiateViewControllerWithIdentifier:@"MainViewController"];
//                     [self.navigationController pushViewController:mainView animated:YES];
//                 });
                 
                 
                 
             }
             else if(statusCode == 400) {
                 NSLog(@"%@", [responseData objectForKey:@"non_field_errors"]);
                 dispatch_async(dispatch_get_main_queue(), ^{
                     UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"쓰기 실패" message:@"쓰기실패하였습니다. 실패하였습니다." preferredStyle:UIAlertControllerStyleAlert];
                     
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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
