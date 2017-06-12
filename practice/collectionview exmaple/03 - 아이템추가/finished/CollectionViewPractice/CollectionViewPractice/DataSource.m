//
//  DataSource.m
//  CollectionViewPractice
//
//  Created by Dabu on 2017. 3. 19..
//  Copyright © 2017년 Dabu. All rights reserved.
//

#import "DataSource.h"

@interface DataSource ()

@property NSMutableArray *parkDataArray;

@end

@implementation DataSource

#pragma mark - initializer & Configuration

- (instancetype)init
{
    self = [super init];
    if (self) {
        
        self.parkDataArray = [[NSMutableArray alloc] init];
        
        [self loadParkDataFromPList];
    }
    return self;
}

- (void)loadParkDataFromPList {
    
    NSString *bundlePathString = [[NSBundle mainBundle] pathForResource:@"NationalParks" ofType:@"plist"];
    NSArray *baseArray = [NSArray arrayWithContentsOfFile:bundlePathString];
    
    for (NSDictionary *dic in baseArray) {
        
        ParkData *parkData = [[ParkData alloc] init];
        parkData.parkNameString = [dic objectForKey:@"name"];
        parkData.parkPhotoString = [dic objectForKey:@"photo"];
        parkData.parkDateString = [dic objectForKey:@"date"];
        parkData.parkStateString = [dic objectForKey:@"state"];
        
        [self.parkDataArray addObject:parkData];
    }
}

- (ParkData *)randomParkData {
    
    NSString *bundlePathString = [[NSBundle mainBundle] pathForResource:@"NationalParks" ofType:@"plist"];
    NSArray *baseArray = [NSArray arrayWithContentsOfFile:bundlePathString];
    
    NSDictionary *dataDictionary = baseArray[arc4random_uniform(15)];
    ParkData *randomParkData = [[ParkData alloc] init];
    randomParkData.parkNameString = [dataDictionary objectForKey:@"name"];
    randomParkData.parkPhotoString = [dataDictionary objectForKey:@"photo"];
    randomParkData.parkDateString = [dataDictionary objectForKey:@"date"];
    randomParkData.parkStateString = [dataDictionary objectForKey:@"state"];
    
    return randomParkData;
}


#pragma mark - Provide Data to CollectionView

- (NSInteger)numberOfSections {
    
    return 1;
}

- (NSInteger)numberOfItems {
    
    return self.parkDataArray.count;
}

- (ParkData *)parkDataAtIndexPath:(NSIndexPath *)indexPath {
    
    return self.parkDataArray[indexPath.item];
}

- (void)addItemAtIndex:(NSIndexPath *)indexPath {
    
    ParkData *randomParkData = [self randomParkData];
    
    [self.parkDataArray insertObject:randomParkData atIndex:indexPath.item];
}

@end
