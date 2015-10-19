//
//  RadarApiWapper.h
//  RadarProject
//
//  Created by Ainhoa Calviño Rodriguez on 07/10/15.
//  Copyright © 2015 Ainhoa Calviño Rodriguez. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RadarAPIWebServiceProtocol.h"

@interface RadarApiWapper : NSObject <RadarAPIWebServiceProtocol>

/**
 radarsWithBaseURL:completion:onError:
 
 Awesome method that fetches some radars from the internet, such awesome.
 */
- (void)radarsWithBaseURL:(NSString * _Nonnull)baseURL completion:(void (^ _Nullable)(NSString * _Nullable))completion onError:(void (^ _Nullable)(NSError * _Nullable))onErrorBlock;

@end
