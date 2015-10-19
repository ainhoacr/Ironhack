//
//  JSONParser.m
//  RadarProject
//
//  Created by Ainhoa Calviño Rodriguez on 07/10/15.
//  Copyright © 2015 Ainhoa Calviño Rodriguez. All rights reserved.
//

#import "JSONParser.h"

@implementation JSONParser

+ (NSArray<RadarJSON *> *)parseJSONString:(NSString *)jsonAsString
{
    NSData *data = [jsonAsString dataUsingEncoding:NSUTF8StringEncoding];
    NSError *error;
    NSDictionary *jsonData = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&error];
    
    if (error) {
        return nil;
    }
    
    NSMutableArray<RadarJSON *> *radars = [[NSMutableArray alloc]initWithCapacity:100];
    NSArray *jsonRadars = jsonData[@"result"];

    for (NSDictionary *dict in jsonRadars) {
        
        RadarJSON *radar = [self parseRadarJSON:dict];
        
        [radars addObject:radar];
    }
    
    return radars;
}

+ (RadarJSON *)parseRadarJSON:(NSDictionary *)dict
{
    RadarJSON *radar = [[RadarJSON alloc]init];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc]init];
    
    radar.classification = dict[@"classification"];
    
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss.SSSSSSSSSSS"];
    radar.create = [dateFormatter dateFromString:dict[@"created"]];
    
    radar.descriptionRadar = dict[@"description"];
    radar.idRadar = [dict[@"id"] integerValue];
    
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss.SSSSSSSSSSS"];
    radar.modified = [dateFormatter dateFromString:dict[@"modified"]];
    
    radar.number = [dict[@"number"] integerValue];
    
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm a"];
    radar.originated  = [dateFormatter dateFromString:dict[@"originated"]];
    
    radar.parent = dict[@"parent"];
    radar.product = dict[@"product"];
    radar.productVersion = dict[@"product_version"];
    radar.reproducible = dict[@"reproducible"];
    radar.resolved = dict[@"resolved"];
    radar.status = dict[@"status"];
    radar.title = dict[@"title"];
    radar.user = dict[@"user"];
    
    return radar;
}

@end
