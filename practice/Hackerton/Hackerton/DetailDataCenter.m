//
//  DetailDataCenter.m
//  DetailView
//
//  Created by abyssinaong on 2017. 3. 9..
//  Copyright © 2017년 KimYunseo. All rights reserved.
//

#import "DetailDataCenter.h"

@interface DetailDataCenter()
@property NSArray *mainTitle;
@property NSString *titleImageStr;
@property NSArray *imageArray;
@property NSArray *mainSting;
@property NSArray *locationArray;
@property NSMutableDictionary *latLonDic;
@property NSArray *regioArray;

@end

@implementation DetailDataCenter

+ (instancetype)shareData
{
    static DetailDataCenter *detailData;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        detailData = [[DetailDataCenter alloc] init];
    });
   
    return detailData;
}



- (instancetype)init
{
    self = [super init];
    if (self) {
        [self titleImageStrStteing];
        [self regionSetting];
        [self titleString];
        [self imageName];
        [self mainText];
        [self locationSetting];
    }
    return self;
}

- (void)regionSetting{
    
    self.regioArray = @[@"제주도"];
    
}

- (void)titleImageStrStteing{
    
    self.titleImageStr = @"TitleImage";
}

- (NSArray *)regionExport{
    
    return self.regioArray;
}

- (void)titleString{
    self.mainTitle = @[@"봄에 가기 좋은 곳 제주도 \n혼자라도 무리없지", @"광치기해안-\n온평포구 코스"];
    
}

- (NSString *)titleStrExport{
    
    return self.titleImageStr;
}

- (NSArray *)titleExport{
    
    return self.mainTitle;
}

- (void)imageName{
    
    self.imageArray = @[@"scroll01", @"scroll02", @"scroll03", @"scroll04", @"scroll05"];
    
}


- (void)mainText{
    
    self.mainSting = @[@"봄에 혼자가기 좋은 곳을 알려줄게요.봄이 오면 마음이 싱숭생숭 하실까봐 저희가 특별히 준비했더랬죠. 광치기 위치에 따라서, 그리고 시간에 따라서 다르게 보이는 제주도의 모습! 그렇다보니 광치기해변의 모습도 호불호를 가리는 평가가 나오기도 합니다. 어떤 사람들은 정말 아름다운 해변의 모습을 바라보았다는 이야기를 하고, 또 다른 사람들은 해안선이 길기는 하지만 평범한 해변이었다고 얘기하는 사람들도 있습니다.", @"암석위에서 자라고 있는 수초들을 멀리서 바라보면 마치 녹색물감을 뿌려놓은 듯한 착각에 빠지게 만듭니다. 녹새물감을 뿌려놓은 풍경을 배경으로 저 멀리 바라보는 성산일출봉은 평상시엔 볼 수 없는 멋진 장관을 만들어내는 것이지요!"];
    
}

- (void)locationSetting{
    
    self.locationArray = @[@{@"lat":@"33.500245", @"lon":@"126.526045"}];
    
}

- (void)latLonDicSetting{
    
    self.latLonDic = [self.locationArray[0] objectForKey:@"lat"];
    
}

@end
