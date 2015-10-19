//
//  AppDelegate.m
//  MemoriaAPelo_mrc
//
//  Created by Ainhoa Calviño Rodriguez on 15/10/15.
//  Copyright © 2015 Ainhoa Calviño Rodriguez. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@property(nonatomic,assign) NSArray *myArray;  // es el weak mejorado, porque se pone a nil
@property(nonatomic,copy) NSArray *myArrayC;
@property(nonatomic,retain) NSArray *myArrayR; // es el strong 

@end

@implementation AppDelegate

@synthesize myArray = _myArray;

- (NSArray *)myArray
{
    return _myArray;
}

- (void)setMyArray:(NSArray *)myArray {
    _myArray = myArray;
}

@synthesize myArrayC = _myArrayC;

- (NSArray *)myArrayC
{
    return _myArrayC;
}

- (void)setMyArrayC:(NSArray *)myArrayC {
    _myArrayC = [myArrayC copy];
}

@synthesize myArrayR = _myArrayR;

- (NSArray *)myArrayR
{
    return _myArrayR;
}

- (void)setMyArrayR:(NSArray *)myArrayR {
    _myArrayR = [myArrayR retain];
}

- (void)dealloc {
    [super dealloc];
    
    [_myArrayC release];
    [_myArrayR release];
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    NSArray *array = [[NSArray alloc]init];
    [array count];
    [array release];
    
    NSArray *second = [self newArray];
    [second release];
    
    NSArray *third = [self newArray2];
    [third release];
    
    NSArray *fourth = [self array3];
    [fourth retain];
    [fourth release];
    
    return YES;
}

- (NSArray *)newArray {
    NSArray *array = [NSArray arrayWithObjects:@1, @2, @3, @4, nil];
    
    [array retain];
    
    return array;
}

- (NSArray *)newArray2 {
    NSArray * array = [[NSArray alloc]initWithObjects:@1, @2, @3, @4, nil];
    
    return array;
}

- (NSArray *)array3 {
    NSArray * array = [[NSArray alloc]initWithObjects:@1, @2, @3, @4, nil];
    
    return [array autorelease];
}

@end
