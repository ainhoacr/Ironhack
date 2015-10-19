//
//  RandomIPGeneratorSpec.m
//  GeoIP
//
//  Created by Ainhoa Calviño Rodriguez on 16/10/15.
//  Copyright © 2015 Ainhoa Calviño Rodriguez. All rights reserved.
//

#import <Kiwi/Kiwi.h>
#import <ObjectiveSugar/ObjectiveSugar.h>
#import "RandomIP.h"

SPEC_BEGIN(RandomIPSpec)

describe(@"When using RandomIP objects in memory", ^{
    it(@"after creation it returns a non-nil object", ^{
       
        NSString *sut = [[[RandomIP alloc]init] generateARandomIP];
        [[sut shouldNot] beNil];
        
    });
    
    it(@"should store the IP address", ^{
        
        NSArray *sut = [[[RandomIP alloc]init] generateRandomIPs:10];
        [[sut shouldNot] beNil];
        [[@(sut.count) should] equal:@10];
        
        [@10 timesWithIndex:^(int index) {
            
        }];
    });
});

SPEC_END