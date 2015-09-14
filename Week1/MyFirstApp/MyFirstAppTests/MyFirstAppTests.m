//
//  MyFirstAppTests.m
//  MyFirstAppTests
//
//  Created by Ainhoa Calviño Rodriguez on 08/09/15.
//  Copyright (c) 2015 Ainhoa Calviño Rodriguez. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "ViewController.h"

@interface MyFirstAppTests : XCTestCase

@property (strong, nonatomic) ViewController *viewController;

@end

@implementation MyFirstAppTests

// todo lo que sea comun a todos los test, crear objetos comunes por ejemplo
- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
    
    self.viewController = [[ViewController alloc] init];
}


//todo lo que sea comun a todos los test lo deshacemos aqui y lo ultimo que se hace es el super tearDown
- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    
    self.viewController = nil;
    [super tearDown];
}

- (void)testDoThings {
    // This is an example of a functional test case.
    [self.viewController viewDidLoad];
    
    XCTAssert(self.viewController.doThingsExecuted == YES, @"El método doThings tiene que ser llamado en el viewDidLoad");
}

@end
