//
//  DataCenter.h
//  Hackerton
//
//  Created by Woncheol on 2017. 3. 9..
//  Copyright © 2017년 fornew21c. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DataCenter : NSObject
@property NSNumber *mainViewOption;
+ (instancetype)sharedInstance;
- (NSNumber*) getMyMainViewOption;
- (void) setMyMainViewOption:(NSNumber*)newViewOption;
+ (instancetype)singleton;
- (void)settingData;

@property NSArray *locationList;
@end
