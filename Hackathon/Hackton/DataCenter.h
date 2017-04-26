//
//  DataCenter.h
//  Hackton
//
//  Created by abyssinaong on 2017. 3. 11..
//  Copyright © 2017년 KimYunseo. All rights reserved.
//

#import <Foundation/Foundation.h>
@import Firebase;

@interface DataCenter : NSObject
@property (nonatomic, readonly) NSMutableDictionary *webID;
@property (nonatomic, readonly) NSMutableArray *webIDOfKey;
@property (nonatomic, readonly) NSMutableArray *replyOfKey;
@property (readonly) NSArray *replySearch;

+ (instancetype)shareData;

- (NSDictionary *)specificWebID:(NSUInteger)array;
- (void)replyCreateSetWebID:(NSInteger)webIDNum;
- (void)anonymitySetProfileImg:(NSString *)imgStr
                   setAnoymity:(NSString *)anomyStr
                   setMainText:(NSString *)mainText
                      setWebID:(NSInteger)webIDNum;




@property NSNumber *mainViewOption;
//+ (instancetype)sharedInstance;
- (NSNumber*) getMyMainViewOption;
- (void) setMyMainViewOption:(NSNumber*)newViewOption;
//+ (instancetype)singleton;
- (void)settingData;

@property NSArray *locationList;

@end
