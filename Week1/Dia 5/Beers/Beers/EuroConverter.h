//
//  EuroConverter.h
//  Beers
//
//  Created by Ainhoa Calviño Rodriguez on 11/09/15.
//  Copyright (c) 2015 Ainhoa Calviño Rodriguez. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreGraphics/CoreGraphics.h>

@interface EuroConverter : NSObject

@property (nonatomic, assign) CGFloat money;

+ (int)convertFromEuroToPeseta:(float)euros;
+ (float)convertFromPesetaToEuro:(int)pesetas;

- (int) convertFromEuroToPeseta;
- (float)convertFromPesetaToEuro;

@end
