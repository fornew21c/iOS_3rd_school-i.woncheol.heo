//
//  ToolBox.h
//  Example0201
//
//  Created by Woncheol on 2017. 2. 1..
//  Copyright © 2017년 fornew21c. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ToolBox : NSObject

- (void)multiplicationTable:(NSUInteger)dan;
- (void)multiplicationTable2:(NSUInteger)dan;
- (NSString*)findMultipleNum:(NSUInteger)num maxRange:(NSUInteger)maxRange;
- (void)addAllNum:(NSUInteger)num;
- (void)findStar:(NSString*)str;
- (NSUInteger)factorial:(NSUInteger)num;
- (void)game369:(NSUInteger)max;
- (NSString*)findMultipleNum2:(NSUInteger)num maxRange:(NSUInteger)maxRange;
- (void)printMultipleNumbers;
- (void)printStar:(NSUInteger)num;
- (void)printReverseStar:(NSUInteger)num;

@end
