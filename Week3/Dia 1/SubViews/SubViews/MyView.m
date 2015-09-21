//
//  MyView.m
//  SubViews
//
//  Created by Ainhoa Calviño Rodriguez on 21/09/15.
//  Copyright © 2015 Ainhoa Calviño Rodriguez. All rights reserved.
//

#import "MyView.h"

@interface MyView ()

@property (nonatomic, strong) NSString *title;

@end

@implementation MyView

- (instancetype)initWithFrame:(CGRect)frame withTitle:(NSString *)title
{
    self = [super initWithFrame:frame];
    
    if (self) {
        _title = title;
        self.label = [[UILabel alloc]init];
        self.label.text = title;
        CGSize size = [self.label sizeThatFits:self.bounds.size];
        CGRect frame = CGRectMake(self.label.frame.origin.x, self.label.frame.origin.y, size.width, size.height);
        self.label.frame = frame;
        self.label.textColor = [UIColor whiteColor];
    }
    
    return self;
}

-(instancetype)initWithFrame:(CGRect)frame
{
    return [self initWithFrame:frame withTitle:nil];
}

- (instancetype)init
{
    return [self initWithFrame:CGRectZero withTitle:nil];
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    CGSize size = [self.label sizeThatFits:self.bounds.size];
    CGRect frame = CGRectMake(self.label.frame.origin.x, self.label.frame.origin.y, size.width, size.height);
    self.label.frame = frame;
    self.label.center = [self convertPoint:self.center fromView:self.superview];
}

@end
