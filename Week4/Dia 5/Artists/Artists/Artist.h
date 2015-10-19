//
//  Artist.h
//  Artists
//
//  Created by Ainhoa Calviño Rodriguez on 02/10/15.
//  Copyright © 2015 Ainhoa Calviño Rodriguez. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Artist : NSObject <NSCopying, NSCoding>

@property (nonatomic, assign) NSUInteger artistId;
@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *longDescription;
@property (nonatomic, copy) NSString *stage;
@property (nonatomic, strong) NSURL *imageURL;
@property (nonatomic, strong) NSDate *startDate;

+ (instancetype)randomArtist;
- (instancetype)initWithName:(NSString *)name WithDescription:(NSString *)description WithStage:(NSString *)stage WithImageURL:(NSURL *)imageURL WithStartDate:(NSDate *)startDate WithArtistId:(NSUInteger)artistId;

@end
