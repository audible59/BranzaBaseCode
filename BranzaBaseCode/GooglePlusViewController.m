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
    
    CGSize result = [[UIScreen mainScreen] bounds].size;
    
    if(result.height == 480)
    {
        UIWebView *webView = [[UIWebView alloc] initWithFrame:CGRectMake(0.0,0.0,320.0,362.0)];
        webView.delegate   = self;
        
        [webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"https://plus.google.com/"]]];
        
        [self.view addSubview:webView];
    }
    else if(result.height == 568)
    {
        UIWebView *webView = [[UIWebView alloc] initWithFrame:CGRectMake(0.0,0.0,320.0,504.0)];
        webView.delegate   = self;
        
        [webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"https://plus.google.com/"]]];
        
        [self.view addSubview:webView];
    }
    
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
