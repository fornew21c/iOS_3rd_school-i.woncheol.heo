//
//  AppDelegate.m
//  TabbarExmaple
//
//  Created by Woncheol on 2017. 2. 21..
//  Copyright © 2017년 fornew21c. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    //1.윈도우 만들기
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    
    //2.TabBarViewController 만들기
    ViewController *vc1 = [[ViewController alloc] init];
    
    UITabBarController *tabbar = [[UITabBarController alloc] init];
    tabbar.viewControllers = @[vc1];
    
    
    //3.탭바 아이콘 설정
    UITabBarItem *item1 = [[UITabBarItem alloc] initWithTitle:@"테스트1" image:[UIImage imageNamed:@"home.png"] selectedImage:[UIImage imageNamed:@"home.png"]  ];
    
    vc1.tabBarItem = item1;

    
    
    
    //4.윈도우에 RootViewController 지정
    self.window.rootViewController = tabbar;
    [self.window makeKeyAndVisible];
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
