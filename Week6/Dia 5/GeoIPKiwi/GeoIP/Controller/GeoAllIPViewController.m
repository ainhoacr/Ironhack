
//
//  GeoAllIPViewController.m
//  GeoIP
//
//  Created by Ainhoa Calviño Rodriguez on 14/10/15.
//  Copyright © 2015 Ainhoa Calviño Rodriguez. All rights reserved.
//

#import "GeoAllIPViewController.h"
#import <MapKit/MapKit.h>
#import "MapHelper.h"
#import "GeoIP.h"

@interface GeoAllIPViewController () <MKMapViewDelegate>

@property (weak, nonatomic) IBOutlet MKMapView *map;

@end

@implementation GeoAllIPViewController

- (void)viewDidLoad {
    [super viewDidLoad];
 
    self.map.delegate = self;
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(putPinsOnMap) name:NSManagedObjectContextObjectsDidChangeNotification object:nil];
    
    [self putPinsOnMap];
}

- (void)getAllGeoIPs {
    NSFetchRequest *fechRequest = [GeoIP fetchRequestWithFields:@[@"country", @"ip", @"latitude", @"longitude"] andOrders:@[@YES, @YES, @NO, @NO]];
    
    NSError *error;
    NSArray *geoIPs = [self.managedObjectContext executeFetchRequest:fechRequest error:&error];
    
    for (GeoIP *geoIP in geoIPs) {
        
        [MapHelper addPin:self.map onLatitude:geoIP.latitudeValue onLongitude:geoIP.longitudeValue andTitle:geoIP.country];
    }
}


- (void) putPinsOnMap {
    [MapHelper clearAllAnnotationsInMap:self.map];
    
    [self getAllGeoIPs];
}
@end
