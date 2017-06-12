//
//  MasterViewController.m
//  CollectionViewPractice
//
//  Created by Dabu on 2017. 3. 19..
//  Copyright © 2017년 Dabu. All rights reserved.
//

#import "MasterViewController.h"
#import "DetailViewController.h"
#import "DataSource.h"
#import "ParkCell.h"

@interface MasterViewController () <UICollectionViewDataSource, UICollectionViewDelegate>

@property (weak, nonatomic) IBOutlet UICollectionView *mainCollectionView;

@property (weak, nonatomic) IBOutlet UICollectionViewFlowLayout *layout;

@property DataSource *source;

@end

@implementation MasterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 데이터 소스 초기화
    self.source = [[DataSource alloc] init];
    
    // 각 아이템 사이즈 설정
    CGFloat width = (self.mainCollectionView.frame.size.width - 10 * 4) / 3.0f;
    self.layout.itemSize = CGSizeMake(width, width);
}

#pragma mark - Segue

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if ([segue.identifier isEqualToString:@"DetailSegue"]) {
        
        DetailViewController *nextViewController = (DetailViewController *)segue.destinationViewController;
        nextViewController.parkData = (ParkData *)sender;
    }
}


#pragma mark - CollectionView Protocol
#pragma mark - DataSource

#pragma mark - Delegate

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    
    ParkData *data = [self.source parkDataAtIndexPath:indexPath];
    [self performSegueWithIdentifier:@"DetailSegue" sender:data];
}


@end
