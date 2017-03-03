//
//  DataCenter.h
//  PlistTest
//
//  Created by Woncheol on 2017. 3. 3..
//  Copyright © 2017년 fornew21c. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DataCenter : NSObject
@property NSArray *list;

+ (instancetype)sharedInstance;
- (NSArray*)getSample;
- (NSUInteger)getCount;

@end
