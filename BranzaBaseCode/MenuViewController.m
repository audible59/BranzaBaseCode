//
//  MenuViewController.m
//  BranzaBaseCode
//
//  Created by Kevin E. Rafferty II on 11/7/12.
//  Copyright (c) 2012 Branza. All rights reserved.
//

#import "MenuViewController.h"

@interface MenuViewController ()

@end

@implementation MenuViewController

#pragma mark -
#pragma mark View Life Cycle

/*
 
 FUNCTION    - viewDidLoad
 
 PARAMETERS  - None
 
 DESCRIPTION - This Function will set up View once it has been loaded into memory
 
 TODO's      - Add the proper PDF file name
 
 */

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self.navigationController setNavigationBarHidden:NO animated:YES];
    [self.navigationController.navigationBar.topItem setTitle:@"Menu"];
    
    // Add the proper PDF file name
    NSString *path        = [[NSBundle mainBundle] pathForResource:@"autoCADKeyboardShortcuts" ofType:@"pdf"];
    
    NSURL *targetURL      = [NSURL fileURLWithPath:path];
    NSURLRequest *request = [NSURLRequest requestWithURL:targetURL];
    
    [self.webView loadRequest:request];
    [self.view addSubview:self.webView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
