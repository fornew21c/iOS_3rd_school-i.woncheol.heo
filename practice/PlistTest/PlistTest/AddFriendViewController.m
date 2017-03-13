//
//  AddFriendViewController.m
//  PlistTest
//
//  Created by Woncheol on 2017. 3. 3..
//  Copyright © 2017년 fornew21c. All rights reserved.
//

#import "AddFriendViewController.h"
#import "DataCenter.h"
@interface AddFriendViewController ()

@end

@implementation AddFriendViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.navigationItem.title = @"친구 추가";
    
//    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 50, 50)];
//    [btn setTitle:@"확인" forState:UIControlStateNormal];
//    [btn addTarget:self action:@selector(addBtnTouched) forControlEvents:UIControlEventTouchUpInside];
//    UIBarButtonItem *rightBarButton = [[UIBarButtonItem alloc] initWithCustomView:btn];
    
    UIBarButtonItem *rightBarButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(addBtnTouched)];
    self.navigationItem.rightBarButtonItem = rightBarButton;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)addBtnTouched {
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *basePath = [paths objectAtIndex:0];
    NSString *docuPath = [basePath stringByAppendingString:@"Friend.plist"];
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    if(![fileManager fileExistsAtPath:docuPath]) {
        NSString *bundlePath = [[NSBundle mainBundle] pathForResource:@"Sample" ofType:@"plist"];
        [fileManager copyItemAtPath:bundlePath toPath:docuPath error:nil];
    }
    NSMutableArray *list = [NSMutableArray arrayWithContentsOfFile:docuPath];
    NSMutableDictionary *dic = [[NSMutableDictionary alloc] init];
   
    NSLog(@"addBtnTouched: %@", self.name.text);
    if([self.name.text isEqualToString:@""]) {
        NSLog(@"이름이 입력되지 않았습니다.");
        return;
    }

    if([self.cellPhone.text isEqualToString:@""]) {
        NSLog(@"전화번호가 입력되지 않았습니다.");
        return;
    }
    [dic setObject:self.name.text forKey:@"Name"];
    [dic setObject:self.cellPhone.text forKey:@"cellPhone"];
    [list addObject:dic];
    
    [list writeToFile:docuPath atomically:NO];
    
    [self.navigationController popViewControllerAnimated:YES];
    
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
