//
//  IronhackPerson.h
//  EjercicioDia2
//
//  Created by Ainhoa Calviño Rodriguez on 08/09/15.
//  Copyright (c) 2015 Ainhoa Calviño Rodriguez. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface IronhackPerson : NSObject

@property (strong, nonatomic) NSString *firstName;
@property (strong, nonatomic) NSString *lastName;
@property (strong, nonatomic) NSDate *birth;

+(instancetype)person;

+ (instancetype)personWithFirstName:(NSString *)firstName lastName:(NSString *)lastName birthDate:(NSDate *)birth;
- (instancetype)initWithFirstName:(NSString *)firstName lastName:(NSString *)lastName birthDate:(NSDate *)birth;

- (NSString *) description;
- (void) sayHello;
- (void) saySomething:(NSString *)greeting;

@end
