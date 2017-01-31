//
//  Designer.m
//  Example0131
//
//  Created by Woncheol on 2017. 1. 31..
//  Copyright © 2017년 fornew21c. All rights reserved.
//

#import "Designer.h"
#import "Person.h"

@implementation Designer

- (void)designing
{
    NSLog(@"%@ is designing new iOS app's Login page", self.name);
}

- (void)settingJob:(NSString*)myJob
{
    self.job = myJob;
    NSLog(@"My job is %@", self.job);
}
@end
