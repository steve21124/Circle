//
//  CircleSignInViewController.m
//  Circle
//
//  Created by Joshua Conner on 4/10/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "CircleSignInViewController.h"
#import "Parse/Parse.h"

@interface CircleSignInViewController () {
    BOOL isVoluntarySignIn;
    PF_MBProgressHUD *HUD;
}

@end

@implementation CircleSignInViewController
@synthesize callToActionLabel;
@synthesize emailTextField;
@synthesize passwordTextField;

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
	// Do any additional setup after loading the view.
    if (isVoluntarySignIn) 
        self.callToActionLabel.text = @"Sign in to your Circle account!";
}

- (void)viewDidUnload
{
    [self setEmailTextField:nil];
    [self setPasswordTextField:nil];
    [self setCallToActionLabel:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
- (IBAction)dismissKeyboard:(id)sender {
    [self.view endEditing:YES];
}

#pragma mark - UITextFieldDelegate method
- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    if (textField == self.emailTextField) {
        [self.passwordTextField becomeFirstResponder];
        return NO;
    } else {
        PFUser *newUser = [PFUser user];
        newUser.username = self.emailTextField.text;
        newUser.password = self.passwordTextField.text;
        
        [newUser signUpInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
            if (!error) {
                //successful signup!
            } else {
                
            }
        }];
    }
    return YES;
}


#pragma mark - MBProgressHUDDelegate methods
- (void)hudWasHidden:(PF_MBProgressHUD *)hud {
	// Remove HUD from screen when the HUD was hidden
	[HUD removeFromSuperview];
	HUD = nil;
}
@end