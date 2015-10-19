//
//  ArtistService.m
//  Artists
//
//  Created by Ainhoa Calviño Rodriguez on 02/10/15.
//  Copyright © 2015 Ainhoa Calviño Rodriguez. All rights reserved.
//

#import "ArtistService.h"
#import "Artist.h"

@interface ArtistService ()

@end

@implementation ArtistService

- (void)artistsWithCompletion:(void (^)(NSArray *))completion
{
    NSURLSession *sesion = [NSURLSession sharedSession];
    
    NSURL *url = [NSURL URLWithString:@"https://ironhackartists.firebaseio.com/artists.json"];
    NSURLSessionDataTask *sessionDataTask = [sesion dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        NSError *errorJSON = nil;
        NSArray *arrayJSON = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&errorJSON];
        
        NSArray *arrayArtist = [self arrayCached];
        if (!arrayArtist)
        {
            arrayArtist = [self parserJSON:arrayJSON];
            NSString *folder = [self getPathArtist];
            [NSKeyedArchiver archiveRootObject:arrayArtist toFile:folder];
        }
        
        if (completion)
        {
            dispatch_async(dispatch_get_main_queue(), ^{
                completion(arrayArtist);
            });
            
        }
        
    }];
    [sessionDataTask resume];
}

- (NSArray *)parserJSON:(NSArray *)arrayJSON
{
    NSMutableArray *arrayArtist = [[NSMutableArray alloc]init];
    
    for (NSDictionary *item in arrayJSON) {
        
        NSString *name = item[@"name"];
        NSString *longDescription = item[@"description"];
        NSString *stage = item[@"stage"];
        NSURL *imageURL = [NSURL URLWithString:item[@"image_url"]];
        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc]init];
        dateFormatter.dateFormat = @"yyyy-MM-dd'T'HH:mm:ss";
        NSDate *startDate = [dateFormatter dateFromString:item[@"start_date"]];
        
        Artist *artist = [Artist artistWithName:name WithDescription:longDescription WithStage:stage WithImageURL:imageURL WithStartDate:startDate];
        
        [arrayArtist addObject:artist];
        
    }
    
    return [arrayArtist copy];
}

- (NSArray *)arrayCached
{
    NSString *pathArtist = [self getPathArtist];
    NSArray *array = [[NSArray alloc]init];
    array = [NSKeyedUnarchiver unarchiveObjectWithFile:pathArtist];
    
    if (!pathArtist || !array)
    {
        return nil;
    }
    
    return array;
}

- (NSString *)getPathArtist
{
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES);
    NSString *cacheFolder = [paths firstObject];
    if ([fileManager fileExistsAtPath:cacheFolder])
    {
        return [cacheFolder stringByAppendingPathComponent:@"artist.plist"];
    }
    else
    {
        return nil;
    }
    
}

@end
