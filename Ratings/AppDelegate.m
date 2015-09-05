//
//  AppDelegate.m
//  Ratings
//
//  Created by Tasvir H Rohila on 21/08/15.
//  Copyright (c) 2015 Tasvir H Rohila. All rights reserved.
//

#import "AppDelegate.h"
#import "Player.h"
#import "PlayersViewController.h"

@interface AppDelegate ()
@end

@implementation AppDelegate

//Instance variable
NSMutableArray *players;


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    //This simply creates some Player objects and adds them to the players array.
    players = [NSMutableArray arrayWithCapacity:20];
    Player *player = [[Player alloc] init];
    player.name = @"Johnny";
    player.game = @"Angry Birds";
    player.rating = 4;
    [players addObject:player];
    player = [[Player alloc] init];
    player.name = @"Gary Kasparov";
    player.game = @"Chess";
    player.rating = 5;
    [players addObject:player];
    player = [[Player alloc] init];
    player.name = @"Marvin";
    player.game = @"Nintendo";
    player.rating = 2;
    [players addObject:player];
    
    //the storyboard’s initial view controller is a Tab Bar Controller, so we can look up the window’s rootViewController and cast it.
    UITabBarController *tabBarController = (UITabBarController *) self.window.rootViewController;
    
    //Navigation controller is the first tab in the TabBarController
    UINavigationController *navController = [[tabBarController viewControllers] objectAtIndex:0];
    
    //PlayersViewController is the first object in the NavigationController
    PlayersViewController *playersViewController = [[navController viewControllers] objectAtIndex:0];
    
    //assign
    playersViewController.players = players;
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
