//
//  AppDelegate.m
//  SampleProject
//
//  Created by Bachir El Khoury on 3/12/12.
//  Copyright (c) 2012 Bachir El Khoury. All rights reserved.
//

#import "AppDelegate.h"
#import "UIImage+Sprite.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor darkGrayColor];
    [self.window makeKeyAndVisible];
    
    
    self.mySprites      = [UIImage spritesWithContentsOfFile:@"SampleTexture.xml"];
    
    UIImageView *cloud  = [[UIImageView alloc]initWithImage:[self.mySprites objectForKey:@"cloud_1.png"]];
    cloud.center = CGPointMake(150, 150);
    
    UIImageView *hill  = [[UIImageView alloc]initWithImage:[self.mySprites objectForKey:@"hill_1.png"]];
    hill.center = CGPointMake(160, 240);
    
    UIImageView *tree  = [[UIImageView alloc]initWithImage:[self.mySprites objectForKey:@"tree.png"]];
    tree.center = CGPointMake(200, 200);

    
    [self.window addSubview:cloud];
    [self.window addSubview:hill];
    [self.window addSubview:tree];
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
