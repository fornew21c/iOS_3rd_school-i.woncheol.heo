//
//  DataCenter.h
//  NetworkProject
//
//  Created by Woncheol on 2017. 3. 17..
//  Copyright © 2017년 fornew21c. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DataCenter : NSObject

@property NSString *loginToken;

+ (instancetype)sharedInstance;
- (void)setMyLoginToken:(NSString*) token;
- (NSString*)getMyLoginToken;

@end
