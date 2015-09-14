//
//  AppDelegate.m
//  Beers
//
//  Created by Ainhoa Calviño Rodriguez on 11/09/15.
//  Copyright (c) 2015 Ainhoa Calviño Rodriguez. All rights reserved.
//

#import "AppDelegate.h"
#import "Beer.h"
#import "Person.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    Beer *estrella = [[Beer alloc]init];
    [estrella name:@"Estrella Galicia"];
    [estrella color:@"Rubia"];
    [estrella grade:6.5];
    
    Beer *morizt = [[Beer alloc]init];
    [morizt name:@"Moritz"];
    [morizt color:@"Rubia"];
    [morizt grade:5.4];
    
    
    NSLog(@"%@", estrella);
    NSLog(@"%@", morizt);
    
    Person *diego = [[Person alloc]initWithName:@"Diego" address:@"Calle Barcelona" age:22];
    NSLog(@"Person: %@, address: %@ and age: %ld", diego.name, diego.address, diego.age);
    
    Person *pepe = [Person createPersonWithName:@"Pepe"];
    NSLog(@"Person: %@", pepe.name);
    
    Person *groucho = [Person createPersonWithName:@"Groucho" address:@"Calle Brasil"];
    NSLog(@"Person: %@, address: %@", groucho.name, groucho.address);
    
    NSMutableArray *persons = [[NSMutableArray alloc]initWithArray:@[diego, pepe, groucho]];
    
    for (int i=0; i<100; i++)
    {
        NSString *name = [NSString stringWithFormat:@"Person %d", i];
        [persons addObject:[Person createPersonWithName:name]];
    }
    NSLog(@"Array %@", persons);
    
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
