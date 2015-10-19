//
//  JSONParser.h
//  GeoIP
//
//  Created by Ainhoa Calviño Rodriguez on 13/10/15.
//  Copyright © 2015 Ainhoa Calviño Rodriguez. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GeoIPJSON.h"

@interface JSONParser : NSObject

+ (GeoIPJSON *)parseJSONString:(NSString *)jsonAsString;

@end
