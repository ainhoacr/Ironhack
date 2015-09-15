//
//  ResultsViewController.m
//  Survey
//
//  Created by Ainhoa Calviño Rodriguez on 15/09/15.
//  Copyright (c) 2015 Ainhoa Calviño Rodriguez. All rights reserved.
//

#import "ResultsViewController.h"
#import "NotificationKeys.h"

@interface ResultsViewController ()

@property (nonatomic, strong) UILabel *answerOfFirstAnswer;
@property (nonatomic, strong) UILabel *answerOfSecondAnswer;
@property (nonatomic, strong) UILabel *answerOfThirdAnswer;

@property (nonatomic, assign) NSUInteger answersOfFirst;
@property (nonatomic, assign) NSUInteger answersOfSecond;
@property (nonatomic, assign) NSUInteger answersOfThird;

@end

@implementation ResultsViewController

- (instancetype)init
{
    self = [super init];
    if (self)
    {
        [self initializerAnswer];
        [self observeNotifications];
    }
    
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self buildLabels];
}

- (void)observeNotifications
{
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(didRecieveNotification:) name:didAnswerNotification object:nil];
}

- (void)didRecieveNotification:(NSNotification *)notification
{
    NSUInteger questionNumber = [notification.userInfo[questionKey] integerValue];

    switch (questionNumber) {
        case 0:
            self.answersOfFirst++;
            break;
            
        case 1:
            self.answersOfSecond++;
            break;
        
        case 2:
            self.answersOfThird++;
            break;
            
        default:
            break;
    }
    
    [self drawNumberOfAnswers];
}

- (void)initializerAnswer
{
    self.answersOfFirst = 0;
    self.answersOfSecond = 0;
    self.answersOfThird = 0;
}

- (void)buildLabels
{
    self.answerOfFirstAnswer = [[UILabel alloc]initWithFrame:[self frame:100]];
    [self.view addSubview:self.answerOfFirstAnswer];
    
    self.answerOfSecondAnswer = [[UILabel alloc]initWithFrame:[self frame:200]];
    [self.view addSubview:self.answerOfSecondAnswer];
    
    self.answerOfThirdAnswer = [[UILabel alloc]initWithFrame:[self frame:300]];
    [self.view addSubview:self.answerOfThirdAnswer];
    
    [self drawNumberOfAnswers];
}

- (CGRect)frame:(NSUInteger)margin
{
    return CGRectMake(16, margin, 200, 40);
}

- (void)drawNumberOfAnswers
{
    self.answerOfFirstAnswer.text = [NSString stringWithFormat:@"%lu contestadas", self.answersOfFirst];
    self.answerOfSecondAnswer.text = [NSString stringWithFormat:@"%lu contestadas", self.answersOfSecond];
    self.answerOfThirdAnswer.text = [NSString stringWithFormat:@"%lu contestadas", self.answersOfThird];
}
@end
