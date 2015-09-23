//
//  MyScrollView.m
//  Layers
//
//  Created by Ainhoa Calviño Rodriguez on 23/09/15.
//  Copyright © 2015 Ainhoa Calviño Rodriguez. All rights reserved.
//

#import "MyScrollView.h"

@interface MyScrollView ()

@end

@implementation MyScrollView

+ (Class)layerClass
{
    return [CAScrollLayer class];
}

-(instancetype)initWithFrame:(CGRect)frame WithImage:(NSString *)nameImage
{
    self = [super initWithFrame:frame];
    
    if (self) {
        UIImageView *myImageView = [[UIImageView alloc]init];
        myImageView.image = [UIImage imageNamed:nameImage];
        myImageView.frame = CGRectMake(frame.origin.x, frame.origin.y, frame.size.width + 400, frame.size.height + 200);
        [self addSubview:myImageView];
        
        CAScrollLayer *layerScroll = (CAScrollLayer *) self.layer;
        layerScroll.scrollMode = kCAScrollBoth;
    }
    
    return self;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    if (touches.count == 1) {
        [UIView animateWithDuration:2.0 animations:^{
            UITouch *touch = [touches anyObject];
            CGPoint point = [touch locationInView:self];
            [self.layer scrollPoint:CGPointMake(point.x / 2.0, point.y / 2.0)];
        }];
    }
}
@end
