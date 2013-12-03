//
//  nViewController.m
//  nehru
//
//  Created by ADMIN on 11/27/13.
//  Copyright (c) 2013 nehru. All rights reserved.
//

#import "nViewController.h"

@interface nViewController ()

@end

@implementation nViewController

#pragma mark View Methods

-(void)viewDidAppear:(BOOL)animated{
    
    if(isComingBack){
        dispatch_resume(nTimer);
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	static int i=0;
    bckgImages=[NSArray arrayWithObjects:@"bckgImage1.png",@"bckgImage2.png",@"bckgImage3.png",@"bckgImage4.png", nil];
    
    // Thread delay
    bckgTime=dispatch_time(DISPATCH_TIME_NOW, NSEC_PER_SEC);
    
    dispatch_queue_t backgroundQueue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    nTimer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, backgroundQueue);
    dispatch_source_set_timer(nTimer, DISPATCH_TIME_NOW, 2 * NSEC_PER_SEC, 0.05 * NSEC_PER_SEC);
    dispatch_source_set_event_handler(nTimer, ^{
        //background.alpha=0.5;
        
        
        if (i == [bckgImages count]){
            i=0;
        }
        
        NSLog(@"%d",i);
        
        dispatch_async(dispatch_get_main_queue(), ^{
            bckgImage.alpha=1;
            bckgImage.image =[UIImage imageNamed:[bckgImages objectAtIndex:i]];
            i++;
        });
        
    });
    dispatch_resume(nTimer);
}

-(IBAction)goToBrowse:(id)sender{
    dispatch_suspend(nTimer);
    isComingBack=TRUE;
//    [self performSegueWithIdentifier:@"gotToBrowse" sender:self];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
