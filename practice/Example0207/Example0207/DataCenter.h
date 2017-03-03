//
//  DataCenter.h
//  Example0207
//
//  Created by Woncheol on 2017. 2. 24..
//  Copyright © 2017년 fornew21c. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DataCenter : NSObject

@property NSString *swichStr1;
@property NSString *swichStr2;
@property NSString *swichStr3;
@property NSString *swichStr4;
@property NSString *swichStr5;

@property BOOL swicher1;
@property BOOL swicher2;
@property BOOL swicher3;
@property BOOL swicher4;
@property BOOL swicher5;

@property NSString *ID;
@property NSString *PW;

+ (instancetype)sharedInstance;
- (void) setMyID:(NSString *)ID;
- (void) setMyPW:(NSString *)PW;
- (NSString*) getMyID;
- (NSString*) getMyPW;
@end
