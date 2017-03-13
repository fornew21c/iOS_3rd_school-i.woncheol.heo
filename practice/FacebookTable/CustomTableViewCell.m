//
//  CustomTableViewCell.m
//  FacebookTable
//
//  Created by Woncheol on 2017. 3. 6..
//  Copyright © 2017년 fornew21c. All rights reserved.
//

#import "CustomTableViewCell.h"
@interface CustomTableViewCell()
@property (nonatomic, weak) UILabel *nameLabel;
@property (nonatomic, weak) UIImageView *imageContent;

@end
@implementation CustomTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
//    self.backgroundColor = [UIColor whiteColor];
//    [self createSubViews];
//    [self test];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}

//- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
//{
//    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
//    NSLog(@"initWithStyle");
//    if (self) {
//        [self createSubViews];
//        //[self updateLayout];
//        [self test];
//        //[self test];
//    }
//    return self;
//}

- (void)layoutSubviews {
    [self updateLayout];
}

- (void)createSubViews
{
//    UILabel *nameLabel = [[UILabel alloc] init];
//    nameLabel.textAlignment = NSTextAlignmentCenter;
//    nameLabel.textColor = [UIColor lightGrayColor];
//    [self.contentView addSubview:nameLabel];
//    self.nameLabel = nameLabel;
//    
//    UIImageView *iconImg = [[UIImageView alloc] init];
//    iconImg.clipsToBounds = YES;
//    iconImg.layer.cornerRadius = 15;
//    [self.contentView addSubview:iconImg];
//    self.imageContent = iconImg;
    
}

- (void) updateLayout
{
    NSLog(@"updateLayout");
    CGFloat const MARGIN = 0;
    CGFloat offsetX = MARGIN;
    CGFloat offsetY = MARGIN;
    
    self.imageContent.frame = CGRectMake(offsetX, 10, 70, 30);
    offsetX += self.imageContent.frame.size.width;
    self.nameLabel.frame = CGRectMake(offsetX, offsetY, 50, 20);
    
    
    
}
- (void)test
{
    self.nameLabel.backgroundColor = [UIColor redColor];
    self.imageContent.backgroundColor = [UIColor grayColor];
}
@end
