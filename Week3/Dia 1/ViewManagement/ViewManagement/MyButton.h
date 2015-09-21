//
//  MyButton.h
//  ViewManagement
//
//  Created by Ainhoa Calviño Rodriguez on 21/09/15.
//  Copyright © 2015 Ainhoa Calviño Rodriguez. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MyButton : UIView

@property (nonatomic, strong) NSString *titleButton;
@property (nonatomic, strong) UIColor *backgroundColor;

- (instancetype)initWithFrame:(CGRect)frame withTitle:(NSString *)title withBackgroundColor:(UIColor *)background NS_DESIGNATED_INITIALIZER;

@end
