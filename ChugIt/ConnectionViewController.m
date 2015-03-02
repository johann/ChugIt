//
//  ConnectionViewController.m
//  ChugIt
//
//  Created by Johann Kerr on 6/23/14.
//  Copyright (c) 2014 Johann Kerr. All rights reserved.
//

#import "ConnectionViewController.h"
#import "AppDelegate.h"
#import "QBFlatButton.h"
#import "ZFModalTransitionAnimator.h"
#import "AllGirlsViewController.h"
#import "AllGuysViewController.h"
#import "ChooseGameViewController.h"
#import "DrinkViewController.h"
#import "EveryoneViewController.h"
#import "PickViewController.h"
#import "AAAAchievementDataSource.h"
#import "AAAAchievementManager.h"
#import "AAAGamificationManager.h"


@interface ConnectionViewController ()
@property (strong, nonatomic) AppDelegate *appDelegate;
@property (nonatomic) BOOL hasCreatedGame;
@property (nonatomic) BOOL isGameRunning;
@property (nonatomic, strong) ZFModalTransitionAnimator *animator;

@end

@implementation ConnectionViewController

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
    
    [self.appDelegate.mpcHandler setupPeerWithDisplayName:[UIDevice currentDevice].name];
    [self.appDelegate.mpcHandler setupSession];
    [self.appDelegate.mpcHandler advertiseSelf:YES];
    
    
    
    [[QBFlatButton appearance] setSurfaceColor:[UIColor colorWithWhite:0.75 alpha:1.0] forState:UIControlStateDisabled];
    [[QBFlatButton appearance] setSideColor:[UIColor colorWithWhite:0.55 alpha:1.0] forState:UIControlStateDisabled];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(peerChangedStateWithNotification:)
                                                 name:@"MPCDemo_DidChangeStateNotification"
                                               object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(handleReceivedDataWithNotification:)
                                                 name:@"MPCDemo_DidReceiveDataNotification"
                                               object:nil];

    
    [self.txtPlayerName setDelegate:self];
    
}


- (void)browserViewControllerDidFinish:(MCBrowserViewController *)browserViewController {
    [self.appDelegate.mpcHandler.browser dismissViewControllerAnimated:YES completion:nil];
}

- (void)browserViewControllerWasCancelled:(MCBrowserViewController *)browserViewController {
    [self.appDelegate.mpcHandler.browser dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark -
#pragma mark Text Field Delegate Methods
- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [self.txtPlayerName resignFirstResponder];
    
    if (self.appDelegate.mpcHandler.peerID != nil) {
        [self.appDelegate.mpcHandler.session disconnect];
        
        self.appDelegate.mpcHandler.peerID = nil;
        self.appDelegate.mpcHandler.session = nil;
    }
    
    [self.appDelegate.mpcHandler setupPeerWithDisplayName:self.txtPlayerName.text];
    [self.appDelegate.mpcHandler setupSession];
    [self.appDelegate.mpcHandler advertiseSelf:YES];
    
    return YES;
}
//
//-(IBAction)toggle:(id)sender{
//    [self.appDelegate.mpcHandler advertiseSelf:YES];
//}
-(IBAction)search:(id)sender{
   
    if (self.appDelegate.mpcHandler.session != nil) {
        
        [[self.appDelegate mpcHandler] setupBrowser];
        [[[self.appDelegate mpcHandler] browser] setDelegate:self];
        
        [self presentViewController:self.appDelegate.mpcHandler.browser
                           animated:YES
                         completion:nil];
    }
    
}
-(IBAction)dis:(id)sender {
    [self.appDelegate.mpcHandler.session disconnect];
    
    
}


#pragma mark -
#pragma mark Notification Handling
- (void)peerChangedStateWithNotification:(NSNotification *)notification {
    // Get the state of the peer.
    
    //
   
    
    //
    int state = [[[notification userInfo] objectForKey:@"state"] intValue];
    
    // We care only for the Connected and the Not Connected states.
    // The Connecting state will be simply ignored.
    
    QBFlatButton *startButton = [QBFlatButton buttonWithType:UIButtonTypeCustom];
    startButton.frame = CGRectMake(60, 420, 200, 60);
    
    startButton.surfaceColor = [UIColor colorWithRed:243.0/255.0 green:152.0/255.0 blue:0 alpha:1.0];
    startButton.sideColor = [UIColor colorWithRed:170.0/255.0 green:105.0/255.0 blue:0 alpha:1.0];
    
    startButton.cornerRadius = 6.0;
    startButton.height = 3.0;
    startButton.depth = 3.0;
    
    startButton.titleLabel.font = [UIFont boldSystemFontOfSize:16];
    [startButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [startButton setTitle:@"Start Game" forState:UIControlStateNormal];
    [startButton addTarget:self action:@selector(startGame:) forControlEvents:UIControlEventTouchUpInside];
    
     
    if (state != MCSessionStateConnecting) {
        // We'll just display all the connected peers (players) to the text view.
        NSString *allPlayers = @"Other players connected with:\n";
        
        for (int i = 0; i < self.appDelegate.mpcHandler.session.connectedPeers.count; i++) {
            NSString *displayName = [[self.appDelegate.mpcHandler.session.connectedPeers objectAtIndex:i] displayName];
            
            
            allPlayers = [allPlayers stringByAppendingString:displayName];
        }
        
        [self.tvPlayerList setText:allPlayers];
        [self.tvPlayerList setFont:[UIFont fontWithName:@"HelveticaNeue-Light" size:17]];
        [self.view addSubview:startButton];
        
    }
    /*
    if (state == MCSessionStateNotConnected){
        [startButton removeFromSuperview];
    }
    while (state != MCSessionStateNotConnected){
        [startButton removeFromSuperview];
    }
        
     */
    
}

-(void)startGame: (QBFlatButton*)button{
    if (!self.isGameRunning && self.appDelegate.mpcHandler.session.connectedPeers > 0  ) {
        UIAlertView *newGameAlert = [[UIAlertView alloc] initWithTitle:@"ChugIt"
                                                               message:@"Get Ready to Drink"
                                                              delegate:self
                                                     cancelButtonTitle:@"Cancel"
                                                     otherButtonTitles:@"Start Game", nil];
        [newGameAlert show];
        sleep(2);
        
    }else{
        [button removeFromSuperview];
    }

}

-(void)gameDisconnected: (QBFlatButton *)button{
    [button removeFromSuperview];
    
}

- (void)handleReceivedDataWithNotification:(NSNotification *)notification {
    
    NSDictionary *userInfoDict = [notification userInfo];
    NSData *receivedData = [userInfoDict objectForKey:@"data"];
    NSString *message = [[NSString alloc] initWithData:receivedData encoding:NSUTF8StringEncoding];
    
    
    
    if([message isEqualToString:@"New Game"]){
        [self.tabBarController setSelectedIndex:1];
        DrinkViewController *everyoneVC = [self.storyboard instantiateViewControllerWithIdentifier:@"DrinkViewController"];
        everyoneVC.modalPresentationStyle = UIModalPresentationCustom;
        self.animator = [[ZFModalTransitionAnimator alloc] initWithModalViewController:everyoneVC];
        self.animator.dragable = YES;
        self.animator.direction = ZFModalTransitonDirectionBottom;
        everyoneVC.transitioningDelegate = self.animator;
        [self presentViewController:everyoneVC animated:YES completion:nil];
       
        
        
    }
    
        /*
     MCPeerID *senderPeerID = [userInfoDict objectForKey:@"peerID"];
     NSString *senderDisplayName = senderPeerID.displayName;
     */
    
}


- (void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex
{
    if (buttonIndex == 0)
    {
        self.hasCreatedGame = NO;
        self.isGameRunning = NO;
    }
    else{
        
        NSString *messageToSend = @"New Game";
        NSData *messageAsData = [messageToSend dataUsingEncoding:NSUTF8StringEncoding];
        NSError *error;
        
        [self.appDelegate.mpcHandler.session sendData:messageAsData
                                              toPeers:self.appDelegate.mpcHandler.session.connectedPeers
                                             withMode:MCSessionSendDataReliable
                                                error:&error];
        
        [[AAAGamificationManager sharedManager] addToMainPlayerScore:1];
        
        DrinkViewController *everyoneVC = [self.storyboard instantiateViewControllerWithIdentifier:@"DrinkViewController"];
        everyoneVC.modalPresentationStyle = UIModalPresentationCustom;
        self.animator = [[ZFModalTransitionAnimator alloc] initWithModalViewController:everyoneVC];
        self.animator.dragable = YES;
        self.animator.direction = ZFModalTransitonDirectionBottom;
        everyoneVC.transitioningDelegate = self.animator;
        [self presentViewController:everyoneVC animated:YES completion:nil];

        
        //sleep(3);
        
        dispatch_async(dispatch_get_main_queue(), ^{
        NSString *message = @"Your Turn";
        int i = arc4random() % [[self.appDelegate.mpcHandler.session connectedPeers] count];
            NSArray *choice = [[NSArray alloc] initWithObjects:[[self.appDelegate.mpcHandler.session connectedPeers] objectAtIndex:i], nil];        
        NSData *messageAs = [message dataUsingEncoding:NSUTF8StringEncoding];
        NSError *err;
        
            
        
       
        
        [self.appDelegate.mpcHandler.session sendData:messageAs
                                              toPeers:choice
                                             withMode:MCSessionSendDataReliable
                                                error:&err];
         
        if (error != nil) {
            NSLog(@"help me%@", [error localizedDescription]);
            
        } else{
            self.hasCreatedGame = YES;
            self.isGameRunning = YES;
            
            
        }
        });
        
    }
    
}

@end
