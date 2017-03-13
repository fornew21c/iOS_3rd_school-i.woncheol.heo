//
//  DetailDataCenter.h
//  DetailView
//
//  Created by abyssinaong on 2017. 3. 9..
//  Copyright © 2017년 KimYunseo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DetailDataCenter : NSObject
@property (readonly) NSArray *mainTitle;
@property (readonly) NSArray *regioArray;
@property (readonly) NSArray *imageArray;
@property (readonly) NSArray *mainSting;

+ (instancetype)shareData;
- (NSArray *)titleExport;
- (NSArray *)regionExport;
- (NSString *)titleStrExport;
@end
