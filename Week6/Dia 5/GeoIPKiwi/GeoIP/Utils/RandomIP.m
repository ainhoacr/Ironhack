//
//  RandomIP.m
//  GeoIP
//
//  Created by Ainhoa Calviño Rodriguez on 13/10/15.
//  Copyright © 2015 Ainhoa Calviño Rodriguez. All rights reserved.
//

#import "RandomIP.h"
#import "RandomNumber.h"

@interface RandomIP ()

@end

@implementation RandomIP

- (NSString *)generateARandomIP {
    NSUInteger firstNumber = [RandomNumber randomNumberBetweenZeroAnd:255];
    NSUInteger secondNumber = [RandomNumber randomNumberBetweenZeroAnd:255];
    NSUInteger thirdNumber = [RandomNumber randomNumberBetweenZeroAnd:255];
    NSUInteger fourNumber = [RandomNumber randomNumberBetweenZeroAnd:255];
    
    return [NSString stringWithFormat:@"%lu.%lu.%lu.%lu", firstNumber, secondNumber, thirdNumber, fourNumber];
}

- (NSArray<NSString *> *)generateRandomIPs:(NSUInteger)number {
    
    if (number == 0) {
        return nil;
    }
    
    NSMutableArray *ips = [[NSMutableArray alloc]initWithCapacity:number];
    
    for (NSUInteger i=0; i<number; i++) {
        NSString *ip = [self generateARandomIP];
        
        [ips addObject:ip];
    }
    
    return [ips copy];
}

@end
