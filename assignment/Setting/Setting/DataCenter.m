//
//  DataCenter.m
//  Setting
//
//  Created by Woncheol on 2017. 2. 23..
//  Copyright © 2017년 fornew21c. All rights reserved.
//

#import "DataCenter.h"

@implementation DataCenter

+ (instancetype)sharedInstance
{
    static DataCenter *dataCenter;


    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        dataCenter = [[DataCenter alloc] init];
    });
    return dataCenter;
    
}
- (instancetype)init
{
    self = [super init];
    if (self) {
//        self.swicher1 = (BOOL) [[NSUserDefaults standardUserDefaults] objectForKey:@"switcher1"];
//        self.swicher2 = (BOOL) [[NSUserDefaults standardUserDefaults] objectForKey:@"switcher2"];;
//        self.swicher3 = (BOOL) [[NSUserDefaults standardUserDefaults] objectForKey:@"switcher3"];;
//        self.swicher4 = (BOOL) [[NSUserDefaults standardUserDefaults] objectForKey:@"switcher4"];;
//        self.swicher5 = (BOOL) [[NSUserDefaults standardUserDefaults] objectForKey:@"switcher5"];;
//        NSLog(@"self.swicher1: %lu", (NSUInteger) self.swicher1);
//        self.swichStr1 = @"네이버앱을 기본 브라우저 설정이 Off되었습니다.";
//        self.swichStr2 = @"네이버 브라우저엔진(V2) 설정이 Off되었습니다.";
//        self.swichStr3 = @"글자 크게 보기 설정이 Off되었습니다.";
//        self.swichStr4 = @"웹페이지 팝업 차단 설정이 Off되었습니다.";
//        self.swichStr5 = @"링크 새창 열기 설정이 Off되었습니다.";
    }
    return self;
}

@end
