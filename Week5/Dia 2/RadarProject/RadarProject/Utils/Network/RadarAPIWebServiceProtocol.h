//
//  RadarAPIWebServiceProtocol.h
//  RadarProject
//
//  Created by Ainhoa Calviño Rodriguez on 07/10/15.
//  Copyright © 2015 Ainhoa Calviño Rodriguez. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol RadarAPIWebServiceProtocol <NSObject>
@required

- (void)radarsWithBaseURL:(NSString * _Nonnull)baseURL completion:(void (^ _Nullable)(NSString * _Nullable))completion onError:(void (^ _Nullable)(NSError * _Nullable))onErrorBlock;

@optional

@end
