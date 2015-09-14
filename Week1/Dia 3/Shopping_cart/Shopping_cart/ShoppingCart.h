//
//  ShoppingCart.h
//  Shopping_cart
//
//  Created by Ainhoa Calviño Rodriguez on 07/09/15.
//  Copyright (c) 2015 Ainhoa Calviño Rodriguez. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Item.h"

static double const DISCOUNT;

@interface ShoppingCart : NSObject

@property (strong, nonatomic) NSMutableArray *totalItems;

- (BOOL) addItem : (Item *) item;
- (double) getTotal;
- (double) discount;

@end