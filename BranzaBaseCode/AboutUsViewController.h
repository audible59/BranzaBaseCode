//
//  AboutUsViewController.h
//  BranzaBaseCode
//
//  Created by Kevin E. Rafferty II on 11/7/12.
//  Copyright (c) 2012 Branza. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Social/Social.h>
#import <Accounts/Accounts.h>
#import "MessageUI/MessageUI.h"

@interface AboutUsViewController : UIViewController <UIActionSheetDelegate, MFMailComposeViewControllerDelegate>
{
    SLComposeViewController *mySLComposerSheet;
}

// IBACTIONS
- (IBAction)ShareButton:(id)sender;
- (IBAction)facebookButtonPressed:(id)sender;
- (IBAction)youtubeButtonPressed:(id)sender;
- (IBAction)twitterButtonPressed:(id)sender;
- (IBAction)googleButtonPressed:(id)sender;

// METHODS
- (void)openEmail;
- (void)openTwitterAPI;
- (void)openFacebookAPI;

@end
