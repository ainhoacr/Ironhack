//
//  AppDelegate.m
//  SplitViewController
//
//  Created by Ainhoa Calviño Rodriguez on 15/09/15.
//  Copyright (c) 2015 Ainhoa Calviño Rodriguez. All rights reserved.
//

#import "AppDelegate.h"
#import "FirstViewController.h"
#import "SecondViewController.h"

@interface AppDelegate () <UISplitViewControllerDelegate>

@property (nonatomic, strong) SecondViewController *secondViewController;
@property (nonatomic, strong) UISplitViewController *splitViewController;

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    self.window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    
    self.splitViewController = [[UISplitViewController alloc]init];
    FirstViewController *firstViewController = [[FirstViewController alloc]init];
    self.secondViewController = [[SecondViewController alloc]init];
    
    UINavigationController *navigationController = [[UINavigationController alloc]initWithRootViewController:self.secondViewController];
    
    self.splitViewController.viewControllers = @[firstViewController,navigationController];
    self.splitViewController.delegate = self;
    
    self.window.rootViewController = self.splitViewController;
    [self showButtonIfNeededByDisplayMode:self.splitViewController.displayMode];
    [self.window makeKeyAndVisible];
    
    return YES;
}

- (void)splitViewController:(UISplitViewController *)splitViewController willChangeToDisplayMode:(UISplitViewControllerDisplayMode)displayMode
{
    [self showButtonIfNeededByDisplayMode:displayMode];
}

- (void)showButtonIfNeededByDisplayMode:(UISplitViewControllerDisplayMode)displayMode
{
    if (displayMode == UISplitViewControllerDisplayModePrimaryHidden)
    {
        self.secondViewController.navigationItem.leftBarButtonItem = self.splitViewController.displayModeButtonItem;
    }
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
