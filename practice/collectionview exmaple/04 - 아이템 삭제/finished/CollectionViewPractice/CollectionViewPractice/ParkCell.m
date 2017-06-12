//
//  ParkCell.m
//  CollectionViewPractice
//
//  Created by Dabu on 2017. 3. 19..
//  Copyright © 2017년 Dabu. All rights reserved.
//

#import "ParkCell.h"

@interface ParkCell ()

@property (weak, nonatomic) IBOutlet UIImageView *parkImageView;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;

@end

@implementation ParkCell

- (void)inputParkData:(ParkData *)data {
    
    self.parkImageView.image = [UIImage imageNamed:data.parkPhotoString];
    self.nameLabel.text = data.parkNameString;
}

- (void)setSelected:(BOOL)selected {
    [super setSelected:selected];
    
    if (selected) {
        
        self.layer.borderWidth = 2.0f;
        self.layer.borderColor = [UIColor greenColor].CGColor;
    } else {
        
        self.layer.borderWidth = 0;
        self.layer.borderColor = nil;
    }
    
}

@end
