//
//  GooglePlusViewController.m
//  BranzaBaseCode
//
//  Created by Kevin E. Rafferty II on 11/21/12.
//  Copyright (c) 2012 Branza. All rights reserved.
//

#import "GooglePlusViewController.h"

@interface GooglePlusViewController ()

@end

@implementation GooglePlusViewController

#pragma mark -
#pragma mark View Life Cycle

- (void)viewDidLoad
{
    self.title = @"Google+";
    
    UIWebView *webView = [[UIWebView alloc] initWithFrame:CGRectMake(0.0,0.0,320.0,362.0)];
    webView.delegate   = self;
    
    [webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"https://plus.google.com/"]]];
    
    [self.view addSubview:webView];
    
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
