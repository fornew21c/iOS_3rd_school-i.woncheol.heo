//
//  HeaderView.m
//  CollectionViewPractice
//
//  Created by Woncheol on 2017. 3. 20..
//  Copyright © 2017년 Dabu. All rights reserved.
//

#import "HeaderView.h"

@interface HeaderView ()
@property (weak, nonatomic) IBOutlet UIImageView *parkImageView;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;

@end


@implementation HeaderView

- (void)inputParkData:(ParkData *)data {
    
    self.parkImageView.image = [UIImage imageNamed:data.parkStateString];
    
}
@end
