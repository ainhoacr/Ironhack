//
//  Collection.h
//  MemeRastreatorl
//
//  Created by Ainhoa Calviño Rodriguez on 15/10/15.
//  Copyright © 2015 Ainhoa Calviño Rodriguez. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol Collection <NSObject>

@required
- (void)addElement:(id)element;
- (NSUInteger)count;
- (NSArray *)allElements;
- (void)removeElement:(id)element;

@optional
- (id)randomElement;

@end
