//
//  RadarJSON.h
//  RadarProject
//
//  Created by Ainhoa Calviño Rodriguez on 08/10/15.
//  Copyright © 2015 Ainhoa Calviño Rodriguez. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RadarJSON : NSObject

@property (nonatomic, strong) NSString *classification;
@property (nonatomic, strong) NSDate *create;
@property (nonatomic, strong) NSString *descriptionRadar;
@property (nonatomic, assign) NSUInteger idRadar;
@property (nonatomic, strong) NSDate *modified;
@property (nonatomic, assign) NSUInteger number;
@property (nonatomic, strong) NSDate *originated;
@property (nonatomic, strong) NSString *parent;
@property (nonatomic, strong) NSString *product;
@property (nonatomic, strong) NSString *productVersion;
@property (nonatomic, strong) NSString *reproducible;
@property (nonatomic, strong) NSString *resolved;
@property (nonatomic, strong) NSString *status;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *user;

@end
