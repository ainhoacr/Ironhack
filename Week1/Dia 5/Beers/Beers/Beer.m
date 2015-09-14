
//
//  Beer.m
//  Beers
//
//  Created by Ainhoa Calviño Rodriguez on 11/09/15.
//  Copyright (c) 2015 Ainhoa Calviño Rodriguez. All rights reserved.
//

#import "Beer.h"

@implementation Beer

- (NSString *)getName
{
    return name;
}

- (void)name:(NSString *)newName
{
    name = newName;
}

- (NSString *)getColor
{
    return color;
}

- (void)color:(NSString *)newColor
{
    color = newColor;
}

- (NSUInteger)getGrade
{
    return grade;
}
- (void)grade:(NSUInteger)newGrade
{
    grade = newGrade;
}

- (NSString *)description
{
    return [NSString stringWithFormat:@"Name: %@\nColor: %@\nGrade: %ld\n", name,color,grade];
}

@end
