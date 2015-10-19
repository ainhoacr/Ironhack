//
//  Memes.m
//  MemeRastreatorl
//
//  Created by Ainhoa Calviño Rodriguez on 15/10/15.
//  Copyright © 2015 Ainhoa Calviño Rodriguez. All rights reserved.
//

#import "Memes.h"

@interface Memes ()

@property (nonatomic, strong) NSMutableArray *list;

@end

@implementation Memes

- (instancetype)initWithPlistNamed:(NSString *)name {
    
    self = [super init];
    
    if (self) {
        NSString *path = [[NSBundle mainBundle] pathForResource:name ofType:@"plist"];
        NSArray *memesUrls = [NSArray arrayWithContentsOfFile:path];
        
        for (NSString *s in memesUrls) {
            Meme *m = [[Meme alloc]init];
            m.url = s;
            [self.list addObject:m];
        }
    }
    return self;
    
}


- (NSMutableArray *)list {

    if (_list == nil) {
        _list = [[NSMutableArray alloc]init];
    }
    
    return _list;
}

- (void)addElement:(Meme *)element {
    [self.list addObject:element];
}

- (NSUInteger)count {
    return self.list.count;
}

- (NSArray<Meme *> *)allElements {
    return self.list;
}

- (void)removeElement:(Meme *)element {
    [self.list removeObject:element];
}

- (Meme *)randomElement {
    
    if ([self count] == 0) {
        return nil;
    }
    
    int i = arc4random() % [self count];
    
    return [self.list objectAtIndex:i];
}

@end
