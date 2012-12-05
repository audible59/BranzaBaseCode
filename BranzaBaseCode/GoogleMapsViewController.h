//
//  GoogleMapsViewController.h
//  BranzaBaseCode
//
//  Created by Kevin E. Rafferty II on 12/4/12.
//  Copyright (c) 2012 Branza. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GoogleMapsViewController : UIViewController <UIWebViewDelegate>

// UIWEBVIEWS
@property (strong, nonatomic) IBOutlet UIWebView *webView;

@end