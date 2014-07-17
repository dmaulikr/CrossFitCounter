//
//  PMNOopsViewController.h
//  CrossFitCounter
//
//  Created by Paul Nichols on 7/6/14.
//  Copyright (c) 2014 Paul Nichols. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PMNOopsViewController : UIViewController
@property (strong, nonatomic) IBOutlet UIDatePicker *datePicker;
@property (strong, nonatomic) IBOutlet UIButton *okButton;
@property (strong, nonatomic) IBOutlet UITextField *numberOfWorkouts;
@property (strong, nonatomic) IBOutlet UIButton *dismissKeyboard;

@end
