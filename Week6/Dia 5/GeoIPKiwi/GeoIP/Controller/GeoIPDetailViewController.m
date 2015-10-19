//
//  GeoIPDetailViewController.m
//  GeoIP
//
//  Created by Ainhoa Calviño Rodriguez on 13/10/15.
//  Copyright © 2015 Ainhoa Calviño Rodriguez. All rights reserved.
//

#import "GeoIPDetailViewController.h"
#import <MapKit/MapKit.h>
#import "MapPin.h"
#import "MapHelper.h"

@interface GeoIPDetailViewController () <MKMapViewDelegate>

@property (weak, nonatomic) IBOutlet MKMapView *map;

@end

@implementation GeoIPDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.map.delegate = self;
    self.navigationItem.title = @"View IP in Map";
}

- (void)viewWillAppear:(BOOL)animated
{
    [MapHelper clearAllAnnotationsInMap:self.map];
}

- (void)mapViewDidFinishLoadingMap:(MKMapView *)mapView {
    [self setUpMap];
}

- (void)setUpMap {
    float latitude = self.geoIP.latitudeValue;
    float longitude = self.geoIP.longitudeValue;
    
    [MapHelper centerMap:self.map onLatitude:latitude onLongitude:longitude];
    
    [MapHelper clearAllAnnotationsInMap:self.map];
    
    NSString *titlePin = [NSString stringWithFormat:@"Country %@ ip %@", self.geoIP.country, self.geoIP.ip];
    [MapHelper addPin:self.map onLatitude:latitude onLongitude:longitude andTitle:titlePin];
}

@end
