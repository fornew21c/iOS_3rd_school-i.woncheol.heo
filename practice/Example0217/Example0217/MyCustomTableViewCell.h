//
//  MyCustomTableViewCell.h
//  Example0217
//
//  Created by Woncheol on 2017. 2. 17..
//  Copyright © 2017년 fornew21c. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MyCustomTableViewCell : UITableViewCell

- (void)setDataWithIMGName:(NSString *)imgurlStr
                     title:(NSString *)titleStr
                      name:(NSString *)nameStr
                       msg:(NSString *)msgStr;

- (void)updateLayout;
@end
