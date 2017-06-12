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
    
    NSString *bundlePathString = [[NSBundle mainBundle] pathForResource:@"ParksWithSection" ofType:@"plist"];
    NSArray *baseArray = [NSArray arrayWithContentsOfFile:bundlePathString];
    
    for (NSArray *tempArray in baseArray) {
        
        NSMutableArray *sectionArray = [[NSMutableArray alloc] init];
        for (NSDictionary *dic in tempArray) {
            
            ParkData *parkData = [[ParkData alloc] init];
            parkData.parkNameString = [dic objectForKey:@"name"];
            parkData.parkPhotoString = [dic objectForKey:@"photo"];
            parkData.parkDateString = [dic objectForKey:@"date"];
            parkData.parkStateString = [dic objectForKey:@"state"];
            
            [sectionArray addObject:parkData];
        }
        [self.parkDataArray addObject:sectionArray];
    }
}


#pragma mark - Provide Data to CollectionView

- (NSInteger)numberOfSections {
    
    return self.parkDataArray.count;
}

- (NSInteger)numberOfItemsInSection:(NSInteger)section {
    
    return [self.parkDataArray[section] count];
}

- (ParkData *)parkDataAtIndexPath:(NSIndexPath *)indexPath {
    
    return self.parkDataArray[indexPath.section][indexPath.item];
}

@end
