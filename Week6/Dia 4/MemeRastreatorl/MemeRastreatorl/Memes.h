//
//  Memes.h
//  MemeRastreatorl
//
//  Created by Ainhoa Calviño Rodriguez on 15/10/15.
//  Copyright © 2015 Ainhoa Calviño Rodriguez. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Meme.h"
#import "Collection.h"

@interface Memes : NSObject <Collection>

- (instancetype)initWithPlistNamed:(NSString *)name;

- (void)addElement:(Meme *)element;
- (NSArray<Meme *> *)allElements;
- (void)removeElement:(Meme *)element;
- (Meme *)randomElement;

@end
