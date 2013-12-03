//
//  MapViewController.m
//  RevealControllerStoryboardExample
//
//  Created by Nick Hodapp on 1/9/13.
//  Copyright (c) 2013 CoDeveloper. All rights reserved.
//

#import "MapViewController.h"

@interface MapViewController ()
@property (nonatomic) IBOutlet UIBarButtonItem* revealButtonItem;
@end

@implementation MapViewController
@synthesize revealButtonItem;
- (void)viewDidLoad
{
    [super viewDidLoad];
//    [self.navigationController.navigationBar setHidden:YES];
//    self.revealButtonItem=[[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"reveal-icon.png"] style:UIBarButtonItemStylePlain target:self action:@selector(revealToggle:)];
//    self.navigationController.navigationItem.leftBarButtonItem=self.revealButtonItem;
    [self.revealButtonItem setTarget: self.revealViewController];
   [self.revealButtonItem setAction: @selector( revealToggle: )];
    [self.navigationController.navigationBar addGestureRecognizer: self.revealViewController.panGestureRecognizer];
}

@end
