//
//  Beer.h
//  Beers
//
//  Created by Ainhoa Calviño Rodriguez on 11/09/15.
//  Copyright (c) 2015 Ainhoa Calviño Rodriguez. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Beer : NSObject
{
    NSString *name;
    NSString *color;
    NSUInteger grade;
}

- (NSString *)getName;
- (void)name:(NSString *)newName;

- (NSString *)getColor;
- (void)color:(NSString *)newColor;

- (NSUInteger)getGrade;
- (void)grade:(NSUInteger)newGrade;

@end
