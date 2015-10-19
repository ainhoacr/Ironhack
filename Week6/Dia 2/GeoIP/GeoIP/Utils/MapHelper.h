//
//  MapHelper.h
//  GeoIP
//
//  Created by Ainhoa Calviño Rodriguez on 14/10/15.
//  Copyright © 2015 Ainhoa Calviño Rodriguez. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

@interface MapHelper : NSObject

+ (void)centerMap:(MKMapView *)map onLatitude:(float)latitude onLongitude:(float)longitude;
+ (void)addPin:(MKMapView *)map onLatitude:(float)latitude onLongitude:(float)longitude andTitle:(NSString *)title;
+ (void)clearAllAnnotationsInMap:(MKMapView *)map;

@end
