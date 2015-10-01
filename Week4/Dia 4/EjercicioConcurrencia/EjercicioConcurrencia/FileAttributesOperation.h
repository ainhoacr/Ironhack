//
//  FileAttributesOperation.h
//  EjercicioConcurrencia
//
//  Created by Ainhoa Calviño Rodriguez on 01/10/15.
//  Copyright © 2015 Ainhoa Calviño Rodriguez. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^FileAttibutesOperationBlock)(NSDictionary *);

@interface FileAttributesOperation : NSOperation

- (instancetype)initWithPath:(NSString *)path completion:(FileAttibutesOperationBlock)block;

@end
