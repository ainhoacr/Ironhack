//
//  AppDelegate.m
//  Vistas
//
//  Created by Ainhoa Calviño Rodriguez on 21/09/15.
//  Copyright © 2015 Ainhoa Calviño Rodriguez. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@property (nonatomic, strong) UIButton *buttonAdd;
@property (nonatomic, strong) UIButton *buttonRemove;
@property (nonatomic, strong) UILabel *labelFirst;
@property (nonatomic, strong) UIView *subView;
@property (nonatomic, strong) UIButton *buttonSecond;
@property (nonatomic, strong) UIImageView *imageView;
@property (nonatomic, strong) UIViewController *viewController;

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    self.viewController = [[UIViewController alloc]init];
    
    [self createSuperView];
    [self createSubView];
    [self buttonActions];
    
    self.window.rootViewController = self.viewController;
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)createSuperView
{
    self.buttonAdd = [UIButton buttonWithType:UIButtonTypeSystem];
    self.buttonRemove = [UIButton buttonWithType:UIButtonTypeSystem];
    
    self.labelFirst = [[UILabel alloc]initWithFrame:CGRectMake(100, 100, 100, 40)];
    
    [self drawSuperView];
}

- (void)drawSuperView
{
    [self.buttonAdd setTitle:@"Add" forState:UIControlStateNormal];
    self.buttonAdd.frame = CGRectMake(100, 50, 60, 40);
    
    [self.buttonRemove setTitle:@"Remove" forState:UIControlStateNormal];
    self.buttonRemove.frame = CGRectMake(200, 50, 60, 40);
    
    self.labelFirst.text = @"Etiqueta";
    self.labelFirst.textColor = [UIColor whiteColor];
 
    [self.viewController.view addSubview:self.buttonAdd];
    [self.viewController.view addSubview:self.buttonRemove];
    [self.viewController.view addSubview:self.labelFirst];
}

- (void)createSubView
{
    self.subView = [[UIView alloc]initWithFrame:CGRectMake(100, 200, 200, 200)];
    self.buttonSecond = [UIButton buttonWithType:UIButtonTypeSystem];
    self.imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"kyra"]];

    [self drawSubviews];
}

- (void)drawSubviews
{
    [self.buttonSecond setTitle:@"boton" forState:UIControlStateNormal];
    self.buttonSecond.frame =CGRectMake(50, 50, 40, 40);
    
    self.imageView.frame = CGRectMake(50, 100, 100, 100);
    
    [self.subView addSubview:self.buttonSecond];
    [self.subView addSubview:self.imageView];
    [self.viewController.view addSubview:self.subView];
}

- (void) buttonActions
{
    [self.buttonAdd addTarget:self action:@selector(buttonPressedAddSubView) forControlEvents:UIControlEventTouchUpInside];
    [self.buttonRemove addTarget:self action:@selector(buttonPressedRemoveView) forControlEvents:UIControlEventTouchUpInside];
}

- (void)buttonPressedAddSubView
{
    [self drawSubviews];
}

- (void)buttonPressedRemoveView
{
    [self.imageView removeFromSuperview];
    [self.buttonSecond removeFromSuperview];
    [self.subView removeFromSuperview];
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
