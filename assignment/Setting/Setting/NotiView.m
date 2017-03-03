//
//  NotiView.m
//  Setting
//
//  Created by Woncheol on 2017. 2. 27..
//  Copyright © 2017년 fornew21c. All rights reserved.
//

#import "NotiView.h"

@interface NotiView ()

@end

@implementation NotiView

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    UISwitch *swicher = [[UISwitch alloc] initWithFrame:CGRectMake(100, 100, 100, 50)];
    [self.view addSubview:swicher];
    [swicher addTarget:self action:@selector(swichValueChanged:) forControlEvents:UIControlEventValueChanged];
}

- (void)swichValueChanged:(UISwitch *) sender
{
    

    NSLog(@"swichValueChanged");
    [[NSNotificationCenter defaultCenter] postNotificationName:@"noti1" object:[NSNumber numberWithBool:sender.isOn]];
    
    
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
