//
//  TelizeApiWapper.h
//  GeoIP
//
//  Created by Ainhoa Calviño Rodriguez on 13/10/15.
//  Copyright © 2015 Ainhoa Calviño Rodriguez. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TelizeAPIWebServiceProtocol.h"

@interface TelizeApiWapper : NSObject <TelizeAPIWebServiceProtocol>

- (void)telizeWithBaseURL:(NSString * _Nonnull)baseURL onSuccess:(void (^ _Nullable)(NSString * _Nullable))onSuccessBlock onError:(void (^ _Nullable)(NSError * _Nullable))onErrorBlock;

@end
