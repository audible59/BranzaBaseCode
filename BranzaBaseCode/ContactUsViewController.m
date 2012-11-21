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

#pragma mark -
#pragma mark View Life Cycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self.navigationController.navigationBar.topItem setTitle:@"Contact Us"];
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
@end
