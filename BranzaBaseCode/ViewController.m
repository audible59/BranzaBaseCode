//
//  ViewController.m
//  BranzaBaseCode
//
//  Created by Kevin E. Rafferty II on 11/6/12.
//  Copyright (c) 2012 Branza. All rights reserved.
//

#import "ViewController.h"
#import "YouTubeViewController.h"
#import "GooglePlusViewController.h"

@interface ViewController ()

@end

@implementation ViewController

#pragma mark -
#pragma mark View Life Cycle

- (void)viewDidLoad
{
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"navigationHeader.png"] forBarMetrics:UIBarMetricsDefault];
    [self.navigationController.navigationBar.topItem setTitle:@"Pizza Hut App"];
    
    UIImage *selectedImageOne   = [UIImage imageNamed:@"homeTabButton_Pressed.png"];
    UIImage *unselectedImageOne = [UIImage imageNamed:@"homeTabButton.png"];
    
    UIImage *selectedImageTwo   = [UIImage imageNamed:@"menuTabButton_Pressed.png"];
    UIImage *unselectedImageTwo = [UIImage imageNamed:@"menuTabButton.png"];
    
    UIImage *selectedImageThree   = [UIImage imageNamed:@"contactTabButton_Pressed.png"];
    UIImage *unselectedImageThree = [UIImage imageNamed:@"contactTabButton.png"];
    
    UIImage *selectedImageFour   = [UIImage imageNamed:@"aboutTabButton_Pressed.png"];
    UIImage *unselectedImageFour = [UIImage imageNamed:@"aboutTabButton.png"];
    
    UITabBar *tabBar        = self.tabBarController.tabBar;
    UITabBarItem *itemOne   = [tabBar.items objectAtIndex:0];
    UITabBarItem *itemTwo   = [tabBar.items objectAtIndex:1];
    UITabBarItem *itemThree = [tabBar.items objectAtIndex:2];
    UITabBarItem *itemFour  = [tabBar.items objectAtIndex:3];
    
    [itemOne   setFinishedSelectedImage:selectedImageOne   withFinishedUnselectedImage:unselectedImageOne];
    [itemTwo   setFinishedSelectedImage:selectedImageTwo   withFinishedUnselectedImage:unselectedImageTwo];
    [itemThree setFinishedSelectedImage:selectedImageThree withFinishedUnselectedImage:unselectedImageThree];
    [itemFour  setFinishedSelectedImage:selectedImageFour  withFinishedUnselectedImage:unselectedImageFour];
    
    [super viewDidLoad];
}

- (void) viewDidAppear:(BOOL)animated
{
    [self.navigationController.navigationBar.topItem setTitle:@"Pizza Hut App"];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

#pragma mark -
#pragma mark IBActions

- (IBAction)orderNowButtonPressed:(id)sender
{
    // Add the proper telephone number
    NSString *phoneNumber = @"866-323-7538";
    
    NSString *cleanedString  = [[phoneNumber componentsSeparatedByCharactersInSet:[[NSCharacterSet characterSetWithCharactersInString:@"0123456789-+()"] invertedSet]] componentsJoinedByString:@""];
    NSURL *cleanedCallString = [NSURL URLWithString:[NSString stringWithFormat:@"tel:%@", cleanedString]];
    
    UIApplication *application = [UIApplication sharedApplication];
    [application openURL:cleanedCallString];
}

- (IBAction)facebookButtonPressed:(id)sender
{
    [self openFacebookAPI];
}

- (IBAction)youtubeButtonPressed:(id)sender
{
    YouTubeViewController *youtubeViewController = [[YouTubeViewController alloc] init];
    
    [self.navigationController pushViewController:youtubeViewController animated:YES];
}

- (IBAction)twitterButtonPressed:(id)sender
{
    [self openTwitterAPI];
}

- (IBAction)googleButtonPressed:(id)sender
{
    GooglePlusViewController *googleViewController = [[GooglePlusViewController alloc] init];
    
    [self.navigationController pushViewController:googleViewController animated:YES];
}

#pragma mark -
#pragma mark - Social Media Methods

/*
 
 FUNCTION    - openTwitterAPI
 
 PARAMETERS  - None
 
 DESCRIPTION - This Function will set up and call the Twitter API Service
 
 TODO's      - Add the proper PNG image asset; Add the proper URL
 
 */

- (void)openTwitterAPI
{
    if([SLComposeViewController isAvailableForServiceType:SLServiceTypeTwitter])
    {
        mySLComposerSheet = [SLComposeViewController composeViewControllerForServiceType:SLServiceTypeTwitter];
        [mySLComposerSheet setInitialText:[NSString stringWithFormat:@"iOS 6 %@ integration test!", mySLComposerSheet.serviceType]];
        
        // Added the proper PNG image asset
        // [mySLComposerSheet addImage:[UIImage imageNamed:@"image.png"]];
        
        // Add the proper URL
        // [mySLComposerSheet addURL:[NSURL URLWithString:@"http://www.StackOverflow.com/"]];
        
        [self presentViewController:mySLComposerSheet
                           animated:YES
                         completion:nil];
    }
    else
    {
        // present a UIAlertView to prompt the user to set up a Twitter Account
        UIAlertView *twitterAlert = [[UIAlertView alloc] initWithTitle:@"Twitter Account Setup"
                                                               message:@"Please setup your Twitter Account to fully enjoy this app!"
                                                              delegate:self
                                                     cancelButtonTitle:@"Ok"
                                                     otherButtonTitles:nil];
        
        [twitterAlert show];
    }
    
    [mySLComposerSheet setCompletionHandler:^(SLComposeViewControllerResult result){
        
        NSString *output = nil;
        
        switch (result)
        {
            case SLComposeViewControllerResultCancelled:
                output = @"Action Cancelled";
                break;
                
            case SLComposeViewControllerResultDone:
                output = @"Post Successfull";
                break;
                
            default:
                break;
        }
        
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Twitter Message"
                                                        message:output
                                                       delegate:nil
                                              cancelButtonTitle:@"Ok"
                                              otherButtonTitles:nil];
        
        [alert show];
    }];
}

/*
 
 FUNCTION    - openFacebookAPI
 
 PARAMETERS  - None
 
 DESCRIPTION - This Function will set up and call the Facebook API Service
 
 TODO's      - Add the proper PNG image asset; Add the proper URL
 
 */

- (void)openFacebookAPI
{
    if([SLComposeViewController isAvailableForServiceType:SLServiceTypeFacebook])
    {
        mySLComposerSheet = [SLComposeViewController composeViewControllerForServiceType:SLServiceTypeFacebook];
        [mySLComposerSheet setInitialText:[NSString stringWithFormat:@"iOS 6 %@ integration test!", mySLComposerSheet.serviceType]];
        
        // Added the proper PNG image asset
        // [mySLComposerSheet addImage:[UIImage imageNamed:@"image.png"]];
        
        // Add the proper URL
        // [mySLComposerSheet addURL:[NSURL URLWithString:@"http://www.StackOverflow.com/"]];
        
        [self presentViewController:mySLComposerSheet
                           animated:YES
                         completion:nil];
    }
    else
    {
        // present a UIAlertView to prompt the user to set up a Twitter Account
        UIAlertView *twitterAlert = [[UIAlertView alloc] initWithTitle:@"Facebook Account Setup"
                                                               message:@"Please setup your Facebook Account to fully enjoy this app!"
                                                              delegate:self
                                                     cancelButtonTitle:@"Ok"
                                                     otherButtonTitles:nil];
        
        [twitterAlert show];
    }
    
    [mySLComposerSheet setCompletionHandler:^(SLComposeViewControllerResult result){
        
        NSString *output = nil;
        
        switch (result)
        {
            case SLComposeViewControllerResultCancelled:
                output = @"Action Cancelled";
                break;
                
            case SLComposeViewControllerResultDone:
                output = @"Post Successfull";
                break;
                
            default:
                break;
        }
        
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Facebook Message"
                                                        message:output
                                                       delegate:nil
                                              cancelButtonTitle:@"Ok"
                                              otherButtonTitles:nil];
        
        [alert show];
    }];
}

@end
