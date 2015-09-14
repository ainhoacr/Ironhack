//
//  main.m
//  POO
//
//  Created by Ainhoa Calviño Rodriguez on 07/09/15.
//  Copyright (c) 2015 Ainhoa Calviño Rodriguez. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "Person.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        
        //Person *senderPerson = [[Person alloc] init];
        // arriba y abajo son equivalentes
        //Person *targetPerson = [Person new];
        
        Person *senderPerson1 = [[Person alloc] initWithName:@"Manolo"];
        
        senderPerson1.flower = [[Flower alloc] init];
        senderPerson1.flower.name = @"Rosa";
        
        Person *targetPerson1 = [[Person alloc] initWithName:@"Lolita"];
        NSLog(@"%@", senderPerson1.flower);
        
        BOOL result = [senderPerson1 sendeMyFlowerTo:targetPerson1];
        
        NSLog(@"%@", result ? @"ENVIADA!" : @"PARGUELA!");
        
        NSLog(@"Flor de Lolita %@", targetPerson1.flower.name);
        
        //set
        senderPerson1.name = @"Pepito";
        
        //get
        NSLog(@"%@", senderPerson1.name);
        
        senderPerson1.age = 22;
        NSLog(@"%d", senderPerson1.age);
        
        //NSLog(@"%@", [senderPerson name]);
        
        NSLog(@"%@", [Person className]);
        NSLog(@"Hello, World!");
    }
    return 0;
}
