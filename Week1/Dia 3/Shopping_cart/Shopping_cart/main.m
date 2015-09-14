//
//  main.m
//  Shopping_cart
//
//  Created by Ainhoa Calviño Rodriguez on 07/09/15.
//  Copyright (c) 2015 Ainhoa Calviño Rodriguez. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Item.h"
#import "ShoppingCart.h"



int main(int argc, const char * argv[]) {
    @autoreleasepool {
        Item *apple = [[Item alloc] init];
        apple.name = @"Apple";
        apple.price = 10;
        
        Item *orange = [[Item alloc] init];
        orange.name = @"Orange";
        orange.price = 5;
        
        Item *grapes = [[Item alloc] init];
        grapes.name = @"Grapes";
        grapes.price = 15;
        
        Item *banana = [[Item alloc] init];
        banana.name = @"Banana";
        banana.price = 20;
        
        Item *watermelon = [[Item alloc] init];
        watermelon.name = @"Watermelon";
        watermelon.price = 50;
        
        ShoppingCart *shoppingCart = [[ShoppingCart alloc] init];
        
        [shoppingCart addItem:apple];
        [shoppingCart addItem:orange];
        [shoppingCart addItem:grapes];
        [shoppingCart addItem:banana];
        [shoppingCart addItem:watermelon];
        [shoppingCart addItem:apple];
        [shoppingCart addItem:apple];
        [shoppingCart addItem:apple];
        
        double totalCart = shoppingCart.getTotal;
        NSLog(@"Precio sin descuentos %.2f\n", totalCart);
        
        NSUInteger count = [shoppingCart.totalItems count];
        double firstDiscount = shoppingCart.discount;
        double totalCartWithDiscount = totalCart - firstDiscount;
        if (count >= 5)
        {
            NSLog(@"Precio con primer descuento >=5 %.2f\n", totalCartWithDiscount);
        }
        
        int cont = 0;
        double priceApples = 0.0;
        for (Item *item in shoppingCart.totalItems) {
            if ([item.name isEqualToString:@"Apple"])
            {
                cont++;
                priceApples = priceApples + item.price;
            }
        }
        double totalWithApple=0.0;
        if (cont % 2 == 0)
        {
            double discountApple = priceApples / 2;
            totalWithApple = totalCartWithDiscount - discountApple;
            NSLog(@"Precio con descuento manzanas %.2f\n", totalWithApple);
        }
        else
        {
            int div = cont / 2;
            totalWithApple = totalCartWithDiscount - (apple.price * div);
            NSLog(@"Precio con descuento manzanas %.2f\n", totalWithApple);
        }
        
        double hundred = 100.00;
        double totalPurchase = 0.0;
        if (totalWithApple >= hundred)
        {
            totalPurchase = totalWithApple - 10.0;
            NSLog(@"Precio con descuento de 10€ %.2f\n", totalPurchase);
        }
        else
        {
            if (totalWithApple == totalPurchase &&
                totalCartWithDiscount >= hundred)
            {
                totalPurchase = totalCartWithDiscount - 10.0;
                NSLog(@"Precio con descuento de 10€ %.2f\n", totalPurchase);
            }
        }
        
    }
    return 0;
}
