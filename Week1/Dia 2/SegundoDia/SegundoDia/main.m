//
//  main.m
//  SegundoDia
//
//  Created by Ainhoa Calviño Rodriguez on 08/09/15.
//  Copyright (c) 2015 Ainhoa Calviño Rodriguez. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MyObject.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
//        NSMutableString *myString1 = [NSMutableString new];
//        NSMutableString *myString1 = [NSMutableString string];
//        NSMutableString *myString1 = [[NSMutableString alloc] init];
//        NSString *myString2 = myString1;
//        [myString1 appendString:@"Hello, "];
//        [myString1 appendString:@"World!"];
//        NSString *s = myString2;
//        NSLog(@"%@", s);
        
        NSString *myString3 = [MyObject myClassMethod:@"Hola" and:@"Ainhoa"];
        MyObject *myObject = [[MyObject alloc] init];
//        [myObject performSelector:@selector(rockAndRollBaby:) withObject:myString3 afterDelay:3000];
        [myObject rockAndRollBaby:myString3];
        int myInt = [myObject myInstanceMethod:1 and:2];
        
        myInt = [[myObject myOtherInstanceMethod:@3 and:@2] intValue];
        myInt = [[myObject performSelector:@selector(myOtherInstanceMethod:and:) withObject:@3 withObject:@2] intValue];
        
        NSLog(@"string: %@  int: %d", myString3, myInt);
        
        [MyObject execute:^(NSString *str1, NSString *str2) {
            NSLog(@"execute %@ %@",str1,str2);
        }];
        
        [MyObject execute:^(NSString *str1, NSString *str2) {
            NSLog(@"execute2 %@ %@",str2,str1);
        }];
    }
    return 0;
}
