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
#import "DetailViewController.h"

@interface MasterViewController () <UICollectionViewDataSource, UICollectionViewDelegate, UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UICollectionView *mainCollectionView;

@property (weak, nonatomic) IBOutlet UICollectionViewFlowLayout *layout;

@property DataSource *source;

@end

@implementation MasterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 데이터 소스 초기화
    self.source = [[DataSource alloc] init];
    
    // 섹션 Inset조정
    self.layout.sectionInset = UIEdgeInsetsMake(10, 10, 10, 10);
    
    // 각 아이템 사이즈 설정
    CGFloat width = (self.mainCollectionView.frame.size.width - 10 * 4) / 3.0f;
    self.layout.itemSize = CGSizeMake(width, width);
    
}

#pragma mark - IBAction

- (IBAction)tappedAddButton:(UIBarButtonItem *)sender {
 
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"아이템을 추가합니다." message:@"몇번째 인덱스에 추가하시겠습니까?" preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"확인" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
        UITextField *textField = alert.textFields.firstObject;
        textField.delegate = self;
        
        
        NSIndexPath *addedItemIndexPath = [NSIndexPath indexPathForItem:textField.text.integerValue inSection:0];
        [self.source addItemAtIndex:addedItemIndexPath];
        [self.mainCollectionView insertItemsAtIndexPaths:@[addedItemIndexPath]];
    }];
    
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"취소" style:UIAlertActionStyleDefault handler:nil];
    
    [alert addAction:okAction];
    [alert addAction:cancelAction];
    
    [alert addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
        
        textField.placeholder = @"인덱스 넘버";
    }];
    
    [self presentViewController:alert animated:YES completion:nil];
    
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

// 컬렉션뷰의 섹션 숫자
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    
    return [self.source numberOfSections];
}

// 컬렉션뷰의 섹션당 아이템 숫자
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    
    return [self.source numberOfItems];
}

// 컬렉션뷰의 셀 생성 및 반환
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    ParkCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"ParkCell" forIndexPath:indexPath];
    [cell inputParkData:[self.source parkDataAtIndexPath:indexPath]];
    
    return cell;
}

#pragma mark - Delegate

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    
    ParkData *data = (ParkData *)[self.source parkDataAtIndexPath:indexPath];
    
    [self performSegueWithIdentifier:@"DetailSegue" sender:data];
}

@end
