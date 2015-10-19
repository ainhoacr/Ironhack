//
//  MapHelper.m
//  GeoIP
//
//  Created by Ainhoa Calviño Rodriguez on 14/10/15.
//  Copyright © 2015 Ainhoa Calviño Rodriguez. All rights reserved.
//

#import "MapHelper.h"
#import "MapPin.h"

@implementation MapHelper

+ (void)centerMap:(MKMapView *)map onLatitude:(float)latitude onLongitude:(float)longitude {
    
    CLLocationCoordinate2D center = CLLocationCoordinate2DMake(latitude, longitude);
    
    MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(center, 1000, 1000);
    
    MKCoordinateRegion ajustedRegion = [map regionThatFits:region];
    [map setRegion:ajustedRegion animated:YES];
}

+ (void)addPin:(MKMapView *)map onLatitude:(float)latitude onLongitude:(float)longitude andTitle:(NSString *)title {
    MapPin *pin = [[MapPin alloc]initWithCoordinate:CLLocationCoordinate2DMake(latitude, longitude)];
    pin.title = title;
    
    [map addAnnotation:pin];
}

+ (void)clearAllAnnotationsInMap:(MKMapView *)map {
    [map removeAnnotations:[map annotations]];
}

@end
