//
//  CustomScrollView.m
//  DetailView
//
//  Created by abyssinaong on 2017. 3. 9..
//  Copyright © 2017년 KimYunseo. All rights reserved.
//

#import "CustomScrollView.h"
#import "DetailDataCenter.h"

@implementation CustomScrollView

- (instancetype)initSetArray:(NSArray *)array
{
    self = [super init];
    if (self) {
        [self createPic:array];
    }
    return self;
}


- (void)createPic:(NSArray *)array
{
    
    NSInteger picNumber = array.count;
    CGFloat onePicWidth = 220;
    self.contentOffset = CGPointMake(0, 0);
    self.contentSize = CGSizeMake(onePicWidth*picNumber, 440);
    
    CGFloat offsetX = 0;
    for (NSInteger i = 0; i < picNumber ; i++) {
        
        CGRect picSize = CGRectMake(offsetX, 0, onePicWidth, 440);
        UIImageView *secImage= [[UIImageView alloc] initWithFrame:picSize];
        secImage.image = [UIImage imageNamed:array[picNumber-1]];
        secImage.userInteractionEnabled = YES;
        [self addSubview:secImage];
        offsetX += onePicWidth;
    }
    
}


//- (void)imageViewCreatwithFrame:(CGRect)frame
//                        setName:(NSString *)picName
//{
//    
//    UIImageView *secImage= [[UIImageView alloc] initWithFrame:frame];
//    
//    secImage.image = [UIImage imageNamed:picName];
//    
//    [self addSubview:secImage];
//}

@end
