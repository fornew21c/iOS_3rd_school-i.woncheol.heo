//
//  DataCenter.m
//  PlistTest
//
//  Created by Woncheol on 2017. 3. 3..
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

- (NSArray*)getSample {
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"Sample" ofType:@"plist"];
    self.list = [NSArray arrayWithContentsOfFile:filePath];

    return self.list;
}

- (NSUInteger)getCount {
    
    return self.list.count;
}
@end
