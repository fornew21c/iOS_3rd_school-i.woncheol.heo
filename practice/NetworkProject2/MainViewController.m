//
//  MainViewController.m
//  NetworkProject
//
//  Created by Woncheol on 2017. 3. 16..
//  Copyright © 2017년 fornew21c. All rights reserved.
//

#import "MainViewController.h"
#import "ViewController.h"
#import "AddViewController.h"
#import "DataCenter.h"
//#import <AFNetworking/AFNetworking.h>

@interface MainViewController ()

<UITableViewDelegate,UITableViewDataSource>
@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //[self.navigationItem setHidesBackButton:YES];
    UIBarButtonItem *rightBarButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addBarButtonTouched)];
    
    self.navigationItem.rightBarButtonItem = rightBarButton;
    
    self.navigationItem.leftBarButtonItem = nil;
    self.navigationItem.hidesBackButton = YES;
    
    [self getList];
  
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:YES];
    NSLog(@"viewDidAppear");
    [self.listTableView reloadData];
}

- (void)getList {
    NSLog(@"getList");
    //session 생성
    NSURLSession *session = [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];

    //Request 생성
    NSURL *url = [NSURL URLWithString:@"https://fc-ios.lhy.kr/api/post/"];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    
    //Header 세팅
    [request setValue:@"1" forHTTPHeaderField: @"page"];
    
    //Data 생성
    request.HTTPMethod = @"GET";
    
    //post Task 요청

    NSURLSessionDataTask *getDataTask = [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if(error == nil) {
            NSDictionary *responseData = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil];
            NSLog(@"responseData_count: %@", [responseData objectForKey:@"count"]);
            NSLog(@"responseData: %@", responseData);
            self.postList = [responseData objectForKey:@"results"];
            //NSLog(@"responseData result: %@", [[[responseData objectForKey:@"results"] objectAtIndex:0] objectForKey:@"content"]);
            NSLog(@"count : %lu", self.postList.count);
            dispatch_async(dispatch_get_main_queue(), ^{
                [self.listTableView reloadData];
            });
        }
        else if(error != nil) {
            
        }
    }];
    
    [getDataTask resume];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)addBarButtonTouched {
    AddViewController *addView = [self.storyboard instantiateViewControllerWithIdentifier:@"AddViewController"];
    [self.navigationController pushViewController:addView animated:YES];
}

- (IBAction)signOutBtnTouched:(id)sender {
    NSLog(@"signOutBtnTouched");
    NSURLSession *session = [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
    
    //Request 생성
    NSURL *url = [NSURL URLWithString:@"https://fc-ios.lhy.kr/api/member/logout/"];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    
    NSString *loginToken = [[DataCenter sharedInstance] getMyLoginToken];
 
    // 헤더 세팅
    [request setValue:[NSString stringWithFormat:@"token %@", loginToken] forHTTPHeaderField:@"Authorization"];
    
    
    request.HTTPBody = [@"" dataUsingEncoding:NSUTF8StringEncoding];
    request.HTTPMethod = @"POST";
    
    //post Task 요청
    NSURLSessionUploadTask *postDataTask = [session uploadTaskWithRequest:request
                                                                 fromData:nil
                                                        completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if(error == nil) {
            NSDictionary *responseData = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil];
            NSLog(@"responseData: %@", responseData);
            
            NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse *) response;
            NSUInteger statusCode = (NSUInteger) [httpResponse statusCode];
            //NSDictionary *responseHeaderFields = [(NSHTTPURLResponse *)response allHeaderFields];
            
            NSLog(@"statusCode: %lu", statusCode);
            NSLog(@"responseHeaderFields: %@", response);
            if(statusCode == 200) {
                dispatch_async(dispatch_get_main_queue(), ^{
                    [self.navigationController popViewControllerAnimated:YES];
//                    ViewController *loginView = [self.storyboard instantiateViewControllerWithIdentifier:@"ViewController"];
//                    [self presentViewController:loginView animated:YES completion:nil];
                });
            }
        }
        else {
            NSLog(@"error: %@", error);
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

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.postList.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    if(cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"cell"];
    }
    
    cell.textLabel.text = [[self.postList objectAtIndex:indexPath.row] objectForKey:@"title"];
    NSString *imgURL = [[self.postList objectAtIndex:indexPath.row] objectForKey:@"img_cover"];
    NSData *imgData = [NSData dataWithContentsOfURL:[NSURL URLWithString:imgURL]];
    
    cell.imageView.image = [UIImage imageWithData:imgData];
    return cell;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    [self.listTableView reloadData];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 75;
}
@end
