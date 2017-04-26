//
//  CustomHeaderView.h
//  Hackton
//
//  Created by abyssinaong on 2017. 3. 11..
//  Copyright © 2017년 KimYunseo. All rights reserved.
//

#import <UIKit/UIKit.h>
@import Firebase;

@interface CustomHeaderView : UIView



@property (nonatomic, weak) IBOutlet UIImageView *mainImg;

////지도얺어야 함

@property (nonatomic, weak) IBOutlet UILabel *subTitle;

@property (nonatomic, weak) IBOutlet UILabel *mainText;

@property (nonatomic, weak) IBOutlet UILabel *subText;

@property (nonatomic, weak) IBOutlet UIImageView *subImg;



@property (nonatomic, weak) IBOutlet UILabel *mainRegion;

@property (nonatomic, weak) IBOutlet UILabel *mainTitle;

- (void)insertDataSetIndex:(NSInteger)index;


@end
