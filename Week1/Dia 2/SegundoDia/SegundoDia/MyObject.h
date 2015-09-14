//
//  MyObject.h
//  SegundoDia
//
//  Created by Ainhoa Calviño Rodriguez on 08/09/15.
//  Copyright (c) 2015 Ainhoa Calviño Rodriguez. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^MyBlock)(NSString *str1, NSString *str2);

@interface MyObject : NSObject

// el + indica que es un metodo de clase
+ (NSString *) myClassMethod:(NSString *) str1 and:(NSString *) str2;

+ (void) execute:(MyBlock) block;

//el - indica que es un metodo de instancia
- (int) myInstanceMethod:(int) int1 and:(int) int2;

- (NSNumber *) myOtherInstanceMethod:(NSNumber *) number1 and:(NSNumber *) number2;

-(void) rockAndRollBaby: (id)sender;

@end
