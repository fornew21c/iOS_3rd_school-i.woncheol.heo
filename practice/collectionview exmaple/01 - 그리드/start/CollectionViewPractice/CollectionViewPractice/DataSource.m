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


// PList에서 데이터를 가져와 parkDataArray 프로퍼티에 저장

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

@end
