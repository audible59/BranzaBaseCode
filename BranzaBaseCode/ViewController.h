//
//  ViewController.h
//  BranzaBaseCode
//
//  Created by Kevin E. Rafferty II on 11/6/12.
//  Copyright (c) 2012 Branza. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MessageUI/MessageUI.h"

#import <Social/Social.h>
#import <Accounts/Accounts.h>

@interface ViewController : UIViewController <MFMailComposeViewControllerDelegate>
{
    SLComposeViewController *mySLComposerSheet;
}

// IBActions
- (IBAction)orderNowButtonPressed:(id)sender;
- (IBAction)facebookButtonPressed:(id)sender;
- (IBAction)youtubeButtonPressed:(id)sender;
- (IBAction)twitterButtonPressed:(id)sender;
- (IBAction)googleButtonPressed:(id)sender;

@end
