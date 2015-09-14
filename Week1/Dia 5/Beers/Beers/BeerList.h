//
//  BeerList.h
//  Beers
//
//  Created by Ainhoa Calviño Rodriguez on 11/09/15.
//  Copyright (c) 2015 Ainhoa Calviño Rodriguez. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BeerList : NSObject

@property (nonatomic, readonly, assign) NSUInteger count;

- (void)addBeer:(NSString *)beer;
- (void)removeBeer:(NSString *)beer;
- (NSArray *)allBeers;

@end
