//
//  FileAttributesOperation.m
//  EjercicioConcurrencia
//
//  Created by Ainhoa Calviño Rodriguez on 01/10/15.
//  Copyright © 2015 Ainhoa Calviño Rodriguez. All rights reserved.
//

#import "FileAttributesOperation.h"

@interface FileAttributesOperation ()

@property (nonatomic, copy) NSString *path;
@property (nonatomic, copy) FileAttibutesOperationBlock block;

@end

@implementation FileAttributesOperation

- (instancetype)initWithPath:(NSString *)path completion:(FileAttibutesOperationBlock)block
{
    self = [super init];
    
    if (self) {
        _path = [path copy];
        _block = [block copy];
    }
    
    return self;
}

- (void)main
{
    for (NSInteger i = 0; i < 5; i++) {
        if (self.cancelled)
        {
            return;
        }
        NSLog(@"Sleeping %@", @(i));
        sleep(1);
    }
    
    if (self.cancelled) {
        return;
    }
    
    NSError *error;
    NSDictionary *dictionayAttributes = [[NSFileManager defaultManager]attributesOfItemAtPath:self.path error:&error];
    
    dispatch_sync(dispatch_get_main_queue(), ^{
        self.block(dictionayAttributes);
    });
    
}

@end
