//
//  CustomTableViewCell.h
//  Hackton
//
//  Created by abyssinaong on 2017. 3. 12..
//  Copyright © 2017년 KimYunseo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SubCustomTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *smallProfile;
@property (weak, nonatomic) IBOutlet UILabel *anoymityLB;
@property (weak, nonatomic) IBOutlet UILabel *replyLB;


@end
