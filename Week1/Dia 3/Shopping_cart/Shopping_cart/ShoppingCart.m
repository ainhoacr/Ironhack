//
//  ShoppingCart.m
//  Shopping_cart
//
//  Created by Ainhoa Calviño Rodriguez on 07/09/15.
//  Copyright (c) 2015 Ainhoa Calviño Rodriguez. All rights reserved.
//

#import "ShoppingCart.h"

static double const DISCOUNT = 5;

@implementation ShoppingCart

- (instancetype)init
{
    self = [super init];
    if (self)
    {
        self.totalItems = [[NSMutableArray alloc] init];
    }
    return self;
}


- (BOOL) addItem : (Item *) item
{
    
    [self.totalItems addObject:item];
    return [self.totalItems containsObject:item];
}

- (double) getTotal
{
    double total = 0.0;
    
    for (Item *item in self.totalItems) {
        total = total + item.price;
    }
    return total;
}

- (double) discount
{
    double total = self.getTotal;
    return total * DISCOUNT / 100;
}

@end
