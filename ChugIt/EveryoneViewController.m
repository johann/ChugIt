//
//  EveryoneViewController.m
//  ChugIt
//
//  Created by Johann Kerr on 6/24/14.
//  Copyright (c) 2014 Johann Kerr. All rights reserved.
//

#import "EveryoneViewController.h"

@interface EveryoneViewController ()

@end

@implementation EveryoneViewController

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
    [self performSelector:@selector(hideController) withObject:nil afterDelay:5.0]; //change to 5 seconds
    //enter countdown after 3 seconds
   
    
}
-(void)hideController{
    if (![[self presentedViewController] isBeingDismissed])
    {
        [self dismissViewControllerAnimated:YES completion:nil];
    }
}

@end
