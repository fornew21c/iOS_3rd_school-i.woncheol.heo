//
//  ImageView.m
//  Setting
//
//  Created by Woncheol on 2017. 2. 22..
//  Copyright © 2017년 fornew21c. All rights reserved.
//

#import "ImageView.h"
#import "DataCenter.h"

@interface ImageView ()

@end

@implementation ImageView

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
//    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(20, 30, self.view.frame.size.width-40, self.view.frame.size.height*0.6)];
//    imageView.contentMode = UIViewContentModeScaleAspectFit;
//    imageView.image = [UIImage imageNamed:@"cocacola.jpg"];
//    [self.view addSubview:imageView];
//    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(self.view.frame.size.width/2 - 40, self.view.frame.size.height*0.7, 80, 50);
    button.layer.borderWidth = 2;
    
    [button setTitle:@"닫기" forState:UIControlStateNormal];
    button.backgroundColor = [UIColor blackColor];
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [button addTarget:self action:@selector(closeBtnActioned) forControlEvents:UIControlEventTouchUpInside];
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:button];
    
    UILabel *resultLabel1 = [[UILabel alloc] initWithFrame:CGRectMake(20,20, self.view.frame.size.width -40, 70)];
    //resultLabel1.text = [DataCenter sharedInstance].swichStr1;
    resultLabel1.text = [NSString stringWithFormat:@"%@" ,[[[NSUserDefaults standardUserDefaults] objectForKey:@"switcher1"] boolValue]? @"ON":@"OFF"];
    resultLabel1.numberOfLines = 3;
    resultLabel1.layer.borderWidth = 1;
    resultLabel1.textColor = [UIColor blackColor];
    [self.view addSubview:resultLabel1];
    
    UILabel *resultLabel2 = [[UILabel alloc] initWithFrame:CGRectMake(20,100, self.view.frame.size.width -40, 70)];
    resultLabel2.text = [NSString stringWithFormat:@"%@" ,[[[NSUserDefaults standardUserDefaults] objectForKey:@"switcher2"] boolValue]? @"ON":@"OFF"];
    resultLabel2.numberOfLines = 3;
    resultLabel2.layer.borderWidth = 1;
    resultLabel2.textColor = [UIColor blackColor];
    [self.view addSubview:resultLabel2];
 
    UILabel *resultLabel3 = [[UILabel alloc] initWithFrame:CGRectMake(20,180, self.view.frame.size.width -40, 70)];
    resultLabel3.text = [NSString stringWithFormat:@"%@" ,[[[NSUserDefaults standardUserDefaults] objectForKey:@"switcher3"] boolValue]? @"ON":@"OFF"];
    resultLabel3.numberOfLines = 3;
    resultLabel3.layer.borderWidth = 1;
    resultLabel3.textColor = [UIColor blackColor];
    [self.view addSubview:resultLabel3];
    
    UILabel *resultLabel4 = [[UILabel alloc] initWithFrame:CGRectMake(20,260, self.view.frame.size.width -40, 70)];
    resultLabel4.text = [NSString stringWithFormat:@"%@" ,[[[NSUserDefaults standardUserDefaults] objectForKey:@"switcher4"] boolValue]? @"ON":@"OFF"];
    resultLabel4.numberOfLines = 3;
    resultLabel4.layer.borderWidth = 1;
    resultLabel4.textColor = [UIColor blackColor];
    [self.view addSubview:resultLabel4];
    
    UILabel *resultLabel5 = [[UILabel alloc] initWithFrame:CGRectMake(20,340, self.view.frame.size.width -40, 70)];
    resultLabel5.text = [NSString stringWithFormat:@"%@" ,[[[NSUserDefaults standardUserDefaults] objectForKey:@"switcher5"] boolValue]? @"ON":@"OFF"];
    resultLabel5.numberOfLines = 3;
    resultLabel5.layer.borderWidth = 1;
    resultLabel5.textColor = [UIColor blackColor];
    [self.view addSubview:resultLabel5];
}

- (void)closeBtnActioned
{
    [self dismissViewControllerAnimated:YES completion:nil];
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
