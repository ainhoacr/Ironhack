//
//  Person.h
//  POO
//
//  Created by Ainhoa Calviño Rodriguez on 07/09/15.
//  Copyright (c) 2015 Ainhoa Calviño Rodriguez. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Flower.h"

@interface Person : NSObject
//{
//    NSString *name;
//    int age;
//}

//+ (NSString *) className;
//
//- (NSString *) name;

@property (strong, nonatomic) NSString *name;
@property (strong, nonatomic) Flower *flower;
@property (assign, nonatomic) int age;

- (instancetype) initWithName : (NSString *) myName;
- (BOOL)sendeMyFlowerTo : (Person *) target;
@end
