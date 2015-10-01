//
//  DownxLoadImageOperation.m
//  EjercicioConcurrencia
//
//  Created by Ainhoa Calviño Rodriguez on 01/10/15.
//  Copyright © 2015 Ainhoa Calviño Rodriguez. All rights reserved.
//

#import "DownLoadImageOperation.h"

@interface DownLoadImageOperation ()

@property (nonatomic, strong) NSURL *url;
@property (nonatomic, copy) DownLoadImageOperationBlock block;

@end

@implementation DownLoadImageOperation

- (instancetype)initWithURL:(NSURL *)url completion:(DownLoadImageOperationBlock)block
{
    self = [super init];
    
    if (self) {
        _url = url;
        _block = [block copy];
    }
    
    return self;
}

- (void)main
{
    if (self.cancelled) {
        return;
    }
    
    NSData *imageData = [NSData dataWithContentsOfURL:self.url];
    dispatch_sync(dispatch_get_main_queue(), ^{
        self.block([UIImage imageWithData:imageData]);
    });
    
}

@end
