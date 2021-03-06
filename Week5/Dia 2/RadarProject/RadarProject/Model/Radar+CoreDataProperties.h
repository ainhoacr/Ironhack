//
//  Radar+CoreDataProperties.h
//  RadarProject
//
//  Created by Ainhoa Calviño Rodriguez on 07/10/15.
//  Copyright © 2015 Ainhoa Calviño Rodriguez. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "Radar.h"

NS_ASSUME_NONNULL_BEGIN

@interface Radar (CoreDataProperties)

@property (nullable, nonatomic, retain) NSString *title;
@property (nullable, nonatomic, retain) NSString *user;
@property (nullable, nonatomic, retain) NSString *product;
@property (nullable, nonatomic, retain) NSString *product_version;

@end

NS_ASSUME_NONNULL_END
