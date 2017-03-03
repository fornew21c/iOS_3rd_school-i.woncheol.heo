//
//  MyCustomView.m
//  Example0217
//
//  Created by Woncheol on 2017. 2. 17..
//  Copyright © 2017년 fornew21c. All rights reserved.
//

#import "MyCustomView.h"

@interface MyCustomView()

@property (nonatomic, weak) UIImageView *profileImgView;
@property (nonatomic, weak) UIView *profileTextContainer;
@property (nonatomic, weak) UILabel *titleLB;
@property (nonatomic, weak) UILabel *nameLB;
@property (nonatomic, weak) UILabel *profileLB;
//nonatomic 다중쓰레드 시 atomic은 락, notatomic은 락안함.
//weak ARC관련 strong(소유권, 참조권), weak(참조권)

@end

@implementation MyCustomView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self createSubViews];
        [self updateLayout];
        [self test];
    }
    return self;
}

- (void)createSubViews
{
    UIImageView *profileImgView = [[UIImageView alloc] init];
  
        [self addSubview:profileImgView];
    self.profileImgView = profileImgView;
    
    UIView *profileTextContainer = [[UIView alloc] init];
    [self addSubview:profileTextContainer];
    self.profileTextContainer = profileTextContainer;
    
    UILabel *titleLB = [[UILabel alloc] init];
    titleLB.text = @"Profile";
    titleLB.textColor = [UIColor lightGrayColor];
    titleLB.textAlignment = NSTextAlignmentRight;
    titleLB.font = [UIFont systemFontOfSize:9];
    [profileTextContainer addSubview:titleLB];
    self.titleLB = titleLB;
    
    UILabel *nameLB = [[UILabel alloc] init];
    nameLB.backgroundColor = [UIColor blackColor];
    nameLB.textAlignment = NSTextAlignmentCenter;
    nameLB.font = [UIFont boldSystemFontOfSize:20];
    [profileTextContainer addSubview:nameLB];
    self.nameLB = nameLB;
    
    UILabel *profileLB = [[UILabel alloc] init];
    profileLB.numberOfLines = 3;
    profileLB.lineBreakMode = NSLineBreakByWordWrapping;
    [self addSubview:profileLB];
    self.profileLB = profileLB;
}

// 모든 뷰의 레이아웃에 해당하는 행동을 한다.
- (void)updateLayout
{
    const CGFloat MARGIN = 15;
    CGFloat offsetX = MARGIN;
    CGFloat offsetY = MARGIN;
    
    self.profileImgView.frame = CGRectMake(offsetX, offsetY, 100, 100);
    self.profileImgView.clipsToBounds = YES;
    self.profileImgView.layer.cornerRadius = 50;
    offsetX += self.profileImgView.frame.size.width;
   
    self.profileTextContainer.frame = CGRectMake(offsetX, offsetY, self.frame.size.width - offsetX - MARGIN, self.profileImgView.frame.size.height);
    offsetX = MARGIN;
    offsetY = self.profileImgView.frame.size.height+ MARGIN;
    
    //텍스트컨테이너 subview
    //self.titleLB.frame
    //self.nameLB.frame
    
    self.profileLB.frame = CGRectMake(offsetX, offsetY, self.frame.size.width - (MARGIN*2), self.frame.size.height - offsetY-MARGIN);
}

- (void)test
{
    self.backgroundColor = [UIColor blackColor];
    self.profileImgView.backgroundColor = [UIColor yellowColor];
    self.profileTextContainer.backgroundColor = [UIColor greenColor];
    self.profileLB.backgroundColor = [UIColor purpleColor];
}

- (void)setDataWithIMGName:(NSString *)imgurlStr
                      name:(NSString *)nameStr
                       msg:(NSString *)msgStr
{
    self.profileImgView.image = [UIImage imageNamed:imgurlStr];
    self.nameLB.text = nameStr;
    self.profileLB.text = msgStr;
}
@end
