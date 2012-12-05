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

@interface ViewController : UIViewController <UIScrollViewDelegate, UIAlertViewDelegate, MFMailComposeViewControllerDelegate>
{
    SLComposeViewController *mySLComposerSheet;
}

// UIIMAGEVIEWS
@property (strong, nonatomic) IBOutlet UIImageView *headerImage;

// UISCROLLVIEWS
@property (strong, nonatomic) IBOutlet UIScrollView *scrollView;

// UIBUTTONS
@property (strong, nonatomic) IBOutlet UIButton *facebookButton;

// IBActions
- (IBAction)orderNowButtonPressed:(id)sender;
- (IBAction)facebookButtonPressed:(id)sender;
- (IBAction)youtubeButtonPressed:(id)sender;
- (IBAction)twitterButtonPressed:(id)sender;
- (IBAction)googleButtonPressed:(id)sender;
- (IBAction)advertisementButtonPressed:(id)sender;

// METHODS
- (void)scrollToNextPage;

@end
