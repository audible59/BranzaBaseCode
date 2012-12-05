//
//  ContactUsViewController.m
//  BranzaBaseCode
//
//  Created by Kevin E. Rafferty II on 11/7/12.
//  Copyright (c) 2012 Branza. All rights reserved.
//

#import "ContactUsViewController.h"
#import "GoogleMapsViewController.h"
#import "CustomCell.h"

@interface ContactUsViewController ()

@end

@implementation ContactUsViewController

@synthesize data           = _data;
@synthesize mapView        = _mapView;
@synthesize tableView      = _tableView;
@synthesize tableViewArray = _tableViewArray;

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
    
    self.tableViewArray   = [[NSArray alloc] initWithObjects:@"866-323-7538",
                                      @"2900 Bristol Costa Mesa, \nCA 92626", nil];
    
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
    
    [self.mapView addAnnotation:annotationPoint];
}

- (void)viewDidAppear:(BOOL)animated
{    
    if(IS_IPHONE_5)
    {
        self.mapView.frame = CGRectMake(0.0, 0.0, 320.0, 228.0);
        
        self.tableView     = [[UITableView alloc] initWithFrame:CGRectMake(0.0, 226.0, 320.0, 228.0)];
    }
    else
    {
        self.mapView.frame = CGRectMake(0.0, 0.0, 320.0, 198.0);
        
        self.tableView     = [[UITableView alloc] initWithFrame:CGRectMake(0.0, 196.0, 320.0, 169.0)];
    }
    
    self.tableView.dataSource = self;
    self.tableView.delegate   = self;
    
    self.mapView.delegate = self;
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

#pragma mark -
#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CGFloat sectionFloat = 0.0;
    
    if(indexPath.section == 0)
    {
        sectionFloat = 40.0;
    }
    else if(indexPath.section == 1)
    {
        sectionFloat = (44.0 + (2 - 1) * 19.0);
    }
    
    return sectionFloat;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    CGFloat sectionHeaderFloat = 0.0;
    
    if(section == 0)
    {
        sectionHeaderFloat = 20.0;
    }
    
    return sectionHeaderFloat;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue2 reuseIdentifier:CellIdentifier];
    }
    
    if(indexPath.section == 0)
    {
        cell.textLabel.text       = @"phone";
        cell.detailTextLabel.text = [self.tableViewArray objectAtIndex:indexPath.section];
    }
    else if(indexPath.section == 1)
    {
        cell.textLabel.text       = @"address";
        cell.detailTextLabel.text = [self.tableViewArray objectAtIndex:indexPath.section];
        cell.detailTextLabel.numberOfLines = 2;
        cell.detailTextLabel.lineBreakMode = UILineBreakModeWordWrap;
    }
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    return cell;
}

#pragma mark
#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UIAlertView *phoneAlert = [[UIAlertView alloc] initWithTitle:@"Phone Call"
                                                         message:@"Would you like to call Round Table Pizza?"
                                                        delegate:self
                                               cancelButtonTitle:@"cancel"
                                               otherButtonTitles:@"call", nil];
    
    GoogleMapsViewController *googleMapsViewController = [[GoogleMapsViewController alloc] init];
    
    switch (indexPath.section)
    {
        case 0:
            
            [phoneAlert show];
            
            break;
            
        case 1:
            
            [self.navigationController pushViewController:googleMapsViewController animated:YES];
            
            break;
            
        default:
            break;
    }
}

#pragma mark -
#pragma mark UIAlertView Delegate Methods

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if(buttonIndex == 0)
    {
        // Do nothing, the call was cancelled
    }
    else if(buttonIndex == 1)
    {
        // make the call
        [self callButtonPressed];
    }
}

#pragma mark -
#pragma mark Helper Methods

- (void)callButtonPressed
{
    // Add the proper telephone number
    NSString *phoneNumber = @"866-323-7538";
    
    NSString *cleanedString  = [[phoneNumber componentsSeparatedByCharactersInSet:[[NSCharacterSet characterSetWithCharactersInString:@"0123456789-+()"] invertedSet]] componentsJoinedByString:@""];
    NSURL *cleanedCallString = [NSURL URLWithString:[NSString stringWithFormat:@"tel:%@", cleanedString]];
    
    UIApplication *application = [UIApplication sharedApplication];
    [application openURL:cleanedCallString];
}

@end
