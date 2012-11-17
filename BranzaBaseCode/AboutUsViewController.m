//
//  AboutUsViewController.m
//  BranzaBaseCode
//
//  Created by Kevin E. Rafferty II on 11/7/12.
//  Copyright (c) 2012 Branza. All rights reserved.
//

#import "AboutUsViewController.h"

@interface AboutUsViewController ()

@end

@implementation AboutUsViewController

#pragma mark -
#pragma mark View Life Cycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self.navigationController setNavigationBarHidden:NO
                                             animated:YES];
    
    [self.navigationController.navigationBar.topItem setTitle:@"About Us"];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

#pragma mark -
#pragma mark IBActions

- (IBAction)ShareButton:(id)sender
{
    UIActionSheet *awesomeActionSheet   = [[UIActionSheet alloc] initWithTitle:@"Share This app"
                                                                      delegate:self
                                                             cancelButtonTitle:@"Cancel"
                                                        destructiveButtonTitle:nil
                                                             otherButtonTitles:@"Twitter", @"Facebook", @"Email", nil];
    
    [awesomeActionSheet setActionSheetStyle:UIActionSheetStyleBlackTranslucent];
    [awesomeActionSheet showInView:self.view];
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

- (void)openTwitterAPI
{
    if([SLComposeViewController isAvailableForServiceType:SLServiceTypeTwitter])
    {
        mySLComposerSheet = [SLComposeViewController composeViewControllerForServiceType:SLServiceTypeTwitter];
        [mySLComposerSheet setInitialText:[NSString stringWithFormat:@"iOS 6 %@ integration test!", mySLComposerSheet.serviceType]];
        // [mySLComposerSheet addImage:[UIImage imageNamed:@"image.png"]];
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

- (void)openFacebookAPI
{
    if([SLComposeViewController isAvailableForServiceType:SLServiceTypeFacebook])
    {
        mySLComposerSheet = [SLComposeViewController composeViewControllerForServiceType:SLServiceTypeFacebook];
        [mySLComposerSheet setInitialText:[NSString stringWithFormat:@"iOS 6 %@ integration test!", mySLComposerSheet.serviceType]];
        // [mySLComposerSheet addImage:[UIImage imageNamed:@"image.png"]];
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

- (void)openEmail
{
    // setup the email controller
    MFMailComposeViewController* controller = [[MFMailComposeViewController alloc] init];
    
    //important step if you want feedbacks on what the user did with your email sheet
    controller.mailComposeDelegate = self;
    
    NSString *emailSubject = @"Check out the Branza App!";
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
