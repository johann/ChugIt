//
//  AllGirlsViewController.m
//  ChugIt
//
//  Created by Johann Kerr on 6/26/14.
//  Copyright (c) 2014 Johann Kerr. All rights reserved.
//

#import "AllGirlsViewController.h"

@interface AllGirlsViewController ()

@end

@implementation AllGirlsViewController

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
    [self performSelector:@selector(hideController) withObject:nil afterDelay:5.0];
    
    
}
-(void)hideController{
    if (![[self presentedViewController] isBeingDismissed])
    {
        [self dismissViewControllerAnimated:YES completion:nil];
    }
}
@end
