//
//  JSONParser.h
//  RadarProject
//
//  Created by Ainhoa Calviño Rodriguez on 07/10/15.
//  Copyright © 2015 Ainhoa Calviño Rodriguez. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RadarJSON.h"

@interface JSONParser : NSObject

+ (NSArray<RadarJSON *> *)parseJSONString:(NSString *)jsonAsString;

@end
