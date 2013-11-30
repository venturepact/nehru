//
//  nViewController.h
//  nehru
//
//  Created by ADMIN on 11/27/13.
//  Copyright (c) 2013 nehru. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface nViewController : UIViewController
{
    // thread delay
    dispatch_time_t bckgTime;
    NSArray *bckgImages;
    IBOutlet UIImageView *bckgImage;
    dispatch_source_t nTimer;
    
    // check if view coming back
    BOOL isComingBack;
}

-(IBAction)goToBrowse:(id)sender;
@end
