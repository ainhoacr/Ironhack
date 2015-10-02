//
//  ViewController.m
//  DeadLocks
//
//  Created by Ainhoa Calviño Rodriguez on 02/10/15.
//  Copyright © 2015 Ainhoa Calviño Rodriguez. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    dispatch_queue_t myDispatchQueue = dispatch_queue_create("queueSerial", DISPATCH_QUEUE_SERIAL);
//    dispatch_async(myDispatchQueue, ^{
//        NSLog(@"async");
//        dispatch_sync(myDispatchQueue, ^{
//            NSLog(@"sync");
//        });
//    });

    dispatch_sync(dispatch_get_main_queue(), ^{
        NSLog(@"main");
    });

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
