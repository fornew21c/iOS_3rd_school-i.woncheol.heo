//
//  MasterViewController.m
//  CollectionViewPractice
//
//  Created by Dabu on 2017. 3. 19..
//  Copyright © 2017년 Dabu. All rights reserved.
//

#import "MasterViewController.h"
#import "CustomCollectionViewCell.h"
#import "DataSource.h"
#import "DetailViewController.h"

@interface MasterViewController () 
<UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UICollectionViewDelegateFlowLayout>

@property DataSource *source;
@property (weak, nonatomic) IBOutlet UICollectionViewFlowLayout *layout;
@property (weak, nonatomic) IBOutlet UICollectionView *mainCollectionView;
@end

@implementation MasterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.source = [[DataSource alloc] init];
    
    CGFloat itemWidth =  (self.mainCollectionView.frame.size.width - 30)/ 3.0f;
    CGFloat itemHeight = self.mainCollectionView.frame.size.height;
    
    self.layout.itemSize = CGSizeMake(itemWidth, itemWidth);
    
//    self.layout.sectionInset =  UIEdgeInsetsMake(0, 10, 0, 10);
    
    
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"didSelectItemAtIndexPath");
    ParkData *data = [self.source parkDataAtIndexPath:indexPath];
    [self performSegueWithIdentifier:@"DetailSegue" sender:data];
    
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    DetailViewController *nextVC = segue.destinationViewController;
    nextVC.parkData = sender;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return [self.source numberOfItems];
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
//    self.source = [[DataSource alloc] init];
//    
//    CGFloat width =  self.mainCollectionView.frame.size.width / 4.0f;
//    
//    self.layout.itemSize = CGSizeMake(width, width);
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    CustomCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"CustomCollectionViewCell" forIndexPath:indexPath];
    [cell inputParkData:[self.source parkDataAtIndexPath:indexPath]];
    return cell;
}

//- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
//    
//    
//}
@end
