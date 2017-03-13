//
//  CustomTableViewCell.m
//  FacebookTable2
//
//  Created by Woncheol on 2017. 3. 6..
//  Copyright © 2017년 fornew21c. All rights reserved.
//

#import "CustomTableViewCell.h"
@interface CustomTableViewCell()
@property (nonatomic,weak) UIImageView *imageView;
@end

@implementation CustomTableViewCell

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


- (void)createSubViews
{
    
    UIImageView *iconImg = [[UIImageView alloc] init];
    iconImg.clipsToBounds = YES;
    iconImg.layer.cornerRadius = 15;
    [self.contentView addSubview:iconImg];
    self.imageView = iconImg;
}

- (void)test
{
    self.imageView.backgroundColor = [UIColor redColor];
}
@end
