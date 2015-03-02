//
//  AlarmViewController.m
//  ChugIt
//
//  Created by Johann Kerr on 6/23/14.
//  Copyright (c) 2014 Johann Kerr. All rights reserved.
//

#import "AlarmViewController.h"
#import "KPTimePicker.h"
#import "Categories.h"
#import "UIColor+FlatColors.h"
#import "ACPReminder.h"
#import "GameViewController.h"
#import "AppDelegate.h"

@interface AlarmViewController ()<KPTimePickerDelegate, UIGestureRecognizerDelegate>
@property (strong, nonatomic) AppDelegate *appDelegate;
@property (nonatomic, strong) KPTimePicker *timePicker;
@property (weak, nonatomic) IBOutlet UIButton *setTime;
@property (weak, nonatomic) IBOutlet UILabel *status;
@property (nonatomic, strong) UILongPressGestureRecognizer *longPressGestureRecognizer;
@property (nonatomic, strong) UIPanGestureRecognizer *panRecognizer;
@property (weak, nonatomic) IBOutlet UILabel *statusText;


@end

@implementation AlarmViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(void)timePicker:(KPTimePicker *)timePicker selectedDate:(NSDate *)date{
    [self show:NO timePickerAnimated:YES];
    
    if(date){
        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
        [dateFormatter setLocale:[NSLocale currentLocale]];
        [dateFormatter setDateStyle:NSDateFormatterNoStyle];
        [dateFormatter setTimeStyle:NSDateFormatterShortStyle];
        self.status.text = [[dateFormatter stringFromDate:date] lowercaseString];;
    }
    
    
    UILocalNotification* localNotification = [[UILocalNotification alloc] init];
    localNotification.fireDate = date;
    localNotification.alertBody = @"Go to the Bar!";
    localNotification.alertAction = @"Time To go to the Bar!";
    localNotification.timeZone = [NSTimeZone defaultTimeZone];
    
    
    [[UIApplication sharedApplication] scheduleLocalNotification:localNotification];
    
    
    [self.statusText setText:@"Alarm set! Happy Drinking!"];
    
    
}

-(BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer{
    if([otherGestureRecognizer isEqual:self.panRecognizer] && !self.timePicker) return NO;
    return YES;
}
-(void)longPressRecognized:(UILongPressGestureRecognizer*)sender{
    if(sender.state == UIGestureRecognizerStateBegan){
        [self show:YES timePickerAnimated:YES];
    }
}
-(void)show:(BOOL)show timePickerAnimated:(BOOL)animated{
    if(show){
        
        self.timePicker.pickingDate = [NSDate date];
        [self.view addSubview:self.timePicker];
        
    }
    else{
        [self.timePicker removeFromSuperview];
    }
}
-(void)panRecognized:(UIPanGestureRecognizer*)sender{
    if(!self.timePicker) return;
    [self.timePicker forwardGesture:sender];
}
-(UIStatusBarStyle)preferredStatusBarStyle{
    return UIStatusBarStyleLightContent;
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    self.appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    if ([self respondsToSelector:@selector(setNeedsStatusBarAppearanceUpdate)]){
        [self setNeedsStatusBarAppearanceUpdate];
    }
    
    //color(36,40,46,1);
    
    //self.setTime.layer.cornerRadius = 10;
    self.setTime.layer.borderColor = [UIColor whiteColor].CGColor;
    //self.setTime.layer.borderWidth = 2;
    CGRect alarmRect = CGRectMake(0,0,320,520);
    //self.view.bounds
    self.timePicker = [[KPTimePicker alloc] initWithFrame:alarmRect];
    self.timePicker.delegate = self;
    self.timePicker.minimumDate = [self.timePicker.pickingDate dateAtStartOfDay];
    self.timePicker.maximumDate = [[[self.timePicker.pickingDate dateByAddingMinutes:(60*24)] dateAtStartOfDay] dateBySubtractingMinutes:5];
    
    self.longPressGestureRecognizer = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(longPressRecognized:)];
    self.longPressGestureRecognizer.allowableMovement = 44.0f;
    self.longPressGestureRecognizer.delegate = self;
    self.longPressGestureRecognizer.minimumPressDuration = 0.6f;
    [self.setTime addGestureRecognizer:self.longPressGestureRecognizer];
    self.panRecognizer = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panRecognized:)];
    [self.view addGestureRecognizer:self.panRecognizer];
	// Do any additional setup after loading the view, typically from a nib.
    
    
    
    
}



-(IBAction)press:(id)sender{
    [self show:YES timePickerAnimated:YES];

    
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
