//
//  CustomTableViewCell.m
//  DetailView
//
//  Created by abyssinaong on 2017. 3. 9..
//  Copyright © 2017년 KimYunseo. All rights reserved.
//

#import "CustomTableViewCell2.h"
#import "DetailDataCenter.h"
@interface CustomTableViewCell2()
@property (nonatomic, weak) UIView *bottomView;
@property (nonatomic, weak) UIScrollView *mainScrollView;
@property (nonatomic, weak) UILabel *mainLabel;
@property (nonatomic, weak) UILabel *mainLabel01;
@property (nonatomic, weak) UIImageView *mainImage;
@property (nonatomic, weak) UIImageView *titleImage;
@property (nonatomic, weak) UILabel *mainTitleLB;
@property (nonatomic, weak) UILabel *regionTitle;
@property (nonatomic, weak) UILabel *subTitle;
@property (nonatomic, weak) UILabel *thirdLB;

@end

@implementation CustomTableViewCell2

- (instancetype)initSectionZero
{
    self = [super init];
    if (self) {
        [self createSetionZero];
    }
    return self;
}

- (instancetype)initSectionOne
{
    self = [super init];
    if (self) {
        [self createSetionOne];
    }
    return self;
}

- (instancetype)initSectionTwo
{
    self = [super init];
    if (self) {
        [self createSetionTwo];
    }
    return self;
}

- (void)layoutSubviews{
    [self frameSettingZero];
    [self frameSettingOne];
    [self frameSettingTwo];
}


- (void)createSetionZero{
    UIView *bottomView = [[UIView alloc] init];
    self.bottomView = bottomView;
    [self addSubview:bottomView];
    
    UIImageView *titleImage = [[UIImageView alloc] init];
    self.titleImage = titleImage;
    titleImage.backgroundColor = [UIColor blueColor];
    titleImage.image = [UIImage imageNamed:@"TitleImage"];
    [bottomView addSubview:titleImage];
    
    UILabel *regionTitle = [[UILabel alloc] init];
    self.regionTitle = regionTitle;
    regionTitle.text = [[DetailDataCenter shareData] regionExport][0];
    regionTitle.font = [UIFont boldSystemFontOfSize:12.0];
    [bottomView addSubview:regionTitle];
    regionTitle.textColor = [UIColor whiteColor];
    
    UILabel *mainTitleLB = [[UILabel alloc] init];
    self.mainTitleLB = mainTitleLB;
    mainTitleLB.text= [[DetailDataCenter shareData] mainTitle][0];
    mainTitleLB.font = [UIFont boldSystemFontOfSize:18.0];
    mainTitleLB.numberOfLines = 2;
    [bottomView addSubview:mainTitleLB];
    mainTitleLB.textColor = [UIColor whiteColor];
}

- (void)createSetionOne
{
    
    UIView *bottomView = [[UIView alloc] init];
    self.bottomView = bottomView;
    
    UILabel *subTitle = [[UILabel alloc] init];
    [bottomView addSubview:subTitle];
    self.subTitle = subTitle;
    subTitle.text = [[DetailDataCenter shareData] titleExport][1];
    subTitle.numberOfLines = 0;
    subTitle.textColor = [UIColor blackColor];
    subTitle.font = [UIFont boldSystemFontOfSize:20.0];
    
    UILabel *mainLabel01 = [[UILabel alloc] init];
    mainLabel01.text = [DetailDataCenter shareData].mainSting[0];
    NSLog(@"%@", mainLabel01.text);
    mainLabel01.font = [UIFont systemFontOfSize:16.0];
    mainLabel01.textColor = [UIColor blackColor];
    mainLabel01.numberOfLines = 0;
    self.mainLabel01 = mainLabel01;
    
    
    
    UIImageView *mainImage = [[UIImageView alloc] init];
    self.mainImage = mainImage;
    mainImage.backgroundColor = [UIColor blueColor];
    mainImage.image = [UIImage imageNamed:@"mountin"];
    
    UIScrollView *mainScrollView = [[UIScrollView alloc] init];
    self.mainScrollView = mainScrollView;

    
    [self addSubview:bottomView];
    [bottomView addSubview:mainLabel01];
    [bottomView addSubview:mainImage];
    
}

- (void)createSetionTwo
{
    
    UIView *bottomView = [[UIView alloc] init];
    self.bottomView = bottomView;
    
    UILabel *mainLabel = [[UILabel alloc] init];
    mainLabel.text = [DetailDataCenter shareData].mainSting[1];
    mainLabel.font = [UIFont systemFontOfSize:15.0];
    NSLog(@"%@", mainLabel.text);
    
    mainLabel.textColor = [UIColor blackColor];
    self.mainLabel = mainLabel;
    mainLabel.numberOfLines = 0;
    
    UILabel *thirdLB = [[UILabel alloc] init];
    self.thirdLB =thirdLB;
    [bottomView addSubview:thirdLB];
    thirdLB.text = @"사진";
    thirdLB.font = [UIFont systemFontOfSize:32.0];
    
    
    UIScrollView *mainScrollView = [[UIScrollView alloc] init];
    self.mainScrollView = mainScrollView;
    
    [self addSubview:bottomView];
    [bottomView addSubview:mainLabel];
    [bottomView addSubview:mainScrollView];
    [self createPic:[DetailDataCenter shareData].imageArray];
    
    
}

- (void)createPic:(NSArray *)array
{
    
    NSInteger picNumber = array.count;
    CGFloat onePicWidth = 160;
    CGFloat offsetX = 62;
    
    CGFloat contentWidth = (onePicWidth + 16)*picNumber + offsetX;
    self.mainScrollView.contentSize = CGSizeMake(contentWidth, 160);
    
    
    for (NSInteger i = 0; i < picNumber ; i++) {
        
        CGRect picSize = CGRectMake(offsetX, 0, onePicWidth, 160);
        UIImageView *secImage= [[UIImageView alloc] initWithFrame:picSize];
        secImage.image = [UIImage imageNamed:array[i]];
        secImage.userInteractionEnabled = YES;
        [self.mainScrollView addSubview:secImage];
        offsetX += onePicWidth+16;
    }
    
}

- (void)frameSettingZero {
    CGFloat m = self.frame.size.width;
    CGFloat h = self.frame.size.height;
    self.bottomView.frame = CGRectMake(0, 0, m, h);
    
    self.titleImage.frame = CGRectMake(0, 0, m, h);
    self.regionTitle.frame = CGRectMake(20, 132, 32, 16);
    
    self.mainTitleLB.frame = CGRectMake(20, 173, 195, 44);

}

- (void)frameSettingOne {
    CGFloat m = self.frame.size.width;
    CGFloat h = self.frame.size.height;
    self.bottomView.frame = CGRectMake(0, 0, m, h);
    
    self.subTitle.frame = CGRectMake(20, 32, 175, 64);
    CGFloat offsetY = self.subTitle.frame.size.height + 64;
    self.mainLabel01.frame = CGRectMake(20, offsetY, m - 40, h - 210.5 - offsetY);
    
    self.mainImage.frame = CGRectMake(0, h-230.5, m, 210.5);
}


- (void)frameSettingTwo {
    CGFloat m = self.frame.size.width;
    CGFloat h = self.frame.size.height;
    self.bottomView.frame = CGRectMake(0, 0, m, h);
    self.mainLabel.frame = CGRectMake(20, 32, m - 40, 110.5);
    
    CGFloat offsetY = self.mainLabel.frame.size.height + 64;
    self.thirdLB.frame = CGRectMake(20, offsetY, 89, 32);
    
    offsetY = offsetY + self.thirdLB.frame.size.height + 32;
    self.mainScrollView.frame = CGRectMake(0, offsetY, m, 160);
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
