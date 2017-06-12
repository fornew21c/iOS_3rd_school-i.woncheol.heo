//
//  CustomCollectionViewCell.m
//  CollectionViewPractice
//
//  Created by Woncheol on 2017. 3. 20..
//  Copyright © 2017년 Dabu. All rights reserved.
//

#import "CustomCollectionViewCell.h"

@interface CustomCollectionViewCell ()

@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UIImageView *parkImage;

@end
@implementation CustomCollectionViewCell

- (void)inputParkData:(ParkData*)data {
    self.parkImage.image = [UIImage imageNamed:data.parkPhotoString];
    self.nameLabel.text = data.parkNameString;
}
@end
