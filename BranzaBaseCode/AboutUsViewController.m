//
//  AboutUsViewController.m
//  BranzaBaseCode
//
//  Created by Kevin E. Rafferty II on 11/7/12.
//  Copyright (c) 2012 Branza. All rights reserved.
//

#import "AboutUsViewController.h"
#import "YouTubeViewController.h"
#import "GooglePlusViewController.h"

@interface AboutUsViewController ()

@end

@implementation AboutUsViewController

#pragma mark -
#pragma mark View Life Cycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"navigationHeader.png"] forBarMetrics:UIBarMetricsDefault];
    [self.navigationController.navigationBar.topItem setTitle:@"About Us"];
}

- (void)viewDidAppear:(BOOL)animated
{
    CGSize result = [[UIScreen mainScreen] bounds].size;
    
    if(result.height == 480)
    {
        [self.scrollView setScrollEnabled:YES];
        [self.scrollView setContentSize: CGSizeMake(self.scrollView.frame.size.width, self.scrollView.frame.size.height + 180)];
    }
    else if(result.height == 568)
    {
        [self.scrollView setScrollEnabled:YES];
        [self.scrollView setContentSize: CGSizeMake(self.scrollView.frame.size.width, self.scrollView.frame.size.height + 100)];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

#pragma mark -
#pragma mark IBActions

- (IBAction)ShareButton:(id)sender
{
    UIActionSheet *awesomeActionSheet = [[UIActionSheet alloc] initWithTitle:@"Share This App"
                                                                      delegate:self
                                                             cancelButtonTitle:@"Cancel"
                                                        destructiveButtonTitle:nil
                                                             otherButtonTitles:@"Twitter", @"Facebook", @"Email", nil];
    
    [awesomeActionSheet setActionSheetStyle:UIActionSheetStyleBlackTranslucent];
    [awesomeActionSheet showInView:self.view];
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
#pragma mark - UIActionSheet Delegate Methods

- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    switch (buttonIndex)
    {
        case 0:
            
            [self openTwitterAPI];
            break;
            
        case 1:
            
            [self openFacebookAPI];
            break;
            
        case 2:
            
            [self openEmail];
            break;
            
        default:
            break;
    }
}

#pragma mark -
#pragma mark - UIMessage Delegate Methods

- (void)mailComposeController:(MFMailComposeViewController *)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError *)error
{
    // Notifies users about errors associated with the interface
    switch (result)
    {
        case MFMailComposeResultCancelled:
            
        {
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Email"
                                                            message:@"The email was cancelled"
                                                           delegate:self
                                                  cancelButtonTitle:@"OK"
                                                  otherButtonTitles: nil];
            [alert show];
        }
            
            break;
            
        case MFMailComposeResultSaved:
            
        {
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Email"
                                                            message:@"The email was saved"
                                                           delegate:self
                                                  cancelButtonTitle:@"OK"
                                                  otherButtonTitles: nil];
            [alert show];
        }
            
            break;
            
        case MFMailComposeResultSent:
            
        {
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Email"
                                                            message:@"The email was successfully sent!"
                                                           delegate:self
                                                  cancelButtonTitle:@"OK"
                                                  otherButtonTitles: nil];
            [alert show];
        }
            
            break;
            
        case MFMailComposeResultFailed:
            
        {
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Email"
                                                            message:@"The email failed to send"
                                                           delegate:self
                                                  cancelButtonTitle:@"OK"
                                                  otherButtonTitles: nil];
            [alert show];
        }
            
            break;
            
        default:
            
        {
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Email"
                                                            message:@"Sending Failed - Unknown Error"
                                                           delegate:self
                                                  cancelButtonTitle:@"OK"
                                                  otherButtonTitles: nil];
            [alert show];
        }
            
            break;
    }
    
    [self dismissViewControllerAnimated:YES completion:nil];
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

/*
 
 FUNCTION    - openEmail
 
 PARAMETERS  - None
 
 DESCRIPTION - This Function will set up and call the Email API Service
 
 TODO's      - Add the proper Email Subject Line; Add the proper URL and message content
 
 */

- (void)openEmail
{
    MFMailComposeViewController* controller = [[MFMailComposeViewController alloc] init];
    
    controller.mailComposeDelegate = self;
    
    // Add the proper Email Subject Line
    NSString *emailSubject = @"Check out the Branza App!";
    
    // Add the proper URL and message content
    NSString *emailBody    = @"<a href='https://www.branza.com'>Click Here</a> to view the Branza App!";
    
    [controller setSubject:emailSubject];
    
    [controller setMessageBody:emailBody isHTML:YES];
    
    controller.navigationBar.barStyle = UIBarStyleBlack;
    
    if (controller)
    {
        [self presentViewController:controller animated:YES completion:nil];
    }
}

@end
