//
//  PMNViewController.m
//  CrossFitCounter
//
//  Created by Paul Nichols on 7/2/14.
//  Copyright (c) 2014 Paul Nichols. All rights reserved.
//

#import "PMNViewController.h"

@interface PMNViewController ()

@end

@implementation PMNViewController

NSString * const kWorkoutCounter = @"DefaultsWorkoutKey";
NSString * const kLastWorkoutDate = @"DefaultsDateKey";

- (void)viewDidLoad
{
    [super viewDidLoad];
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    if(![defaults objectForKey:kLastWorkoutDate]){
        [defaults setInteger:93 forKey:kWorkoutCounter];
        //I'm starting at workout 93 on 7/2/14!
        
    }
    [self updateLabels];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(updateLabels) name:@"updateParent" object:nil];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)updateLabels {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSInteger workoutCount = [defaults integerForKey:kWorkoutCounter];
    NSInteger workoutsLeft = 200 - workoutCount;
    NSDate *lastWorkout = [defaults objectForKey:kLastWorkoutDate];
    NSString *dateString;
    if (lastWorkout) {
        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
        [dateFormatter setDateFormat:@"MM/dd/YYYY"];
        dateString = [dateFormatter stringFromDate:lastWorkout];
    }
    self.workoutsCompleted.text = [NSString stringWithFormat:@"%ld", (long)workoutCount];
    self.workoutsRemaining.text = [NSString stringWithFormat:@"%ld", (long)workoutsLeft];
    self.lastWorkout.text = [NSString stringWithFormat:@"%@", dateString];
    NSInteger daysLeft = [self daysLeft];
    float weeksLeft = daysLeft / 7.0;
    float workoutsPerWeek = workoutsLeft / weeksLeft;
    self.weeklyRate.text = [NSString stringWithFormat:@"%.2f", workoutsPerWeek];
    
}

- (IBAction)wodButtonPressed:(id)sender {

    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:[NSDate date] forKey:kLastWorkoutDate];
    NSInteger newCount = [defaults integerForKey:kWorkoutCounter] + 1;
    [defaults setInteger:newCount forKey:kWorkoutCounter];

    
    [self updateLabels];
}

-(NSInteger)daysLeft {
    
    NSDate *today = [NSDate date];
    NSString *endString = @"2014-12-31";
    NSDateFormatter *f = [[NSDateFormatter alloc] init];
    [f setDateFormat:@"yyyy-MM-dd"];
    NSDate *endDate = [f dateFromString:endString];
    NSCalendar *gregorianCalendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    NSDateComponents *days = [gregorianCalendar components:NSDayCalendarUnit
                                                fromDate:today
                                                toDate:endDate
                                                 options:0];
    
    
    return [days day];
}
@end
