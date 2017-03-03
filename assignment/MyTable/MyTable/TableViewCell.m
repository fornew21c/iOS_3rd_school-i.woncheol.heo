//
//  TableViewCell.m
//  MyTable
//
//  Created by Woncheol on 2017. 2. 19..
//  Copyright © 2017년 fornew21c. All rights reserved.
//

#import "TableViewCell.h"

@interface TableViewCell()
@property (nonatomic, weak) UILabel *rankLB;
@property (nonatomic, weak) UIImageView *iconImg;
@property (nonatomic, weak) UIView *contentsView;
@property (nonatomic, weak) UILabel *titleLB;
@property (nonatomic, weak) UILabel *genreLB;
@property (nonatomic, weak) UIImageView *reviewImg;
@property (nonatomic, weak) UIButton *downloadBtn;
@property (nonatomic, weak) UIView *lineView;
@property (nonatomic) NSUInteger rank;
@end
@implementation TableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self createSubViews];
        //[self updateLayout];
        [self test];
        //[self test];
    }
    return self;
}

- (void)layoutSubviews {
    [self updateLayout];
}

- (void) createSubViews
{
    
//    UIView *lineView = [[UIView alloc] init];
//    lineView.backgroundColor = [UIColor lightGrayColor];
//    [self addSubview:lineView];
//    self.lineView =lineView;

    
    UILabel *rankLB = [[UILabel alloc] init];
    rankLB.textAlignment = NSTextAlignmentCenter;
    rankLB = rankLB;
    rankLB.textColor = [UIColor lightGrayColor];
    [self.contentView addSubview:rankLB];
    self.rankLB = rankLB;
    
    UIImageView *iconImg = [[UIImageView alloc] init];
    iconImg.clipsToBounds = YES;
    iconImg.layer.cornerRadius = 15;
    [self.contentView addSubview:iconImg];
    self.iconImg = iconImg;
    
    UIView *contentsView = [[UIView alloc] init];
    [self.contentView addSubview:contentsView];
    self.contentsView = contentsView;
    
    UILabel *titleLB = [[UILabel alloc] init];
    [self.contentsView addSubview:titleLB];
    self.titleLB = titleLB;
    
    UILabel *genreLB = [[UILabel alloc] init];
    genreLB.textColor = [UIColor grayColor];
    genreLB.font = [UIFont systemFontOfSize:12];
    [self.contentsView addSubview:genreLB];
    self.genreLB = genreLB;
    
    UIImageView *reviewImg = [[UIImageView alloc] init];
    reviewImg.contentMode = UIViewContentModeScaleToFill;
    [self.contentsView addSubview:reviewImg];
    self.reviewImg = reviewImg;
    
    UIButton *downloadBtn = [[UIButton alloc] init];
    [downloadBtn setImage:[UIImage imageNamed:@"downBtn.png"] forState:UIControlStateNormal];
    [downloadBtn setImage:[UIImage imageNamed:@"setupBtn.png"] forState:UIControlStateHighlighted];
    [downloadBtn addTarget:self action:@selector(downloadBtnClicked) forControlEvents:UIControlEventTouchUpInside];
    [self.contentView addSubview:downloadBtn];
    self.downloadBtn = downloadBtn;
    
}

- (void)downloadBtnClicked{
    [self.downloadBtn setImage:[UIImage imageNamed:@"setupBtn.png"] forState:UIControlStateNormal];
}
- (void) updateLayout
{
    const CGFloat MARGIN = 0;
    CGFloat offsetX = MARGIN;
    CGFloat offsetY = MARGIN;
    
    self.lineView.frame = CGRectMake(10, self.frame.size.height - 1.0, self.frame.size.width-5, 1);
    //self.rankLB.text = [NSString stringWithFormat:@"%lu", self.rank++];
    self.rankLB.frame = CGRectMake(offsetX, offsetY, 40, self.frame.size.height);
    offsetX += self.rankLB.frame.size.width;
    
    self.iconImg.frame = CGRectMake(offsetX, 10, 70, 70);
    offsetX += self.iconImg.frame.size.width;
    
    self.contentsView.frame = CGRectMake(offsetX, 0, self.frame.size.width*0.5, self.frame.size.height);
    offsetX += self.contentsView.frame.size.width;
    
    self.titleLB.frame = CGRectMake(10, 8,self.contentsView.frame.size.width-10, self.contentsView.frame.size.height*0.4);
    self.genreLB.frame = CGRectMake(10, self.titleLB.frame.size.height, self.contentsView.frame.size.width-10, self.contentsView.frame.size.height*0.3);
    self.reviewImg.frame = CGRectMake(10, self.contentsView.frame.size.height*0.7, self.contentsView.frame.size.width*0.5, self.contentsView.frame.size.height*0.3 - 10);
    
    self.downloadBtn.frame = CGRectMake(offsetX, 20, 50, 40);
}

- (void)test
{

   //self.rankLB.backgroundColor = [UIColor purpleColor];
   // self.iconImg.backgroundColor = [UIColor yellowColor];
    //self.contentsView.backgroundColor = [UIColor grayColor];
    //self.titleLB.backgroundColor = [UIColor redColor];
    //self.genreLB.backgroundColor = [UIColor blueColor];
    //self.reviewImg.backgroundColor = [UIColor greenColor];
    self.downloadBtn.backgroundColor = [UIColor greenColor];
}

- (void)setDataWithRank:(NSString *)rankStr
                   icon:(NSString *)iconStr
                  title:(NSString *)titleStr
                  genre:(NSString *)genreStr
                 review:(NSString *)reviewImg
{
    self.rankLB.text = rankStr;
    self.iconImg.image = [UIImage imageNamed:iconStr];
    self.titleLB.text = titleStr;
    self.genreLB.text = genreStr;
    self.reviewImg.image = [UIImage imageNamed:reviewImg];
//    self.profileLB.text = msgStr;
}
@end
