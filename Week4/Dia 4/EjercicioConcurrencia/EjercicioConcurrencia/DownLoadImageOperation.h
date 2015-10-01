//
//  DownxLoadImageOperation.h
//  EjercicioConcurrencia
//
//  Created by Ainhoa Calviño Rodriguez on 01/10/15.
//  Copyright © 2015 Ainhoa Calviño Rodriguez. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef void(^DownLoadImageOperationBlock)(UIImage *);


@interface DownLoadImageOperation : NSOperation

- (instancetype)initWithURL:(NSURL *)url completion:(DownLoadImageOperationBlock)block;

@end
