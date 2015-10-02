//
//  ArtistService.h
//  Artists
//
//  Created by Ainhoa Calviño Rodriguez on 02/10/15.
//  Copyright © 2015 Ainhoa Calviño Rodriguez. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ArtistService : NSObject

- (void)artistsWithCompletion:(void (^)(NSArray *))completion;

@end
