//
//  MyScrollView.m
//  LayersExercice
//
//  Created by Ainhoa Calviño Rodriguez on 23/09/15.
//  Copyright © 2015 Ainhoa Calviño Rodriguez. All rights reserved.
//

#import "MyScrollView.h"

@implementation MyScrollView

+ (Class)layerClass
{
    return [CAScrollLayer class];
}

-(instancetype)initWithFrame:(CGRect)frame WithImage1:(NSString *)nameImage1 WithImage2:(NSString *)nameImage2
{
    self = [super initWithFrame:frame];
    
    if (self) {
        
        CGFloat x = frame.size.width / 4.0;
        CGFloat y = frame.size.height / 2.0;
        CALayer *layerImage1 = [self createLayerWithImage:nameImage1 withX:x withY:y];
        
        x = frame.size.width * 3 / 4;
        CALayer *layerImage2 =  [self createLayerWithImage:nameImage2 withX:x withY:y];
        
        [self.layer insertSublayer:layerImage1 atIndex:0];
        [self.layer insertSublayer:layerImage2 atIndex:1];
        
        CAScrollLayer *layerScroll = (CAScrollLayer *) self.layer;
        layerScroll.scrollMode = kCAScrollHorizontally;
        layerScroll.backgroundColor = [UIColor purpleColor].CGColor;
    }
    
    return self;
}


- (CALayer *)createLayerWithImage:(NSString *)nameImage withX:(CGFloat)x withY:(CGFloat)y
{
    CALayer *layerImage = [[CALayer alloc]init];
    layerImage.contents = (id) [UIImage imageNamed:nameImage].CGImage;
    layerImage.bounds = CGRectMake(0, 0, 200, 400);
    layerImage.position = CGPointMake(x, y);
    layerImage.anchorPoint = CGPointMake(0.5, 0.5);
    
    return layerImage;
}
@end
