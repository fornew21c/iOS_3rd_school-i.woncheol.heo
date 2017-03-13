//
//  DataCenter.m
//  Hackerton
//
//  Created by Woncheol on 2017. 3. 9..
//  Copyright © 2017년 fornew21c. All rights reserved.
//

#import "DataCenter.h"

@implementation DataCenter
+ (instancetype)sharedInstance
{
    static DataCenter *dataCenter;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        dataCenter = [[self alloc] init];
    });
    
    return dataCenter;
}

- (void) setMyMainViewOption:(NSNumber*)newViewOption {
    [[NSUserDefaults standardUserDefaults] setObject:newViewOption forKey:@"VIEW_OPTION"];
}

- (NSNumber*) getMyMainViewOption {
    return self.mainViewOption;
}

+ (instancetype)singleton {
    
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
        
        [self settingData];
    }
    return self;
}


- (void)settingData {
    
    self.locationList = @[@"제주도",
                          @"전라남도",
                          @"경상북도",
                          @"경상남도",
                          @"충청북도",
                          @"경기도",
                          @"서울",
                          @"강원도",
                          @"충청남도",
                          ];
}
@end
