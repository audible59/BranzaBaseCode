//
//  YouTubeViewController.m
//  BranzaBaseCode
//
//  Created by Kevin E. Rafferty II on 11/21/12.
//  Copyright (c) 2012 Branza. All rights reserved.
//

#import "YouTubeViewController.h"

@interface YouTubeViewController ()

@end

@implementation YouTubeViewController

#pragma mark -
#pragma mark View Life Cycle

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.title = @"Youtube";
    
    CGSize result = [[UIScreen mainScreen] bounds].size;
    
    if(result.height == 480)
    {
        UIWebView *webView = [[UIWebView alloc] initWithFrame:CGRectMake(0.0,0.0,320.0,362.0)];
        webView.delegate   = self;
        
        [webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://www.youtube.com"]]];
        
        [self.view addSubview:webView];
    }
    else if(result.height == 568)
    {
        UIWebView *webView = [[UIWebView alloc] initWithFrame:CGRectMake(0.0,0.0,320.0,504.0)];
        webView.delegate   = self;
        
        [webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://www.youtube.com"]]];
        
        [self.view addSubview:webView];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end