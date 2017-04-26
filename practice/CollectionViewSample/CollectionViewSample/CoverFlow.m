//
//  CoverFlow.m
//  CollectionViewSample
//
//  Created by Woncheol on 2017. 3. 24..
//  Copyright © 2017년 fornew21c. All rights reserved.
//

#import "CoverFlow.h"

@implementation CoverFlow

- (NSArray<UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect {
    NSLog(@"layoutAttributesForElementsInRect");
    NSArray *attributesInRect = [super layoutAttributesForElementsInRect:rect];
    
    NSMutableArray *resultAttributeArray = [[NSMutableArray alloc] init];
    
    for (UICollectionViewLayoutAttributes *attribute in attributesInRect) {
        UICollectionViewLayoutAttributes *copyAttribute = [attribute copy];
        
        CGFloat collectionViewCenter = self.collectionView.contentOffset.x + (self.collectionView.bounds.size.width / 2.0f);
        CGFloat maxDistance = self.itemSize.width + self.minimumLineSpacing;
        CGFloat distance = MIN(fabs(attribute.center.x - collectionViewCenter) , maxDistance);
        
        CGFloat ratio = (maxDistance - distance) / maxDistance;
        CGFloat itemScale = 1.0f + (0.5f * ratio);
        CGFloat itemAlpha = 0.5f + (0.5f * ratio);
        
        copyAttribute.alpha = itemAlpha;
        copyAttribute.transform3D = CATransform3DScale(CATransform3DIdentity, itemScale, itemScale, 1);
        copyAttribute.zIndex = 10 * itemAlpha;
        
        [resultAttributeArray addObject:copyAttribute];
        
    }
    return resultAttributeArray;
}

- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)newBounds {
    return YES;
}

- (CGPoint)targetContentOffsetForProposedContentOffset:(CGPoint)proposedContentOffset withScrollingVelocity:(CGPoint)velocity {
    
    CGFloat actualXOffset = proposedContentOffset.x + (self.collectionView.bounds.size.width / 2.0f);
    NSArray *attributeArray = [self layoutAttributesForElementsInRect:self.collectionView.bounds];
    
    //NSLog(@"attributeArray: %@", attributeArray);
    
    attributeArray = [attributeArray sortedArrayUsingComparator:^NSComparisonResult(UICollectionViewLayoutAttributes*  _Nonnull obj1, UICollectionViewLayoutAttributes*  _Nonnull obj2) {
        if (fabs(obj1.center.x - actualXOffset) > fabs(obj2.center.x - actualXOffset)) {
            return NSOrderedDescending;
        } else if( fabs(obj1.center.x - actualXOffset) < fabs(obj2.center.x - actualXOffset)) {
            return NSOrderedAscending;
        } else {
            return NSOrderedSame;
        }
    }];
    
    CGFloat resultOffsetValue = ((UICollectionViewLayoutAttributes *)attributeArray.firstObject).center.x - (self.collectionView.bounds.size.width / 2.0);
    CGPoint resultPoint = CGPointMake(resultOffsetValue, 0);
    
    return resultPoint;
    
}
@end
