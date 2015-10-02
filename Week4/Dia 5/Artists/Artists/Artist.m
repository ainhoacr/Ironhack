//
//  Artist.m
//  Artists
//
//  Created by Ainhoa Calviño Rodriguez on 02/10/15.
//  Copyright © 2015 Ainhoa Calviño Rodriguez. All rights reserved.
//

#import "Artist.h"
#import "NSString+Random.h"

@implementation Artist

+ (instancetype)randomArtist
{
    Artist *artist = [[Artist alloc]init];
    artist.name = [NSString randomNSStringGenerator];
    artist.longDescription = [NSString randomNSStringGenerator];
    artist.stage =  [NSString randomNSStringGenerator];
    artist.imageURL = [NSURL URLWithString:[NSString randomNSStringGenerator]];
    artist.startDate = [NSDate date];
    
    return artist;
}

+ (instancetype)artistWithName:(NSString *)name WithDescription:(NSString *)description WithStage:(NSString *)stage WithImageURL:(NSURL *)imageURL WithStartDate:(NSDate *)startDate
{
    Artist *artist = [[Artist alloc]init];
    artist.name = name;
    artist.longDescription = description;
    artist.stage = stage;
    artist.imageURL = imageURL;
    artist.startDate = startDate;
    
    return artist;
}

- (id)copyWithZone:(NSZone *)zone
{
    Artist *artist = [[Artist alloc]init];
    
    artist.name = [self.name copyWithZone:zone];
    artist.longDescription = [self.longDescription copyWithZone:zone];
    artist.stage = [self.stage copyWithZone:zone];
    artist.imageURL = [self.imageURL copyWithZone:zone];
    artist.startDate = [self.startDate copyWithZone:zone];
    
    return artist;
}

@end
