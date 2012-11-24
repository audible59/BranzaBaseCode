//
//  ContactUsViewController.m
//  BranzaBaseCode
//
//  Created by Kevin E. Rafferty II on 11/7/12.
//  Copyright (c) 2012 Branza. All rights reserved.
//

#import "ContactUsViewController.h"

@interface ContactUsViewController ()

@end

@implementation ContactUsViewController

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
    
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"navigationHeader.png"] forBarMetrics:UIBarMetricsDefault];
    [self.navigationController.navigationBar.topItem setTitle:@"Contact Us"];
    
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
#pragma mark IBActions

/*
 
 FUNCTION    - callButton:(id)sender
 
 PARAMETERS  - sender
 
 DESCRIPTION - This Function will set up and allow the user to place a call
 
 TODO's      - Add the proper telephone number
 
 */

- (IBAction)callButton:(id)sender
{
    // Add the proper telephone number
    NSString *phoneNumber = @"866-323-7538";
    
    NSString *cleanedString  = [[phoneNumber componentsSeparatedByCharactersInSet:[[NSCharacterSet characterSetWithCharactersInString:@"0123456789-+()"] invertedSet]] componentsJoinedByString:@""];
    NSURL *cleanedCallString = [NSURL URLWithString:[NSString stringWithFormat:@"tel:%@", cleanedString]];
    
    UIApplication *application = [UIApplication sharedApplication];
    [application openURL:cleanedCallString];
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
