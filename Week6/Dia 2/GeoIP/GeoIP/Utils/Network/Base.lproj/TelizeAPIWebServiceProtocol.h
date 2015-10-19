
//
//  TelizeAPIWebServiceProtocol.h
//  GeoIP
//
//  Created by Ainhoa Calviño Rodriguez on 13/10/15.
//  Copyright © 2015 Ainhoa Calviño Rodriguez. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol TelizeAPIWebServiceProtocol <NSObject>

@required

- (void)telizeWithBaseURL:(NSString * _Nonnull)baseURL onSuccess:(void (^ _Nullable)(NSString * _Nullable))onSuccessBlock onError:(void (^ _Nullable)(NSError * _Nullable))onErrorBlock;

@optional

@end
