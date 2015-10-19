//
//  StubFileUtil.m
//  RadarProject
//
//  Created by Ainhoa Calviño Rodriguez on 07/10/15.
//  Copyright © 2015 Ainhoa Calviño Rodriguez. All rights reserved.
//

#import "StubFileUtil.h"

@implementation StubFileUtil

+ (NSString *)loadStubFileNamed:(NSString *)stubFileName
{
    NSBundle *bundle = [NSBundle bundleForClass:self];
    NSString *filePath = [bundle pathForResource:stubFileName ofType:@"json"];
    NSString *stub = [[NSString alloc] initWithData:[NSData dataWithContentsOfFile:filePath] encoding:NSUTF8StringEncoding];
    
    return stub;
}

@end
