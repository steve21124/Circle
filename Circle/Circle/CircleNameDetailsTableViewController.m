//
//  MSENameDetailsTableViewController.m
//  MultiStepEditor
//
//  Created by Eddie Hillenbrand on 4/8/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "CircleNameDetailsTableViewController.h"
#import "Parse/Parse.h"

@interface CircleNameDetailsTableViewController ()

@end

@implementation CircleNameDetailsTableViewController
@synthesize nameTextField;
@synthesize detailsTextField;
@synthesize event = _event;


- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    [self.nameTextField becomeFirstResponder];
                            
}

- (void)viewDidUnload
{
    [self setNameTextField:nil];
    [self setDetailsTextField:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    if (textField == self.nameTextField) {
        [self.detailsTextField becomeFirstResponder];
    }
    
    return YES;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if([[segue identifier] isEqualToString:@"didEnterEventNameDetailsSegue"]) {
        id viewController = [segue destinationViewController];
        if ([viewController respondsToSelector:@selector(setEvent:)]) {
            self.event = [PFObject objectWithClassName:@"Event"];
            [self.event setObject:self.nameTextField.text forKey:@"name"];
            [self.event setObject:self.detailsTextField.text forKey:@"details"];
            [viewController setEvent:self.event];
        }
    }
}

#ifdef eddie
- (void)performSegueWithIdentifier:(NSString *)identifier sender:(id)sender {
    if ([identifier isEqualToString:@"didEnterEventNameDetailsSegue"]) {
    }
}
#endif

@end
