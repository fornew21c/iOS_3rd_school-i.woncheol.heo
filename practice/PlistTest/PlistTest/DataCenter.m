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

- (NSMutableArray*)getSample {
//    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"Sample" ofType:@"plist"];
//    self.list = [NSArray arrayWithContentsOfFile:filePath];
//
//    return self.list;
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *basePath = [paths objectAtIndex:0];
    NSString *docuPath = [basePath stringByAppendingString:@"Friend.plist"];
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    if(![fileManager fileExistsAtPath:docuPath]) {
        NSString *bundlePath = [[NSBundle mainBundle] pathForResource:@"Sample" ofType:@"plist"];
        [fileManager copyItemAtPath:bundlePath toPath:docuPath error:nil];
    }
    NSMutableArray *tmpList = [NSMutableArray arrayWithContentsOfFile:docuPath];
    return tmpList;
}

- (NSUInteger)getCount {
    
    return self.list.count;
}

//- (void)addData(NSMutableArray*)dic{
//    
//}

@end
