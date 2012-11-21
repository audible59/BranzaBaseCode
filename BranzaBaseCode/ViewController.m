//
//  ViewController.m
//  BranzaBaseCode
//
//  Created by Kevin E. Rafferty II on 11/6/12.
//  Copyright (c) 2012 Branza. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

#pragma mark -
#pragma mark View Life Cycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self.navigationController.navigationBar.topItem setTitle:@"Pizza Hut"];
}

- (void)viewWillAppear:(BOOL)animated
{
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
