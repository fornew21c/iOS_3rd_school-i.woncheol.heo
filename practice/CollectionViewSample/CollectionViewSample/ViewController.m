//
//  ViewController.m
//  CollectionViewSample
//
//  Created by Woncheol on 2017. 3. 24..
//  Copyright © 2017년 fornew21c. All rights reserved.
//

#import "ViewController.h"
#import "CoverFlow.h"

@interface ViewController ()
<UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>

//@property (weak, nonatomic) IBOutlet UICollectionViewFlowLayout *layout;
@property (weak, nonatomic) IBOutlet CoverFlow *layout;
@property (weak, nonatomic) IBOutlet UICollectionView *mainCollectionView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    CGFloat leftInset = (self.mainCollectionView.frame.size.width - self.layout.itemSize.width) / 2.0f;
    
    self.layout.sectionInset = UIEdgeInsetsMake(0, leftInset, 0, leftInset);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 30;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    
    return cell;
    
}
@end
