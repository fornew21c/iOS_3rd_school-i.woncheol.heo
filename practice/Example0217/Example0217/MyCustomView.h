//
//  MyCustomView.h
//  Example0217
//
//  Created by Woncheol on 2017. 2. 17..
//  Copyright © 2017년 fornew21c. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MyCustomView : UIView

- (instancetype)initWithFrame:(CGRect)frame;

- (void)setDataWithIMGName:(NSString *)imgurlStr
                      name:(NSString *)nameStr
                       msg:(NSString *)msgStr;
@end
