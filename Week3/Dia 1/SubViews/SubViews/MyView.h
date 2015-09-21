//
//  MyView.h
//  SubViews
//
//  Created by Ainhoa Calviño Rodriguez on 21/09/15.
//  Copyright © 2015 Ainhoa Calviño Rodriguez. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MyView : UIView
@property (nonatomic, strong) UILabel *label;

- (instancetype)initWithFrame:(CGRect)frame withTitle:(NSString *)title NS_DESIGNATED_INITIALIZER;
@end
