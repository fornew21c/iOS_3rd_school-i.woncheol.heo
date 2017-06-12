//
//  HeaderView.m
//  CollectionViewPractice
//
//  Created by Dabu on 2017. 3. 19..
//  Copyright © 2017년 Dabu. All rights reserved.
//

#import "HeaderView.h"

@interface HeaderView ()

@property (weak, nonatomic) IBOutlet UIImageView *stateImageView;
@property (weak, nonatomic) IBOutlet UILabel *stateNameLabel;

@end

@implementation HeaderView

- (void)inputParkData:(ParkData *)data {
    
    self.stateImageView.image = [UIImage imageNamed:data.parkStateString];
    self.stateNameLabel.text = data.parkStateString;
}

@end
