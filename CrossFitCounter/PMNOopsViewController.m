//
//  PMNOopsViewController.m
//  CrossFitCounter
//
//  Created by Paul Nichols on 7/6/14.
//  Copyright (c) 2014 Paul Nichols. All rights reserved.
//

#import "PMNOopsViewController.h"
#import "PMNViewController.h"

@interface PMNOopsViewController ()

@end

@implementation PMNOopsViewController
@synthesize datePicker, okButton, numberOfWorkouts;


- (IBAction)getValues:(id)sender {
    
    NSDate *pickerDate = [datePicker date];
    int numOfWorkouts = [self.numberOfWorkouts.text intValue];
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:pickerDate forKey:@"DefaultsDateKey"];
    [defaults setInteger:numOfWorkouts forKey:@"DefaultsWorkoutKey"];
    [[NSNotificationCenter defaultCenter] postNotificationName:@"updateParent" object:nil];
    [self dismissViewControllerAnimated:YES completion:nil];

}


- (IBAction)dismissKeyboard:(id)sender {
    [numberOfWorkouts resignFirstResponder];
    [[self.dismissKeyboard superview] sendSubviewToBack:self.dismissKeyboard];
    
}

- (IBAction)numberOfWorkouts:(id)sender {
    [[self.dismissKeyboard superview] bringSubviewToFront:self.dismissKeyboard];
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.numberOfWorkouts.delegate = self;
    [self.numberOfWorkouts setReturnKeyType:UIReturnKeyDone];
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSInteger workoutCount = [defaults integerForKey:@"DefaultsWorkoutKey"];
    self.numberOfWorkouts.text = [NSString stringWithFormat:@"%i", workoutCount];
    
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return NO;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//[[myButton superview] bringSubviewToFront:myButton]

@end
