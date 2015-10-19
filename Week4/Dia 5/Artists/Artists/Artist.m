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


#pragma mark Initializers
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

- (instancetype)initWithName:(NSString *)name WithDescription:(NSString *)description WithStage:(NSString *)stage WithImageURL:(NSURL *)imageURL WithStartDate:(NSDate *)startDate WithArtistId:(NSUInteger)artistId
{
    self = [super init];
    if  (self)
    {
        _artistId = artistId;
        _name = name;
        _longDescription = description;
        _stage = stage;
        _imageURL = imageURL;
        _startDate = startDate;
    }
        
    return self;
}

#pragma mark - NSCopying
- (id)copyWithZone:(NSZone *)zone
{
    Artist *artist = [[Artist alloc]init];
    
    artist.artistId = self.artistId;
    artist.name = [self.name copyWithZone:zone];
    artist.longDescription = [self.longDescription copyWithZone:zone];
    artist.stage = [self.stage copyWithZone:zone];
    artist.imageURL = [self.imageURL copyWithZone:zone];
    artist.startDate = [self.startDate copyWithZone:zone];
    
    return artist;
}

#pragma mark - NSCoding
- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];
    
    if (self) {
        self.artistId = [aDecoder decodeIntegerForKey:@"id"];
        self.name = [aDecoder decodeObjectForKey:@"name"];
        self.longDescription = [aDecoder decodeObjectForKey:@"description"];
        self.stage = [aDecoder decodeObjectForKey:@"stage"];
        self.imageURL = [aDecoder decodeObjectForKey:@"image_url"];
        self.startDate = [aDecoder decodeObjectForKey:@"start_date"];
    }
    
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{
    [aCoder encodeInteger:self.artistId forKey:@"id"];
    [aCoder encodeObject:self.name forKey:@"name"];
    [aCoder encodeObject:self.longDescription forKey:@"description"];
    [aCoder encodeObject:self.stage forKey:@"stage"];
    [aCoder encodeObject:self.imageURL forKey:@"image_url"];
    [aCoder encodeObject:self.startDate forKey:@"start_date"];
}

#pragma mark - Equality

- (NSUInteger)hash
{
    return _artistId;
}

@end
