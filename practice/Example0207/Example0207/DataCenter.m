//
//  DataCenter.m
//  Example0207
//
//  Created by Woncheol on 2017. 2. 24..
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

- (void) setMyID:(NSString *)ID {
    [[NSUserDefaults standardUserDefaults] setObject:ID forKey:@"ID"];
}

- (void) setMyPW:(NSString *)PW{
    [[NSUserDefaults standardUserDefaults] setObject:PW forKey:@"PW"];
}

- (NSString*) getMyID
{
    return [[NSUserDefaults standardUserDefaults] objectForKey:@"ID"];
}

- (NSString*) getMyPW
{
    return [[NSUserDefaults standardUserDefaults] objectForKey:@"PW"];
}
@end
