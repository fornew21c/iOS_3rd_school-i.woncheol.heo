//
//  CustomTableViewCell.m
//  Hackton
//
//  Created by abyssinaong on 2017. 3. 12..
//  Copyright © 2017년 KimYunseo. All rights reserved.
//

#import "SubCustomTableViewCell.h"

@interface SubCustomTableViewCell()

@end

@implementation SubCustomTableViewCell



- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    self.smallProfile.clipsToBounds = YES;
    self.smallProfile.layer.cornerRadius = 40.0;
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
