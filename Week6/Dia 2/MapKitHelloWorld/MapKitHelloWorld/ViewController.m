//
//  ViewController.m
//  MapKitHelloWorld
//
//  Created by Ainhoa Calviño Rodriguez on 13/10/15.
//  Copyright © 2015 Ainhoa Calviño Rodriguez. All rights reserved.
//

#import "ViewController.h"
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>
#import "MapPin.h"

@interface ViewController () <MKMapViewDelegate>
@property (weak, nonatomic) IBOutlet MKMapView *map;
@property (weak, nonatomic) IBOutlet UILabel *labelCoordinate;

@property (nonatomic, strong) CLLocationManager *locationManager;
@property (nonatomic, assign) CLLocationCoordinate2D lastPosition;


#define CENTER_LATITUDE 42.457835
#define CENTER_LONGITUDE -8.884871

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self configureLocationManager];
    NSString *coordinates = [NSString stringWithFormat:@"latitude: %.02f  longitude:  %.02f", self.map.centerCoordinate.latitude, self.map.centerCoordinate.longitude];
    self.labelCoordinate.text = coordinates;
    
    self.map.delegate = self;
    
    [self addPin];
}

- (void)configureLocationManager {
    self.locationManager = [[CLLocationManager alloc]init];
    [self.locationManager requestWhenInUseAuthorization];
}

#pragma mark - IBActions

- (IBAction)centerMap:(id)sender {
    CLLocationCoordinate2D center = CLLocationCoordinate2DMake(CENTER_LATITUDE, CENTER_LONGITUDE);
    [self setPositionOnMap:center];
}

- (IBAction)changeViewSatellite:(id)sender {
    self.map.mapType = MKMapTypeSatellite;
}

- (IBAction)changeViewHybrid:(id)sender {
    self.map.mapType = MKMapTypeHybrid;
}

- (IBAction)changeViewStandard:(id)sender {
    self.map.mapType = MKMapTypeStandard;
}

- (IBAction)backPosition:(id)sender {
    
    CLLocationCoordinate2D center = self.lastPosition;
    
    [self setPositionOnMap:center];
}

- (void)setPositionOnMap:(CLLocationCoordinate2D)center {
    MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(center, 1000, 1000);
    
    MKCoordinateRegion ajustedRegion = [self.map regionThatFits:region];
    [self.map setRegion:ajustedRegion animated:YES];
}

#pragma mark - Map Delegate

- (void)mapViewWillStartLoadingMap:(MKMapView *)mapView {
    NSLog(@"starting");
}

- (void)mapViewDidFinishLoadingMap:(MKMapView *)mapView {
    NSLog(@"finishing");
}

- (void)mapView:(MKMapView *)mapView didUpdateUserLocation:(MKUserLocation *)userLocation {
    self.lastPosition = userLocation.location.coordinate;
    
    NSString *coordinates = [NSString stringWithFormat:@"latitude: %.02f  longitude:  %.02f", userLocation.location.coordinate.latitude, userLocation.location.coordinate.longitude];
    self.labelCoordinate.text = coordinates;
}

#pragma mark Pin

- (void)addPin {
    MapPin *pin = [[MapPin alloc]init];
    CLLocationCoordinate2D center = CLLocationCoordinate2DMake(CENTER_LATITUDE, CENTER_LONGITUDE);
    pin.coordinate = center;
    
    [self.map addAnnotation:pin];
}

@end
