//
//  PMNViewController.h
//  CrossFitCounter
//
//  Created by Paul Nichols on 7/2/14.
//  Copyright (c) 2014 Paul Nichols. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PMNViewController : UIViewController
@property (strong, nonatomic) IBOutlet UIButton *wodButtonPressed;
@property (strong, nonatomic) IBOutlet UILabel *workoutsCompleted;
@property (strong, nonatomic) IBOutlet UILabel *workoutsRemaining;
@property (strong, nonatomic) IBOutlet UILabel *weeklyRate;
@property (strong, nonatomic) IBOutlet UILabel *lastWorkout;

@end
