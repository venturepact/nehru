//
//  nUserSignIn.m
//  nehru
//
//  Created by ADMIN on 11/27/13.
//  Copyright (c) 2013 nehru. All rights reserved.
//

#import "nUserSignIn.h"

@interface nUserSignIn ()

@end

@implementation nUserSignIn

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	
    
}

-(IBAction)usrSignIn:(id)sender{
    
    if([usrNameField.text isEqualToString:@""]||[usrPwdField.text isEqualToString:@""]){
        
        // show alert on empty fields
        UIAlertView *showEmptyField=[[UIAlertView alloc]initWithTitle:@"nehru" message:@"Fields cannot be left empty" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
        [showEmptyField show];
    }
    else{
        
        [self performSegueWithIdentifier:@"UsrSignIn" sender:self];
    }
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
