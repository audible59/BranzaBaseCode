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

@synthesize scrollView     = _scrollView;
@synthesize headerImage    = _headerImage;
@synthesize facebookButton = _facebookButton;

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
    
    tabBar.selectionIndicatorImage = [[UIImage alloc] init];
    
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

- (void)viewDidAppear:(BOOL)animated
{        
    if(IS_IPHONE_5)
    {
        [self.scrollView setScrollEnabled:YES];
        [self.scrollView setContentSize: CGSizeMake(self.scrollView.frame.size.width, self.scrollView.frame.size.height + 89)];
    }
    else
    {
        [self.scrollView setScrollEnabled:YES];
        [self.scrollView setContentSize: CGSizeMake(self.scrollView.frame.size.width, self.scrollView.frame.size.height)];
        [self.scrollView setFrame:CGRectMake(0, 2, self.scrollView.frame.size.width, self.scrollView.frame.size.height)];
    }
    
    NSInteger numberOfImages = 4;
    
    for(int i = 0; i < numberOfImages; i++)
    {
        CGFloat xOrigin = i * self.scrollView.frame.size.width;
        
        NSString *imageString  = [NSString stringWithFormat:@"image%i@2x.png", i];
        UIImage *image         = [UIImage imageNamed:imageString];
        
        UIImageView *imageView = [[UIImageView alloc] initWithImage:image];
        imageView.frame        = CGRectMake(xOrigin, self.scrollView.frame.origin.y, self.scrollView.frame.size.width, self.scrollView.frame.size.height);
        
        [self.scrollView addSubview:imageView];
    }
    
    [self.scrollView setContentSize:CGSizeMake(self.scrollView.frame.size.width * numberOfImages, self.scrollView.frame.size.height)];
    
    [self.view addSubview:self.scrollView];
    
    [NSTimer scheduledTimerWithTimeInterval:5.0
                                     target:self
                                   selector:@selector(scrollToNextPage)
                                   userInfo:nil
                                    repeats:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

#pragma mark -
#pragma mark IBActions

- (IBAction)orderNowButtonPressed:(id)sender
{
    // present a UIAlertView to prompt the user to set up a Twitter Account
    UIAlertView *phoneAlert = [[UIAlertView alloc] initWithTitle:@"Phone Call"
                                                         message:@"Would you like to call Round Table Pizza?"
                                                        delegate:self
                                               cancelButtonTitle:@"cancel"
                                               otherButtonTitles:@"call", nil];
    
    [phoneAlert show];
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

- (IBAction)advertisementButtonPressed:(id)sender
{
    NSLog(@"Advertisement PRESSED!");
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

#pragma mark -
#pragma mark Auto Scroll Method

- (void)scrollToNextPage
{
    CGFloat pageNumber = (int)(self.scrollView.contentOffset.x / self.scrollView.frame.size.width) + 1;
    
    CGRect nextPage;
    
    if((pageNumber) == 4)
    {
        nextPage = CGRectMake(0, self.scrollView.frame.origin.y, self.scrollView.frame.size.width, self.scrollView.frame.size.height);
    }
    else
    {
        nextPage = CGRectMake(self.scrollView.frame.size.width * (pageNumber), self.scrollView.frame.origin.y, self.scrollView.frame.size.width, self.scrollView.frame.size.height);
    }
    
    [self.scrollView scrollRectToVisible:nextPage
                                animated:YES];    
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
