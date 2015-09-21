//
//  MyButton.m
//  ViewManagement
//
//  Created by Ainhoa Calviño Rodriguez on 21/09/15.
//  Copyright © 2015 Ainhoa Calviño Rodriguez. All rights reserved.
//

#import "MyButton.h"

@interface MyButton ()

@property (nonatomic, strong) UILabel *textButton;
@property (nonatomic, strong) UIView *viewButton;
@property (nonatomic, strong) UIView *shadowView;
@property (nonatomic, assign) CGRect frameShadow;

@end

@implementation MyButton

- (instancetype)initWithFrame:(CGRect)frame withTitle:(NSString *)title withBackgroundColor:(UIColor *)background
{
    self = [super initWithFrame:frame];
    
    if (self) {
        _textButton = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height)];
        _textButton.text = title;
        _titleButton = title;
        
        _viewButton = [[UIView alloc]initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height)];
        _viewButton.backgroundColor = background;
        self.backgroundColor = background;
        
        _shadowView = [[UIView alloc]init];
        _shadowView.backgroundColor = [UIColor colorWithWhite:0 alpha:0.4];
        CGFloat maxy = CGRectGetMaxY(_viewButton.bounds);
        _frameShadow = CGRectMake(0, maxy-5 , _viewButton.frame.size.width, 5);
        _shadowView.frame = _frameShadow;
    
        [self addSubview:self.viewButton];
        [self.viewButton addSubview:self.shadowView];
        [self.viewButton addSubview:self.textButton];
        
    }
    
    return self;
}

-(instancetype)initWithFrame:(CGRect)frame
{
    return [self initWithFrame:frame withTitle:nil withBackgroundColor:nil];
}

-(instancetype)init
{
    return [self initWithFrame:CGRectZero withTitle:nil withBackgroundColor:nil];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    NSLog(@"text %@", self.textButton.text);
    _shadowView.frame = _viewButton.frame;
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    _shadowView.frame = _frameShadow;
}

- (void)setTitleButton:(NSString *)titleButton
{
    self.textButton.text = titleButton;
}

- (void)setBackgroundColor:(UIColor *)backgroundColor
{
    [super setBackgroundColor:backgroundColor];
    self.viewButton.backgroundColor = backgroundColor;
}
@end
