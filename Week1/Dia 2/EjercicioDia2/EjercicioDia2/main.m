//
//  main.m
//  EjercicioDia2
//
//  Created by Ainhoa Calviño Rodriguez on 08/09/15.
//  Copyright (c) 2015 Ainhoa Calviño Rodriguez. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "IronhackPerson.h"
#import "IronhackShoutingPerson.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        IronhackPerson *ironhacker = [[IronhackPerson alloc] init];
        
        NSMutableString *name = [[NSMutableString alloc] initWithString:@"Ainhoa"];
        ironhacker.firstName = name;
        ironhacker.lastName = @"Calviño";
        ironhacker.birth = [NSDate date];
        
        [name appendString:@"ita"];
        [ironhacker sayHello];
        [ironhacker saySomething:@"Bienvenidos"];
        
        NSLog(@"descripcion %@", ironhacker);
        
        IronhackShoutingPerson *ironhackerShouting = [IronhackShoutingPerson person];
        [ironhackerShouting saySomething:@"mama"];
        
        IronhackPerson *otherIronhack = [IronhackPerson personWithFirstName:@"Noa" lastName:@"Gupy" birthDate:[NSDate date]];
        [otherIronhack sayHello];
        
        IronhackPerson *pruebaIronhack;
        NSLog(@"%@",pruebaIronhack);
    }
    return 0;
}
