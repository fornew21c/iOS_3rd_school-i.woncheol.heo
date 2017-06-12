//
//  MasterViewController.m
//  CollectionViewPractice
//
//  Created by Dabu on 2017. 3. 19..
//  Copyright © 2017년 Dabu. All rights reserved.
//

#import "MasterViewController.h"
#import "DataSource.h"
#import "ParkCell.h"
#import "HeaderView.h"
#import "DetailViewController.h"

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
    
    
    self.layout.sectionHeadersPinToVisibleBounds = YES;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if ([segue.identifier isEqualToString:@"DetailSegue"]) {
        
        DetailViewController *nextViewController = (DetailViewController *)segue.destinationViewController;
        nextViewController.parkData = (ParkData *)sender;
    }
}

#pragma mark - CollectionView Protocol
#pragma mark - DataSource

// 컬렉션뷰의 섹션 숫자
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    
    return [self.source numberOfSections];
}

// 컬렉션뷰의 섹션당 아이템 숫자
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    
    return [self.source numberOfItemsInSection:section];
}

// 컬렉션뷰의 셀 생성 및 반환
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    ParkCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"ParkCell" forIndexPath:indexPath];
    [cell inputParkData:[self.source parkDataAtIndexPath:indexPath]];
    
    return cell;
}

// 컬렉션뷰의 헤더 뷰 생성 및 반환
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath {
    
    HeaderView *headerView = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:@"HeaderView" forIndexPath:indexPath];
    [headerView inputParkData:[self.source parkDataAtIndexPath:indexPath]];
    
    return headerView;
}

#pragma mark - Delegate

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    
    ParkData *data = [self.source parkDataAtIndexPath:indexPath];
    [self performSegueWithIdentifier:@"DetailSegue" sender:data];
}

@end
