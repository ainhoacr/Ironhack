//
//  AppDelegate.m
//  UIPopover
//
//  Created by Ainhoa Calviño Rodriguez on 15/09/15.
//  Copyright (c) 2015 Ainhoa Calviño Rodriguez. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate () <UIPopoverControllerDelegate>

@property (nonatomic, strong) UIPopoverController *popoverController;

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    self.window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    
    UIViewController *mainViewController = [[UIViewController alloc]init];
    mainViewController.view.backgroundColor = [UIColor purpleColor];
    mainViewController.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"Mostrar" style:UIBarButtonItemStylePlain target:self action:@selector(showPopover:)];
    
    UINavigationController *navigationController = [[UINavigationController alloc]initWithRootViewController:mainViewController];
    
    self.window.rootViewController = navigationController;
    [self.window makeKeyAndVisible];
    
    return YES;
}

- (void)showPopover:(UIBarButtonItem *)buttonItem
{
    UIViewController *presentedViewController = [[UIViewController alloc]init];
    presentedViewController.view.backgroundColor = [UIColor redColor];

    UIButton *closeButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [closeButton setTitle:@"Cerrar" forState:UIControlStateNormal];
    closeButton.frame = CGRectMake(100, 100, 100, 40);
    [closeButton addTarget:self action:@selector(closePopover) forControlEvents:UIControlEventTouchUpInside];
    
    [presentedViewController.view addSubview:closeButton];
    
    self.popoverController = [[UIPopoverController alloc]initWithContentViewController:presentedViewController];
    self.popoverController.backgroundColor = presentedViewController.view.backgroundColor;
    self.popoverController.delegate = self;
    
    [self.popoverController presentPopoverFromBarButtonItem:buttonItem permittedArrowDirections:UIPopoverArrowDirectionAny animated:YES];
}

- (void)closePopover
{
    [self.popoverController dismissPopoverAnimated:YES];
}

- (BOOL)popoverControllerShouldDismissPopover:(UIPopoverController *)popoverController
{
    return NO;
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
