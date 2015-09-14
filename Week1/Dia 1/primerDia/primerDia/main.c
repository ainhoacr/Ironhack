//
//  main.c
//  primerDia
//
//  Created by Ainhoa Calviño Rodriguez on 07/09/15.
//  Copyright (c) 2015 Ainhoa Calviño Rodriguez. All rights reserved.
//

#include <stdio.h>
#include "ASCII.h"

int sum (int num1, int num2)
{
    return num1 + num2;
}



int main(int argc, const char * argv[]) {
    //printASCII();
    
    int var = 20;
    int *ip;
    
    ip = &var;
    
    printf("valor memoria de &var %p \n", &var);
    printf("valor de memoria de ip %p \n", ip);
    printf("valor de *ip %d \n", *ip);
    
    return 0;
}
