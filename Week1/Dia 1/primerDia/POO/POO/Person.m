//
//  Person.m
//  POO
//
//  Created by Ainhoa Calviño Rodriguez on 07/09/15.
//  Copyright (c) 2015 Ainhoa Calviño Rodriguez. All rights reserved.
//

#import "Person.h"

@implementation Person

//+ (NSString *) className
//{
//    return @"Person Class";
//}
//
//- (NSString *) name
//{
//    return @"Person";
//}

- (instancetype) initWithName : (NSString *) myName
{
    self = [super init];
 
    if (self)
    {
        self.name = myName;
    }
    return self;
}

- (NSString *) description
{
    return [NSString stringWithFormat:@"<Person: %@>", self.name];
}

- (BOOL)sendeMyFlowerTo : (Person *) target
{
    if (self.flower)
    {
        if (!target.flower)
        {
            target.flower = self.flower;
            self.flower = nil;
            return YES;
        }
    }
    return NO;
}

@end
