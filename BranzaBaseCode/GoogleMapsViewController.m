//
//  GoogleMapsViewController.m
//  BranzaBaseCode
//
//  Created by Kevin E. Rafferty II on 12/4/12.
//  Copyright (c) 2012 Branza. All rights reserved.
//

#import "GoogleMapsViewController.h"

@interface GoogleMapsViewController ()

@end

@implementation GoogleMapsViewController

@synthesize webView = _webView;

#pragma mark -
#pragma mark View Life Cycle

- (void)viewDidLoad
{
    self.title = @"Google Maps";
    
    if(IS_IPHONE_5)
    {
        UIWebView *webView = [[UIWebView alloc] initWithFrame:CGRectMake(0.0,0.0,320.0,504.0)];
        webView.delegate   = self;
        
        // [webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://maps.google.com/?q=hospital+loc:33.675749,-117.886806"]]];
        
        [webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://maps.google.com/maps?saddr=Current%20Location&daddr=33.675749,-117.886806"]]];
        
        [self.view addSubview:webView];
    }
    else
    {
        UIWebView *webView = [[UIWebView alloc] initWithFrame:CGRectMake(0.0,0.0,320.0,362.0)];
        webView.delegate   = self;
        
        [webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://maps.google.com/maps?saddr=Current%20Location&daddr=33.675749,-117.886806"]]];
        
        [self.view addSubview:webView];
    }
    
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
