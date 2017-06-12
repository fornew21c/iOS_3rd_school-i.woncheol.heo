//
//  DetailViewController.m
//  CollectionViewPractice
//
//  Created by Dabu on 2017. 3. 19..
//  Copyright © 2017년 Dabu. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *mainImageView;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *dateLabel;

@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    // 가져온 parkData를 이용해 이미지, 레이블로 표현
    self.mainImageView.image = [UIImage imageNamed:self.parkData.parkPhotoString];
    self.nameLabel.text = self.parkData.parkNameString;
    self.dateLabel.text = self.parkData.parkDateString;
}



@end
