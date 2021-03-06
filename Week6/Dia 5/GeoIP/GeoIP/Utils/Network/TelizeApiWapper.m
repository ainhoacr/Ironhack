//
//  TelizeApiWapper.m
//  GeoIP
//
//  Created by Ainhoa Calviño Rodriguez on 13/10/15.
//  Copyright © 2015 Ainhoa Calviño Rodriguez. All rights reserved.
//

#import "TelizeApiWapper.h"

@implementation TelizeApiWapper

- (void)telizeWithBaseURL:(NSString * _Nonnull)baseURL onSuccess:(void (^ _Nullable)(NSString * _Nullable))onSuccessBlock onError:(void (^ _Nullable)(NSError * _Nullable))onErrorBlock {
    if (!baseURL)
    {
        onErrorBlock == nil ? : onErrorBlock(nil);
        return;
    }
    
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    configuration.HTTPAdditionalHeaders = @{
                                            @"accept": @"application/json",
                                            @"content-type": @"text/json"
                                            };
    NSURLSession *session = [NSURLSession sessionWithConfiguration:configuration];
    NSURL *url = [NSURL URLWithString:baseURL];
    NSURLSessionDataTask *task = [session dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        NSAssert([NSThread currentThread] != [NSThread mainThread], @"PELIGRO PELIGRO!");
        
        if (!error) {
            dispatch_async(dispatch_get_main_queue(), ^{
                onSuccessBlock == nil ? : onSuccessBlock([[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding]);
            });
        }
        else
        {
            dispatch_async(dispatch_get_main_queue(), ^{
                onErrorBlock == nil ? : onErrorBlock(error);
            });
        }
    }];
    
    [task resume];
}

@end
