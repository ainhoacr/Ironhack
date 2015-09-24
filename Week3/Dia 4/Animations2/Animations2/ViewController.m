//
//  ViewController.m
//  Animations2
//
//  Created by Ainhoa Calviño Rodriguez on 24/09/15.
//  Copyright © 2015 Ainhoa Calviño Rodriguez. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIView *myView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.myView.backgroundColor = [UIColor purpleColor];
    //self.myView.layer.cornerRadius = self.myView.bounds.size.width / 2;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)buttonPressed:(UIButton *)sender
{
//    [UIView animateWithDuration:2.0 animations:^{
//        self.myView.backgroundColor = [UIColor magentaColor];
//    } completion:^(BOOL finished) {
//        [UIView animateWithDuration:2.0 animations:^{
//            self.myView.bounds = CGRectMake(self.view.bounds.origin.x, self.view.bounds.origin.y, 200, 200);
//        }];
//    }];
    
    
//    [UIView animateWithDuration:2.0 delay:0.0 options:UIViewAnimationOptionRepeat | UIViewAnimationOptionAutoreverse | UIViewAnimationCurveEaseOut animations:^{
//        self.myView.backgroundColor = [UIColor magentaColor];
//        self.myView.bounds = CGRectMake(self.view.bounds.origin.x, self.view.bounds.origin.y, 200, 200);
//    } completion:^(BOOL finished) {
//        
//    }];
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
//    [UIView animateKeyframesWithDuration:1.0 delay:0.0 options:UIViewKeyframeAnimationOptionRepeat | UIViewKeyframeAnimationOptionAutoreverse | UIViewKeyframeAnimationOptionCalculationModeCubic animations:^{
//        
//        [UIView addKeyframeWithRelativeStartTime:0.0 relativeDuration:0.5 animations:^{
//            self.myView.frame = CGRectMake(self.myView.frame.origin.x, self.myView.frame.origin.y - 250, self.myView.bounds.size.width, self.myView.bounds.size.height);
//        }];
//        
//        [UIView addKeyframeWithRelativeStartTime:0.5 relativeDuration:1.0 animations:^{
//            self.myView.frame = CGRectMake(self.myView.frame.origin.x, self.myView.frame.origin.y - 250, self.myView.bounds.size.width, self.myView.bounds.size.height);
//        }];
//        
//        [UIView addKeyframeWithRelativeStartTime:1.0 relativeDuration:1.5 animations:^{
//            self.myView.frame = CGRectMake(self.myView.frame.origin.x, self.myView.frame.origin.y - 250, self.myView.bounds.size.width, self.myView.bounds.size.height);
//        }];
//        
//        [UIView addKeyframeWithRelativeStartTime:1.5 relativeDuration:2.0 animations:^{
//            self.myView.frame = CGRectMake(self.myView.frame.origin.x, self.myView.frame.origin.y - 250, self.myView.bounds.size.width, self.myView.bounds.size.height);
//        }];
//        
//    } completion:^(BOOL finished) {
//        
//    }];
    
//    [UIView animateWithDuration:2.0 delay:0.0 usingSpringWithDamping:0.6 initialSpringVelocity:0.6 options:0 animations:^{
//        
//        [UIView animateWithDuration:2.0 animations:^{
//            self.myView.frame = CGRectMake(self.myView.frame.origin.x, self.myView.frame.origin.y - 550, self.myView.bounds.size.width, self.myView.bounds.size.height);
//        }];
//        
//    } completion:^(BOOL finished) {
//        [UIView animateWithDuration:2.0 animations:^{
//            self.myView.frame = CGRectMake(self.myView.frame.origin.x, self.myView.frame.origin.y + 550, self.myView.bounds.size.width, self.myView.bounds.size.height);
//        }];
//    }];

    CABasicAnimation *basicAnimation = [CABasicAnimation animationWithKeyPath:@"position.y"];
    basicAnimation.toValue = @150;
    basicAnimation.beginTime = 1;
    basicAnimation.duration = 2;
    
    CABasicAnimation *basicAnimation1 = [CABasicAnimation animationWithKeyPath:@"cornerRadius"];
    basicAnimation1.toValue = @(self.myView.bounds.size.width / 2);
    
    CAAnimationGroup *animationGroup = [CAAnimationGroup animation];
    animationGroup.animations = @[basicAnimation, basicAnimation1];
    animationGroup.duration = 3;
    animationGroup.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
    animationGroup.fillMode = kCAFillModeForwards;
    animationGroup.removedOnCompletion = NO;
    
//    [self.myView.layer addAnimation:basicAnimation forKey:@"moved"];
//    [self.myView.layer addAnimation:basicAnimation1 forKey:@"circle"];
    [self.myView.layer addAnimation:animationGroup forKey:@"grupo"];
}
@end
