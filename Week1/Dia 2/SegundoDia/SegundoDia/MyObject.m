//
//  MyObject.m
//  SegundoDia
//
//  Created by Ainhoa Calviño Rodriguez on 08/09/15.
//  Copyright (c) 2015 Ainhoa Calviño Rodriguez. All rights reserved.
//

#import "MyObject.h"

@implementation MyObject

+ (instancetype)sharedInstance
{
    static id sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance =self.new;
    });
    
    return sharedInstance;
}

+ (NSString *) myClassMethod:(NSString *) str1 and:(NSString *) str2
{
    return [NSString stringWithFormat:@"%@ %@", str1, str2];
}

+ (void) execute:(MyBlock) block
{
    block(@"Hello", @"World");
}

- (int) myInstanceMethod:(int) int1 and:(int) int2
{
    return int1 + int2;
}

-(void) rockAndRollBaby: (id)sender
{
    
}

- (NSNumber *) myOtherInstanceMethod:(NSNumber *) number1 and:(NSNumber *) number2
{
    return @([number1 intValue] + [number2 intValue]);
}
@end
