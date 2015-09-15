//
//  ViewController.h
//  Survey
//
//  Created by Ainhoa Calviño Rodriguez on 15/09/15.
//  Copyright (c) 2015 Ainhoa Calviño Rodriguez. All rights reserved.
//

#import <UIKit/UIKit.h>

@class SurveyDataSource;

@interface QuestionsViewController : UIViewController

- (instancetype)initWithDataSource:(SurveyDataSource *)surveyDataSource;

@end

