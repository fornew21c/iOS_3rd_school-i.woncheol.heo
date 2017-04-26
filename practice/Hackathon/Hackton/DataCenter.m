//
//  DataCenter.m
//  Hackton
//
//  Created by abyssinaong on 2017. 3. 11..
//  Copyright © 2017년 KimYunseo. All rights reserved.
//

#import "DataCenter.h"
@interface DataCenter()
@property (nonatomic, strong) FIRDatabaseReference *ref;
@property (nonatomic) NSMutableDictionary *webID;
@property (nonatomic) NSMutableArray *webIDOfKey;
@property (nonatomic) NSMutableArray *eachIDForData;

@property (nonatomic) NSMutableDictionary *replyDictionary;
@property (nonatomic) NSMutableArray *replyOfKey;
@property (nonatomic) NSMutableArray *totalReply;
@property (nonatomic) NSMutableArray *eachIDForReply;
@property NSArray *replySearch;
@end

@implementation DataCenter

+ (instancetype)shareData{
    
    static DataCenter *data;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        data = [[DataCenter alloc] init];
    });
    
    return data;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self createData];
        [self addObseverAction];
        [self settingData];
    }
    return self;
}


- (void)createData{
    
    self.ref = [[FIRDatabase database] reference];
    
    dispatch_queue_t createData = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_LOW, 0);
    dispatch_async(createData, ^{
        
        
        [[_ref child:@"webID"] observeEventType:FIRDataEventTypeValue withBlock:^(FIRDataSnapshot * _Nonnull snapshot) {
            
            //webID 키값에 해당되는 모든 object를 가져옴
            self.webID = snapshot.value;
            
            //webID의 키값을 array로 넣는다
            self.webIDOfKey = [[self.webID allKeys] mutableCopy];
            
            //array에 넣은 키값을 이용하여 키값에 맞는  각 object를 array에 다시 넣는다.
            self.eachIDForData = [NSMutableArray arrayWithObject:[self.webID objectForKey:self.webIDOfKey[0]]];
            
            //        NSLog(@"%@",self.eachIDForData[0]);
            [self postGetUrl];
        } withCancelBlock:^(NSError * _Nonnull error) {
            NSLog(@"%@", error.localizedDescription);
        }];
        //        [[NSNotificationCenter defaultCenter] postNotificationName:@"stratIndicate" object:nil];
        
    });

}


- (void)getUrlNoti:(NSNotification *)noti{
    [self replaceImg];
//    [self replyCreateSetwebID];
}

- (void)postGetUrl{
    [NSNotificationCenter.defaultCenter postNotificationName:@"getUrl" object:nil];
}

- (void)replaceImg{
    
    for (NSInteger j = 0; j < self.eachIDForData.count; j++) {
        NSString *mainImgStr = [self.eachIDForData[j] objectForKey:@"mainImg"];
        NSURL *mainImgUrl = [NSURL URLWithString:mainImgStr];
        NSData *mainImgData = [NSData dataWithContentsOfURL:mainImgUrl];
        [self.eachIDForData[j] setObject:mainImgData forKey:@"mainImg"];
        
        NSString *subImgStr = [self.eachIDForData[j] objectForKey:@"subImg"];
        NSURL *subImgUrl = [NSURL URLWithString:subImgStr];
        NSData *subImgData = [NSData dataWithContentsOfURL:subImgUrl];
        [self.eachIDForData[j] setObject:subImgData forKey:@"subImg"];
        
        for (NSInteger i = 0; i<[[self.eachIDForData[j] objectForKey:@"collectionImg"] count]; i++) {
            NSString *collecImgStr = [[self.eachIDForData[j] objectForKey:@"collectionImg"] objectAtIndex:i];
            NSURL *collecImgStrUrl = [NSURL URLWithString:collecImgStr];
            NSData *collecImgData = [NSData dataWithContentsOfURL:collecImgStrUrl];
            [[self.eachIDForData[j] objectForKey:@"collectionImg"] setObject:collecImgData atIndex:i];
        }
    }
    NSLog(@"It's Done!!");
    [[NSNotificationCenter defaultCenter] postNotificationName:@"stopIndicate" object:nil];
}



- (void)replyCreateSetWebID:(NSInteger)webIDNum
{
    FIRDatabaseReference *ref = [FIRDatabase database].reference;
    NSString *keword = self.webIDOfKey[webIDNum];
    
    dispatch_queue_t creat = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0);
    dispatch_async(creat, ^{
        
        [[[[ref child:@"reply"] queryOrderedByChild:@"webID"] queryEqualToValue:keword]
         observeEventType:FIRDataEventTypeValue withBlock:^(FIRDataSnapshot * _Nonnull snapshot) {
             
             if (snapshot.value != [NSNull null]){
                 NSArray *temp = [snapshot.value allValues];
                 
                 NSMutableArray *reTemp = [[NSMutableArray alloc] init];
                 
                 for (NSInteger i = 0; i <temp.count ; i++) {
                     NSMutableDictionary *tempDic = [[NSMutableDictionary alloc] init];
                     NSString *imgUrl = [temp[i] objectForKey:@"profileImg"];
                     NSURL *profileImgUrl = [NSURL URLWithString:imgUrl];
                     NSData *profileImgData = [NSData dataWithContentsOfURL:profileImgUrl];
                     UIImage *proflieImg = [UIImage imageWithData:profileImgData];
                     [tempDic setObject:proflieImg forKey:@"profileImg"];
                     [tempDic setObject:[temp[i] objectForKey:@"ID"] forKey:@"ID"];
                     [tempDic setObject:[temp[i] objectForKey:@"anomity"] forKey:@"anomity"];
                     [tempDic setObject:[temp[i] objectForKey:@"mainText"] forKey:@"mainText"];
                     [tempDic setObject:[temp[i] objectForKey:@"webID"] forKey:@"webID"];
                     [reTemp addObject:tempDic];
                     //                 [NSArray arrayWithObjects:tempDic, nil];
                 }
                 self.replySearch = reTemp;
                 NSLog(@"temp %@", self.replySearch);
             }
             NSLog(@"noti  보낸다!!!");
             [[NSNotificationCenter defaultCenter] postNotificationName:@"stopIndicateOftable" object:nil];
             
         }];
        
    });
    
    
    
    
    }

- (void)anonymitySetProfileImg:(NSString *)imgStr
           setAnoymity:(NSString *)anomyStr
           setMainText:(NSString *)mainText
              setWebID:(NSInteger)webIDNum
{
    
//    NSString *mainImgStr = [self.eachIDForData[webIDNum] objectForKey:@"mainImg"];
    [self.eachIDForData[webIDNum] objectForKey:@"reply"];
    
    FIRUser *user = [FIRAuth auth].currentUser;
    NSString *email = user.email;
    NSString *userID = user.uid;
    

    
    NSString *key = [[_ref child:@"reply"] childByAutoId].key;
    NSDictionary *replyTemp = @{@"webID":self.webIDOfKey[webIDNum], @"ID":email, @"anomity":anomyStr, @"mainText":mainText, @"profileImg":imgStr};
//    NSDictionary *reply = @{date:replyTemp};
//    NSDictionary *reply = @{:temp2};
//    NSDictionary *reply = @{@"reply": temp3};
    
//    NSString *key = [[_ref child:@"posts"] childByAutoId].key;
    NSDictionary *childUpdates = @{[@"/reply/" stringByAppendingString:key]: replyTemp,
                                   [NSString stringWithFormat:@"/user-posts/%@/%@/", userID, key]: replyTemp};

    
//    NSDictionary *childUpdates = @{[@"/reply/" stringByAppendingString:self.webIDOfKey[webIDNum]]: reply,
//                                   [NSString stringWithFormat:@"/user-posts/%@/%@/", userID, key]: reply};
    
//    NSDictionary *childUpdates = @{[@"/reply/" stringByAppendingString:key]: reply,
//                                   [NSString stringWithFormat:@"/user-posts/%@/%@/", date, key]: reply};
    [_ref updateChildValues:childUpdates];
    
}



- (NSDictionary *)specificWebID:(NSUInteger)array{
    NSDictionary *pageInfo = self.eachIDForData[array];
    return pageInfo;
}

//- (void)imageRefer{
//
//    
//    for (NSInteger i = 0; i < self.webIDOfKey.count; i++) {
//        [self.eachIDForData[i] setObject:@"a0001/mainImg/mainImg.png" forKey:@"mainImg"];
//        [self.eachIDForData[i] setObject:@"a0001/subImg/subImg.jpg" forKey:@"subImg"];
//        NSArray *colImg = @[@"a0001/collectionImg/collection1.jpg",@"a0001/collectionImg/collection2.jpg",@"a0001/collectionImg/collection3.jpg",@"a0001/collectionImg/collection4.jpg",@"a0001/collectionImg/collection5.jpg"];
//        [self.eachIDForData[i] setObject:colImg forKey:@"collectionImg"];
//        NSLog(@"dictionary %@", [self.eachIDForData[i] objectForKey:@"mainImg"]);
//        
//        NSDictionary *temp = self.eachIDForData[i];
//        [[[_ref child:@"webID"] child:self.webIDOfKey[i]] setValue:temp];
//    }
//}

- (void)addObseverAction{
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(getUrlNoti:) name:@"getUrl" object:nil];
}

- (void)dealloc{
    [NSNotificationCenter.defaultCenter removeObserver:@"getUrl"];
}


#pragma mainSetting

//+ (instancetype)sharedInstance
//{
//    static DataCenter *data;
//    
//    static dispatch_once_t onceToken;
//    dispatch_once(&onceToken, ^{
//        data = [[self alloc] init];
//    });
//    
//    return data;
//}

- (void) setMyMainViewOption:(NSNumber*)newViewOption {
    [[NSUserDefaults standardUserDefaults] setObject:newViewOption forKey:@"VIEW_OPTION"];
}

- (NSNumber*) getMyMainViewOption {
    return self.mainViewOption;
}

//+ (instancetype)singleton {
//    
//    static DataCenter *data;
//    static dispatch_once_t onceToken;
//    dispatch_once(&onceToken, ^{
//        
//        data = [[DataCenter alloc] init];
//    });
//    
//    return data;
//}



- (void)settingData {
    
    self.locationList = @[@"제주도",
                          @"전라남도",
                          @"경상북도",
                          @"경상남도",
                          @"충청북도",
                          @"경기도",
                          @"서울",
                          @"강원도",
                          @"충청남도",
                          ];
}

@end
