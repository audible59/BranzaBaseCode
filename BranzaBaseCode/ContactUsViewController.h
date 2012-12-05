//
//  ContactUsViewController.h
//  BranzaBaseCode
//
//  Created by Kevin E. Rafferty II on 11/7/12.
//  Copyright (c) 2012 Branza. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>

@interface ContactUsViewController : UIViewController <MKMapViewDelegate, UIAlertViewDelegate, CLLocationManagerDelegate, UITableViewDataSource, UITableViewDelegate>
{
    CLLocationManager *locationManager;
}

// MKMAPVIEW
@property (strong, nonatomic) IBOutlet MKMapView *mapView;

// UITABLEVIEW
@property (strong, nonatomic) IBOutlet UITableView *tableView;

// NSARRAY
@property (strong, nonatomic) NSArray *data;
@property (strong, nonatomic) NSArray *tableViewArray;

// METHODS

- (void)callButtonPressed;

@end
