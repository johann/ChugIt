//
//  PickViewController.m
//  ChugIt
//
//  Created by Johann Kerr on 7/17/14.
//  Copyright (c) 2014 Johann Kerr. All rights reserved.
//

#import "PickViewController.h"
#import "AppDelegate.h"
#import "QBFlatButton.h"
@interface PickViewController ()
@property (nonatomic, strong) AppDelegate *appDelegate;

@end

@implementation PickViewController

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
    self.appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    
    QBFlatButton *chugButton = [QBFlatButton buttonWithType:UIButtonTypeCustom];
    chugButton.frame = CGRectMake(60, 370, 200, 60);
    
    chugButton.surfaceColor = [UIColor colorWithRed:243.0/255.0 green:152.0/255.0 blue:0 alpha:1.0];
    chugButton.sideColor = [UIColor colorWithRed:170.0/255.0 green:105.0/255.0 blue:0 alpha:1.0];
    
    chugButton.cornerRadius = 6.0;
    chugButton.height = 3.0;
    chugButton.depth = 3.0;
    
    chugButton.titleLabel.font = [UIFont boldSystemFontOfSize:16];
    [chugButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [chugButton setTitle:@"Pick Player" forState:UIControlStateNormal];
    [chugButton addTarget:self action:@selector(actionme) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:chugButton];

    
}
-(void)actionme: (QBFlatButton*)button{
    UIActionSheet *sendChug = [[UIActionSheet alloc] initWithTitle:@"Choose Someone"
                                                          delegate:self
                                                 cancelButtonTitle:nil
                                            destructiveButtonTitle:nil
                                                 otherButtonTitles:nil];
    
    for (int i=0; i<[[self.appDelegate.mpcHandler.session connectedPeers] count]; i++) {
        [sendChug addButtonWithTitle:[[[self.appDelegate.mpcHandler.session connectedPeers] objectAtIndex:i] displayName]];
    }
    
    [sendChug setCancelButtonIndex:[sendChug addButtonWithTitle:@"Cancel"]];
    
    [sendChug showInView:self.view];
    [button removeFromSuperview];
    
    
}

#pragma mark - UIActionSheet Delegate method implementation

-(void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex{
    if (buttonIndex != [[self.appDelegate.mpcHandler.session connectedPeers] count]) {
        
        
        dispatch_async(dispatch_get_main_queue(), ^{
            NSString *message = @"drink";
            NSArray *choice = [[NSArray alloc] initWithObjects:[[self.appDelegate.mpcHandler.session connectedPeers] objectAtIndex:buttonIndex], nil];
            NSLog(@"%@",[[self.appDelegate.mpcHandler.session connectedPeers] objectAtIndex:buttonIndex] );
            NSLog(@"%@", choice);
            
            
            
            NSData *messageAs = [message dataUsingEncoding:NSUTF8StringEncoding];
            NSError *err;
            
            
            [self.appDelegate.mpcHandler.session sendData:messageAs
                                                  toPeers:choice
                                                 withMode:MCSessionSendDataReliable
                                                    error:&err];
            if (err != nil) {
                NSLog(@"help me%@", [err localizedDescription]);
                
            } else{
                
                
                
            }
        });
        
        
        [self hideController];


    }
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)hideController{
    if (![[self presentedViewController] isBeingDismissed])
    {
        
        [self dismissViewControllerAnimated:YES completion:nil];
    }
}


@end
