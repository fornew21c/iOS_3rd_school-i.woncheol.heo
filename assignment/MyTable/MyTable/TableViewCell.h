//
//  TableViewCell.h
//  MyTable
//
//  Created by Woncheol on 2017. 2. 19..
//  Copyright © 2017년 fornew21c. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TableViewCell : UITableViewCell

- (void)setDataWithRank:(NSString *)rankStr
                   icon:(NSString *)iconStr
                  title:(NSString *)titleStr
                  genre:(NSString *)genreStr
                 review:(NSString *)reviewImg;
@end
