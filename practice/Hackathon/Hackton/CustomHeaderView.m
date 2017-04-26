//
//  CustomHeaderView.m
//  Hackton
//
//  Created by abyssinaong on 2017. 3. 11..
//  Copyright © 2017년 KimYunseo. All rights reserved.
//

#import "CustomHeaderView.h"
#import "DataCenter.h"
#import "HeaderCollectionViewCell.h"

@interface CustomHeaderView()


//@property (nonatomic,weak) IBOutlet CollectionImage *customViewCell;
@property NSString *notiString;

@end


@implementation CustomHeaderView

- (void)insertDataSetIndex:(NSInteger)index{
//    NSLog(@"%@", index);
    NSInteger temp = index;

    self.mainImg.image = [UIImage imageWithData:[[[DataCenter shareData] specificWebID:temp] objectForKey:@"mainImg"]];
    
    self.subImg.image = [UIImage imageWithData:[[[DataCenter shareData] specificWebID:temp] objectForKey:@"subImg"]];
    
    self.mainRegion.text = [[[DataCenter shareData] specificWebID:temp] objectForKey:@"mainRegion"];
    
    self.mainTitle.text = [[[DataCenter shareData] specificWebID:temp] objectForKey:@"mainTitle"];
    
    self.subTitle.text = [[[DataCenter shareData] specificWebID:temp] objectForKey:@"subTitle"];
    
    self.mainText.text = [[[DataCenter shareData] specificWebID:temp] objectForKey:@"mainText"];
    
    self.subText.text = [[[DataCenter shareData] specificWebID:temp] objectForKey:@"subText"];
    
}

- (void)createUIImage{
    
//   UIImage *collImg = [UIImage ];
    
}



- (void)addOserverMethod{
    [NSNotificationCenter.defaultCenter addObserver:self selector:@selector(recivedIndex:) name:@"row" object:nil];
    
}

- (void)recivedIndex:(NSNotification *)noti{
    self.notiString = noti.object;
}



@end
