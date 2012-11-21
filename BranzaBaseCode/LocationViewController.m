//
//  LocationViewController.m
//  BranzaBaseCode
//
//  Created by Kevin E. Rafferty II on 11/7/12.
//  Copyright (c) 2012 Branza. All rights reserved.
//

#import "LocationViewController.h"

@interface LocationViewController ()

@end

@implementation LocationViewController

@synthesize mapView = _mapView;

#pragma mark -
#pragma mark View Life Cycle

/*
 
 FUNCTION    - viewDidLoad
 
 PARAMETERS  - None
 
 DESCRIPTION - This Function will set up View once it has been loaded into memory
 
 TODO's      - Add the proper latitude and longitude values; Add the proper Drop Pin Title; Add the proper Drop Pin Subtitle
 
 */

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self.navigationController.navigationBar.topItem setTitle:@"Location"];
    
    self.mapView.delegate = self;
    
    locationManager = [[CLLocationManager alloc] init];
    [locationManager setDelegate:self];
    
    [locationManager setDistanceFilter:kCLDistanceFilterNone];
    [locationManager setDesiredAccuracy:kCLLocationAccuracyBest];
    
    [self.mapView setShowsUserLocation:YES];
        
    CLLocationCoordinate2D zoomLocation;
    
    // Add the proper latitude and longitude values
    zoomLocation.latitude  = 33.675749;
    zoomLocation.longitude = -117.886806;
    
    MKPointAnnotation *annotationPoint = [[MKPointAnnotation alloc] init];
    annotationPoint.coordinate         = zoomLocation;
    
    // Add the proper Drop Pin Title
    annotationPoint.title              = @"Branza";
    
    // Add the proper Drop Pin Subtitle
    annotationPoint.subtitle           = @"Branza's headquarters";
    
    [_mapView addAnnotation:annotationPoint];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

#pragma mark -
#pragma mark MapKit Delegate Methods

- (void)mapView:(MKMapView *)mv didAddAnnotationViews:(NSArray *)views
{
    CLLocationCoordinate2D zoomLocation;
    
    // Add the proper latitude and longitude values
    zoomLocation.latitude  = 33.675749;
    zoomLocation.longitude = -117.886806;
    
    MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(zoomLocation, 0.5 * METERS_PER_MILE, 0.5 * METERS_PER_MILE);
    
    [mv setRegion:region animated:YES];
}

- (void)mapView:(MKMapView *)mapView didUpdateUserLocation:(MKUserLocation *)userLocation
{
    self.mapView.centerCoordinate = userLocation.location.coordinate;
}

@end
