//
//  EuroConverter.m
//  Beers
//
//  Created by Ainhoa Calviño Rodriguez on 11/09/15.
//  Copyright (c) 2015 Ainhoa Calviño Rodriguez. All rights reserved.
//

#import "EuroConverter.h"

#define CONVERT_VALUE 166.386

@implementation EuroConverter

+ (int)convertFromEuroToPeseta:(float)euros;
{
    return (int) euros * CONVERT_VALUE;
}

+ (float)convertFromPesetaToEuro:(int)pesetas
{
    return (float) pesetas / CONVERT_VALUE;
}

- (int) convertFromEuroToPeseta
{
    return (int) self.money * CONVERT_VALUE;
}

- (float)convertFromPesetaToEuro
{
    return (float) self.money / CONVERT_VALUE;
}

@end
