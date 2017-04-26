//
//  DataCenter.m
//  NetworkProject
//
//  Created by Woncheol on 2017. 3. 17..
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

- (void)setMyLoginToken:(NSString*) token
{
    self.loginToken = token;
}

- (NSString*)getMyLoginToken
{
    return self.loginToken;
}
@end
