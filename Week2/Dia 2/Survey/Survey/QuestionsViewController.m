//
//  ViewController.m
//  Survey
//
//  Created by Ainhoa Calviño Rodriguez on 15/09/15.
//  Copyright (c) 2015 Ainhoa Calviño Rodriguez. All rights reserved.
//

#import "QuestionsViewController.h"
#import "SurveyDataSource.h"
#import "NotificationKeys.h"

static NSUInteger const padding = 16;
static NSUInteger const height = 40;

@interface QuestionsViewController ()

@property (nonatomic, strong) UISwitch *questionSwitch1;
@property (nonatomic, strong) UISwitch *questionSwitch2;
@property (nonatomic, strong) UISwitch *questionSwitch3;

@property (nonatomic, strong) UILabel *questionLabel1;
@property (nonatomic, strong) UILabel *questionLabel2;
@property (nonatomic, strong) UILabel *questionLabel3;

@property (nonatomic, strong) UIButton *nextButton;

@property (nonatomic, strong) SurveyDataSource *surveyDataSource;

@end

@implementation QuestionsViewController

#pragma mark - Initializers

- (instancetype)initWithDataSource:(SurveyDataSource *)surveyDataSource
{
    self = [super init];
    
    if (self) {
        _surveyDataSource = surveyDataSource;
    }
    return self;
}

#pragma mark - Initializer lasy

- (UILabel *)questionLabel1
{
    if (!_questionLabel1)
    {
        _questionLabel1 = [[UILabel alloc]init];
    }
    
    return _questionLabel1;
}

- (UILabel *)questionLabel2
{
    if (!_questionLabel2)
    {
        _questionLabel2 = [[UILabel alloc]init];
    }
    
    return _questionLabel2;
}

- (UILabel *)questionLabel3
{
    if (!_questionLabel3)
    {
        _questionLabel3 = [[UILabel alloc]init];
    }
    
    return _questionLabel3;
}

- (UISwitch *)questionSwitch1
{
    if (!_questionSwitch1) {
        _questionSwitch1 = [[UISwitch alloc]init];
    }
    
    return _questionSwitch1;
}

- (UISwitch *)questionSwitch2
{
    if (!_questionSwitch2) {
        _questionSwitch2 = [[UISwitch alloc]init];
    }
    
    return _questionSwitch2;
}

- (UISwitch *)questionSwitch3
{
    if (!_questionSwitch3) {
        _questionSwitch3 = [[UISwitch alloc]init];
    }
    
    return _questionSwitch3;
}

#pragma mark - Methods View Controller

- (void)viewDidLoad {
    [super viewDidLoad];
    [self drawQuestions];
    [self drawNextButtonIfNeeded];
    [self drawReloadButton];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self fetchQuestionData];
}

#pragma mark - Methods DataSource
- (void)fetchQuestionData
{
    NSUInteger questionNumber = [self.navigationController.viewControllers indexOfObject:self];
    
    NSDictionary *questions =  [self.surveyDataSource fetchSurvey];
    NSArray *questionArray = questions[@"preguntas"];
    NSDictionary *currentQuestion = [questionArray objectAtIndex:questionNumber];
    [self drawQuestionsWithDictionary:currentQuestion];
}

- (void)drawQuestionsWithDictionary:(NSDictionary *)questionDictionary
{
    self.navigationItem.title = questionDictionary[@"pregunta"];
    NSArray *answers = questionDictionary[@"respuestas"];
    self.questionLabel1.text = answers[0];
    self.questionLabel2.text = answers[1];
    self.questionLabel3.text = answers[2];
}

#pragma mark - Methods draw datasource in view
- (void)drawQuestions
{
    [self question:self.questionLabel1 withSwitch:self.questionSwitch1 withFrame:[self frame:200]];
    [self question:self.questionLabel2 withSwitch:self.questionSwitch2 withFrame:[self frame:300]];
    [self question:self.questionLabel3 withSwitch:self.questionSwitch3 withFrame:[self frame:400]];
    
    [self addSwitchesTargetActions];
}

- (void)addSwitchesTargetActions
{
    [self.questionSwitch1 addTarget:self action:@selector(didMarkAnswer:) forControlEvents:UIControlEventValueChanged];
    [self.questionSwitch2 addTarget:self action:@selector(didMarkAnswer:) forControlEvents:UIControlEventValueChanged];
    [self.questionSwitch3 addTarget:self action:@selector(didMarkAnswer:) forControlEvents:UIControlEventValueChanged];
}

- (void)didMarkAnswer:(UISwitch *)questionSwitch
{
    NSUInteger questionNumber = 0;
    
    if (questionSwitch == self.questionSwitch2)
    {
        questionNumber = 1;
    }
    else
    {
        if (questionSwitch == self.questionSwitch3)
        {
            questionNumber = 2;
        }
    }
    
    [[NSNotificationCenter defaultCenter] postNotificationName:didAnswerNotification object:self userInfo:@{questionKey:@(questionNumber)}];
}

- (CGRect)frame:(NSUInteger)margin
{
    return CGRectMake(padding, margin, self.view.frame.size.width - 2 * padding, height);
}

- (void)question:(UILabel *)questionLabel withSwitch:(UISwitch *)questionSwitch withFrame:(CGRect)frame
{
    UIView *questionView = [[UIView alloc] initWithFrame:frame];
    questionSwitch.frame = CGRectZero;
    [questionView addSubview:questionSwitch];
    
    CGFloat widthSwitch = questionSwitch.frame.size.width;
    CGFloat labelX = questionSwitch.frame.origin.x + widthSwitch + padding;
    CGFloat widthX = questionView.frame.size.width - widthSwitch - padding;
    questionLabel.frame = CGRectMake(labelX, 0, widthX, questionSwitch.frame.size.height);
    questionLabel.text = @"Pregunta";
    questionLabel.textColor = [UIColor whiteColor];
    
    [questionView addSubview:questionLabel];
    
    [self.view addSubview:questionView];
}

#pragma mark - Methods draw button next question

- (void)drawNextButtonIfNeeded
{
    
    
    if ([self canShowNextController])
    {
        self.nextButton = [UIButton buttonWithType:UIButtonTypeSystem];
        [self.nextButton setTitle:@"Next" forState:UIControlStateNormal];
        self.nextButton.frame = [self frame:500];
        self.nextButton.backgroundColor = [UIColor whiteColor];
        [self.view addSubview:self.nextButton];
        
        [self.nextButton addTarget:self action:@selector(nextQuestion) forControlEvents:UIControlEventTouchUpInside];
    }
}

- (BOOL)canShowNextController
{
    NSUInteger questionNumber = [self.navigationController.viewControllers indexOfObject:self];
    NSUInteger numberOfQuestions = [[self.surveyDataSource fetchSurvey][@"preguntas"] count];
    
    return questionNumber + 1 < numberOfQuestions;
}

- (void)nextQuestion
{
    QuestionsViewController *quetionViewController = [[QuestionsViewController alloc]initWithDataSource:self.surveyDataSource];
    [self.navigationController pushViewController:quetionViewController animated:YES];
}

#pragma mark - Methods tab bar

- (void)drawReloadButton
{
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemRefresh target:self action:@selector(returnFirstQuestion)];
}

- (void)returnFirstQuestion
{
    [self.navigationController popToRootViewControllerAnimated:YES];
}

@end
