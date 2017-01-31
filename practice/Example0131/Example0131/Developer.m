//
//  Developer.m
//  Example0131
//
//  Created by Woncheol on 2017. 1. 31..
//  Copyright © 2017년 fornew21c. All rights reserved.
//

#import "Developer.h"

@implementation Developer

- (void)developing
{
    NSLog(@"%@ is developing new iOS App", self.name);
}

- (void)settingJob:(NSString*)myJob
{
    [super settingJob:myJob];
    NSLog(@"%@'s job is %@", self.name, self.job);
}
@end
