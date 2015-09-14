//
//  ViewController.h
//  MyFirstApp
//
//  Created by Ainhoa Calviño Rodriguez on 08/09/15.
//  Copyright (c) 2015 Ainhoa Calviño Rodriguez. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol MyProtocol <NSObject>

@property (strong, nonatomic) NSString *myProtocolProperty;

- (void) myProtocolFirstMethod;

@optional //para hacer que el metodo sea opcional declararlo o no cuando implementemos el protocolo,
// todo lo que se ponga debajo del opcional es opcional
- (void) myProtocolSecondMethod;

@end

@interface ViewController : UIViewController //<MyProtocol>

@property (assign, nonatomic) BOOL doThingsExecuted;

@property (weak, nonatomic) IBOutlet UIButton *button;

@property (strong, nonatomic) NSString *myKVOString;

- (void)doThings;

@end

