//
//  BeerList.m
//  Beers
//
//  Created by Ainhoa Calviño Rodriguez on 11/09/15.
//  Copyright (c) 2015 Ainhoa Calviño Rodriguez. All rights reserved.
//

#import "BeerList.h"

@interface BeerList()

@property (nonatomic, strong) NSMutableArray *beerList;

@end

@implementation BeerList

- (instancetype)init
{
    self = [super self];
    
    if (self)
    {
        self.beerList = [[NSMutableArray alloc]init];
    }
    
    return self;
}

- (void)addBeer:(NSString *)beer
{
    [self.beerList addObject:beer];
}

- (void)removeBeer:(NSString *)beer
{
    [self.beerList removeObject:beer];
}

- (NSArray *)allBeers
{
    return [self.beerList copy];
}

- (NSUInteger)count
{
    return self.beerList.count;
}

@end
