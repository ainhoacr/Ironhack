//
//  SurveyDataSource.m
//  Survey
//
//  Created by Ainhoa Calviño Rodriguez on 15/09/15.
//  Copyright (c) 2015 Ainhoa Calviño Rodriguez. All rights reserved.
//

#import "SurveyDataSource.h"

@implementation SurveyDataSource

- (NSDictionary *)fetchSurvey
{
    NSDictionary *survey = @{@"preguntas":@[
                                @{@"pregunta" : @"cual es tu comida favorita?",
                                  @"respuestas" : @[@"paella", @"tortilla", @"hamburguesa"]},
                                @{@"pregunta" : @"cual es tu cerveza favorita?",
                                  @"respuestas" : @[@"mahou", @"estrella de galicia", @"Voll Damm"]},
                                @{@"pregunta" : @"que postura usas para dormir?",
                                  @"respuestas" : @[@"boca arriba", @"boca abajo", @"de lado"]},
                                @{@"pregunta" : @"donde te gustaria ir de vacaciones?",
                                  @"respuestas" : @[@"Nueva York", @"Bora bora", @"Australia"]}
                                ]};
    
    return survey;
}

@end
