//
//  MyCustomTableViewCell.m
//  Example0217
//
//  Created by Woncheol on 2017. 2. 17..
//  Copyright © 2017년 fornew21c. All rights reserved.
//

#import "MyCustomTableViewCell.h"


@interface MyCustomTableViewCell()

@property (nonatomic, weak) UIImageView *profileImgView;
@property (nonatomic, weak) UIView *profileTextContainer;
@property (nonatomic, weak) UILabel *titleLB;
@property (nonatomic, weak) UILabel *nameLB;
@property (nonatomic, weak) UILabel *profileLB;
//nonatomic 다중쓰레드 시 atomic은 락, notatomic은 락안함.
//weak ARC관련 strong(소유권, 참조권), weak(참조권)

@end

@implementation MyCustomTableViewCell


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self createSubViews];
        //[self updateLayout];
        //[self test];
    }
    return self;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    // for interface builder >> stroyboard
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

//
//- (instancetype)initWithFrame:(CGRect)frame
//{
//    self = [super initWithFrame:frame];
//    if (self) {
//        [self createSubViews];
//        [self updateLayout];
//        [self test];
//    }
//    return self;
//}

- (void)layoutSubviews {
    [self updateLayout];
}

- (void)createSubViews
{
    UIImageView *profileImgView = [[UIImageView alloc] init];
    [self addSubview:profileImgView];
    self.profileImgView = profileImgView;
    self.profileImgView.clipsToBounds = YES;
    self.profileImgView.layer.cornerRadius = 50;
    
    UIView *profileTextContainer = [[UIView alloc] init];
    [self addSubview:profileTextContainer];
    self.profileTextContainer = profileTextContainer;
    
    UILabel *titleLB = [[UILabel alloc] init];
    titleLB.textColor = [UIColor lightGrayColor];
    titleLB.textAlignment = NSTextAlignmentCenter;
    titleLB.font = [UIFont systemFontOfSize:15];
    [profileTextContainer addSubview:titleLB];
    self.titleLB = titleLB;
    
    UILabel *nameLB = [[UILabel alloc] init];
    //nameLB.backgroundColor = [UIColor blackColor];
    nameLB.textAlignment = NSTextAlignmentLeft;
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

    offsetX += self.profileImgView.frame.size.width;
    
    self.profileTextContainer.frame = CGRectMake(offsetX, offsetY, self.frame.size.width - offsetX - MARGIN, self.profileImgView.frame.size.height);
    offsetX = MARGIN;
    offsetY = self.profileImgView.frame.size.height+ MARGIN;
    
    //텍스트컨테이너 subview
    self.titleLB.frame = CGRectMake(0, 0, self.profileTextContainer.frame.size.width, self.profileTextContainer.frame.size.height/2);
    self.nameLB.frame = CGRectMake(0, self.profileTextContainer.frame.size.height/2, self.profileTextContainer.frame.size.width, self.profileTextContainer.frame.size.height/2);
    
    self.profileLB.frame = CGRectMake(offsetX, offsetY, self.frame.size.width - (MARGIN*2), self.frame.size.height - offsetY-MARGIN);
}

- (void)test
{
//    self.backgroundColor = [UIColor blackColor];
//    self.profileImgView.backgroundColor = [UIColor yellowColor];
//    self.profileTextContainer.backgroundColor = [UIColor greenColor];
//    self.profileLB.backgroundColor = [UIColor purpleColor];
    self.titleLB.backgroundColor = [UIColor purpleColor];
    self.nameLB.backgroundColor = [UIColor yellowColor];
}

- (void)setDataWithIMGName:(NSString *)imgurlStr
                     title:(NSString *)titleStr
                      name:(NSString *)nameStr
                       msg:(NSString *)msgStr
{
    self.profileImgView.image = [UIImage imageNamed:imgurlStr];
    self.titleLB.text = titleStr;
    self.nameLB.text = nameStr;
    self.profileLB.text = msgStr;
}
@end

