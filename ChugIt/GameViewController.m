//
//  GameViewController.m
//  ChugIt
//
//  Created by Johann Kerr on 6/23/14.
//  Copyright (c) 2014 Johann Kerr. All rights reserved.
//

#import "GameViewController.h"
#import "AAAAchievementDataSource.h"
#import "AAAAchievementManager.h"
#import "AAAGamificationManager.h"
#import "AppDelegate.h"
#import "RNGridMenu.h"
#import "SMPageControl.h"
#import <QuartzCore/QuartzCore.h>



// -------------------------------------- //
#import "ZFModalTransitionAnimator.h"
#import "AllGirlsViewController.h"
#import "AllGuysViewController.h"
#import "ChooseGameViewController.h"
#import "DrinkViewController.h"
#import "EveryoneViewController.h"
#import "PickViewController.h"

// --------------------------------------//

#import "QBFlatButton.h"


static NSString * const sampleDescription1 = @"Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.";
static NSString * const sampleDescription2 = @"Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore.";
static NSString * const sampleDescription3 = @"Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem.";
static NSString * const sampleDescription4 = @"Nam libero tempore, cum soluta nobis est eligendi optio cumque nihil impedit.";

@interface GameViewController (){
    UIView *rootView;
}
@property (weak, nonatomic) IBOutlet AAAScoreView *scoreView;
@property (nonatomic, strong) AppDelegate *appDelegate;
//@property (weak, nonatomic) IBOutlet UILabel *numDrinks;
//@property (weak, nonatomic) IBOutlet UILabel *lvlLabel;
@property (nonatomic, strong) ZFModalTransitionAnimator *animator;



@end

@implementation GameViewController



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
    rootView = self.navigationController.view;
   
    [AAAAchievementManager sharedManager].dataSource = [[AAAAchievementDataSource alloc] init];
    [[AAAGamificationManager sharedManager] setMainPlayersScore:0];
    [[AAAGamificationManager sharedManager] setScoreView:self.scoreView];
    
    
    self.appDelegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
    [self.appDelegate.mpcHandler setupPeerWithDisplayName:[UIDevice currentDevice].name];
    [self.appDelegate.mpcHandler setupSession];
    [self.appDelegate.mpcHandler advertiseSelf:YES];
    
    [[QBFlatButton appearance] setSurfaceColor:[UIColor colorWithWhite:0.75 alpha:1.0] forState:UIControlStateDisabled];
    [[QBFlatButton appearance] setSideColor:[UIColor colorWithWhite:0.55 alpha:1.0] forState:UIControlStateDisabled];
    
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(handleReceivedDataWithNotification:)
                                                 name:@"MPCDemo_DidReceiveDataNotification"
                                               object:nil];
    
    
    
    
}



- (void)handleReceivedDataWithNotification:(NSNotification *)notification {
    
    NSDictionary *userInfoDict = [notification userInfo];
    NSData *receivedData = [userInfoDict objectForKey:@"data"];
    NSString *message = [[NSString alloc] initWithData:receivedData encoding:NSUTF8StringEncoding];
    /*
     MCPeerID *senderPeerID = [userInfoDict objectForKey:@"peerID"];
     NSString *senderDisplayName = senderPeerID.displayName;
     */
    
    if([message isEqualToString:@"Your Turn"]){
        QBFlatButton *chugButton = [QBFlatButton buttonWithType:UIButtonTypeCustom];
        chugButton.frame = CGRectMake(60, 370, 200, 60);
        
        chugButton.surfaceColor = [UIColor colorWithRed:243.0/255.0 green:152.0/255.0 blue:0 alpha:1.0];
        chugButton.sideColor = [UIColor colorWithRed:170.0/255.0 green:105.0/255.0 blue:0 alpha:1.0];
        
        chugButton.cornerRadius = 6.0;
        chugButton.height = 3.0;
        chugButton.depth = 3.0;
        
        chugButton.titleLabel.font = [UIFont boldSystemFontOfSize:16];
        [chugButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [chugButton setTitle:@"ChugIt" forState:UIControlStateNormal];
        [chugButton addTarget:self action:@selector(playGame:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:chugButton];
        
    }
    if([message isEqualToString:@"New Game"]){
        [self.tabBarController setSelectedIndex:1];
        [[AAAGamificationManager sharedManager] addToMainPlayerScore:1];
        
        DrinkViewController *everyoneVC = [self.storyboard instantiateViewControllerWithIdentifier:@"DrinkViewController"];
        everyoneVC.modalPresentationStyle = UIModalPresentationCustom;
        self.animator = [[ZFModalTransitionAnimator alloc] initWithModalViewController:everyoneVC];
        self.animator.dragable = YES;
        self.animator.direction = ZFModalTransitonDirectionBottom;
        everyoneVC.transitioningDelegate = self.animator;
        [self presentViewController:everyoneVC animated:YES completion:nil];

        
        
    }
    if([message isEqualToString:@"everyone"]){

        [[AAAGamificationManager sharedManager] addToMainPlayerScore:1];
       DrinkViewController *everyoneVC = [self.storyboard instantiateViewControllerWithIdentifier:@"DrinkViewController"];
        everyoneVC.modalPresentationStyle = UIModalPresentationCustom;
        self.animator = [[ZFModalTransitionAnimator alloc] initWithModalViewController:everyoneVC];
        self.animator.dragable = YES;
        self.animator.direction = ZFModalTransitonDirectionBottom;
        everyoneVC.transitioningDelegate = self.animator;
        [self presentViewController:everyoneVC animated:YES completion:nil];
//
        
    }
    if([message isEqualToString:@"guys"]){
        [[AAAGamificationManager sharedManager] addToMainPlayerScore:1];
                AllGuysViewController* allGuysVC = [self.storyboard instantiateViewControllerWithIdentifier:@"AllGuysViewController"];
        allGuysVC.modalPresentationStyle = UIModalPresentationCustom;
        self.animator = [[ZFModalTransitionAnimator alloc] initWithModalViewController:allGuysVC];
        self.animator.dragable = YES;
        self.animator.direction = ZFModalTransitonDirectionLeft;
        allGuysVC.transitioningDelegate = self.animator;
        [self presentViewController:allGuysVC animated:YES completion:nil];
        
    }
    if([message isEqualToString:@"girls"]){
        [[AAAGamificationManager sharedManager] addToMainPlayerScore:1];
        AllGirlsViewController* allGirlsVC = [self.storyboard instantiateViewControllerWithIdentifier:@"AllGirlsViewController"];
        allGirlsVC.modalPresentationStyle = UIModalPresentationCustom;
        self.animator = [[ZFModalTransitionAnimator alloc] initWithModalViewController:allGirlsVC];
        self.animator.dragable = YES;
        self.animator.direction = ZFModalTransitonDirectionRight;
        allGirlsVC.transitioningDelegate = self.animator;
        [self presentViewController:allGirlsVC animated:YES completion:nil];
    }
    if([message isEqualToString:@"drink"]){
        [[AAAGamificationManager sharedManager] addToMainPlayerScore:1];
        DrinkViewController *everyoneVC = [self.storyboard instantiateViewControllerWithIdentifier:@"DrinkViewController"];
        everyoneVC.modalPresentationStyle = UIModalPresentationCustom;
        self.animator = [[ZFModalTransitionAnimator alloc] initWithModalViewController:everyoneVC];
        self.animator.dragable = YES;
        self.animator.direction = ZFModalTransitonDirectionBottom;
        everyoneVC.transitioningDelegate = self.animator;
        [self presentViewController:everyoneVC animated:YES completion:nil];
        
    }
}
-(void)allDrink{
    NSString *messageToSend = @"everyone";
    NSData *messageAsData = [messageToSend dataUsingEncoding:NSUTF8StringEncoding];
    NSError *error;
    
    [self.appDelegate.mpcHandler.session sendData:messageAsData
                                          toPeers:self.appDelegate.mpcHandler.session.connectedPeers
                                         withMode:MCSessionSendDataReliable
                                            error:&error];
    if (error != nil) {
        NSLog(@"%@", [error localizedDescription]);
    } else{
         NSLog(@"works!!!!");
        DrinkViewController *everyoneVC = [self.storyboard instantiateViewControllerWithIdentifier:@"DrinkViewController"];
        everyoneVC.modalPresentationStyle = UIModalPresentationCustom;
        self.animator = [[ZFModalTransitionAnimator alloc] initWithModalViewController:everyoneVC];
        self.animator.dragable = YES;
        self.animator.direction = ZFModalTransitonDirectionBottom;
        everyoneVC.transitioningDelegate = self.animator;
        [self presentViewController:everyoneVC animated:YES completion:nil];
        [[AAAGamificationManager sharedManager] addToMainPlayerScore:1];
    }
    
}
-(void)allGirlsDrink{
    NSString *messageToSend = @"girls";
    NSData *messageAsData = [messageToSend dataUsingEncoding:NSUTF8StringEncoding];
    NSError *error;
    
    [self.appDelegate.mpcHandler.session sendData:messageAsData
                                          toPeers:self.appDelegate.mpcHandler.session.connectedPeers
                                         withMode:MCSessionSendDataReliable
                                            error:&error];
    if (error != nil) {
        NSLog(@"%@", [error localizedDescription]);
    } else{
        NSLog(@"Women!!!!");
        AllGirlsViewController* allGirlsVC = [self.storyboard instantiateViewControllerWithIdentifier:@"AllGirlsViewController"];
        allGirlsVC.modalPresentationStyle = UIModalPresentationCustom;
        self.animator = [[ZFModalTransitionAnimator alloc] initWithModalViewController:allGirlsVC];
        self.animator.dragable = YES;
        self.animator.direction = ZFModalTransitonDirectionRight;
        allGirlsVC.transitioningDelegate = self.animator;
        [self presentViewController:allGirlsVC animated:YES completion:nil];
        
        
        [[AAAGamificationManager sharedManager] addToMainPlayerScore:1];
    }
    
}
-(void)allGuysDrink{
    NSString *messageToSend = @"guys";
    NSData *messageAsData = [messageToSend dataUsingEncoding:NSUTF8StringEncoding];
    NSError *error;
    
    [self.appDelegate.mpcHandler.session sendData:messageAsData
                                          toPeers:self.appDelegate.mpcHandler.session.connectedPeers
                                         withMode:MCSessionSendDataReliable
                                            error:&error];
    if (error != nil) {
        NSLog(@"%@", [error localizedDescription]);
    } else{
        NSLog(@"Men!!!!");
        AllGuysViewController* allGuysVC = [self.storyboard instantiateViewControllerWithIdentifier:@"AllGuysViewController"];
        allGuysVC.modalPresentationStyle = UIModalPresentationCustom;
        self.animator = [[ZFModalTransitionAnimator alloc] initWithModalViewController:allGuysVC];
        self.animator.dragable = YES;
        self.animator.direction = ZFModalTransitonDirectionLeft;
        allGuysVC.transitioningDelegate = self.animator;
        [self presentViewController:allGuysVC animated:YES completion:nil];
        
        [[AAAGamificationManager sharedManager] addToMainPlayerScore:1];
    }
    
}
-(void)pickPlayer{
    PickViewController *pickVC = [self.storyboard instantiateViewControllerWithIdentifier:@"PickViewController"];
    pickVC.modalPresentationStyle = UIModalPresentationCustom;
    self.animator = [[ZFModalTransitionAnimator alloc] initWithModalViewController:pickVC];
    self.animator.dragable = YES;
    self.animator.direction = ZFModalTransitonDirectionBottom;
    pickVC.transitioningDelegate = self.animator;
    [self presentViewController:pickVC animated:YES completion:nil];
    [self nextTurn];
}
-(void)chooseGame{
    ChooseGameViewController* chooseVC = [self.storyboard instantiateViewControllerWithIdentifier:@"ChooseGameViewController"];
    chooseVC.modalPresentationStyle = UIModalPresentationCustom;
    self.animator = [[ZFModalTransitionAnimator alloc] initWithModalViewController:chooseVC];
    self.animator.dragable = YES;
    self.animator.direction = ZFModalTransitonDirectionRight;
    chooseVC.transitioningDelegate = self.animator;
    [self presentViewController:chooseVC animated:YES completion:nil];
    [self nextTurn];
}
-(void)randomThree{
    int i = arc4random() % [[self.appDelegate.mpcHandler.session connectedPeers] count];
    int j = arc4random() % [[self.appDelegate.mpcHandler.session connectedPeers] count];
    int k = arc4random() % [[self.appDelegate.mpcHandler.session connectedPeers] count];
    NSArray *choice = [[NSArray alloc] initWithObjects:[[self.appDelegate.mpcHandler.session connectedPeers] objectAtIndex:i],[[self.appDelegate.mpcHandler.session connectedPeers] objectAtIndex:j],[[self.appDelegate.mpcHandler.session connectedPeers] objectAtIndex:k], nil];
    NSString *message = @"drink";
    NSData *messageAsData = [message dataUsingEncoding:NSUTF8StringEncoding];
    NSError *error;
    [self.appDelegate.mpcHandler.session sendData:messageAsData toPeers:choice withMode:MCSessionSendDataReliable error:&error];
    
    if (error != nil) {
        NSLog(@"help me%@", [error localizedDescription]);
    }else{
        
    }

    
}

-(void)triviaGame{
    
    
}
-(void)neverHaveIEver{
    
}
-(void)nextTurn{
    
    if ([[self.appDelegate.mpcHandler.session connectedPeers] count]>0){
       
            NSString *message = @"Your Turn";
            int i = arc4random() % [[self.appDelegate.mpcHandler.session connectedPeers] count];
            NSArray *choice = [[NSArray alloc] initWithObjects:[[self.appDelegate.mpcHandler.session connectedPeers] objectAtIndex:i], nil];
            
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
       

    }
    else {
        UIAlertView *errorAlert = [[UIAlertView alloc] initWithTitle:@"ChugIt"
                                                             message:@"Connect with other players first!!!! "
                                                            delegate:self
                                                   cancelButtonTitle:nil
                                                   otherButtonTitles:@"Okay", nil];
        
        [errorAlert show];
        
    }
}
-(void)playGame:(QBFlatButton*)button{
    int j = arc4random() % 5;
    j++;
    switch (j) {
        case 1:
            [self allDrink];
            [self nextTurn];
            break;
        case 2:
            [self allGirlsDrink];
            [self nextTurn];
            break;
        case 3:
            [self allGuysDrink];
            [self nextTurn];
            break;
        case 4:
            [self chooseGame];
            break;
        case 5:
            [self pickPlayer];
            break;
        default:
            [self allDrink];
            break;
    }
    [button removeFromSuperview];
    
    
    
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    
}
- (IBAction)newGame:(UIButton *)sender {
    [self.tabBarController setSelectedIndex:2];
}



- (IBAction)endGame:(UIButton *)sender {
    [self.appDelegate.mpcHandler.session disconnect];

}

-(void)showIntro{
    EAIntroPage *page1 = [EAIntroPage page];
    page1.title = @"Hello world";
    page1.desc = sampleDescription1;
    page1.bgImage = [UIImage imageNamed:@"bg1"];
    page1.titleIconView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"title1"]];
    
    EAIntroPage *page2 = [EAIntroPage page];
    page2.title = @"This is page 2";
    page2.desc = sampleDescription2;
    page2.bgImage = [UIImage imageNamed:@"bg2"];
    page2.titleIconView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"title2"]];
    
    EAIntroPage *page3 = [EAIntroPage page];
    page3.title = @"This is page 3";
    page3.desc = sampleDescription3;
    page3.bgImage = [UIImage imageNamed:@"bg3"];
    page3.titleIconView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"title3"]];
    
    EAIntroPage *page4 = [EAIntroPage page];
    page4.title = @"This is page 4";
    page4.desc = sampleDescription4;
    page4.bgImage = [UIImage imageNamed:@"bg4"];
    page4.titleIconView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"title4"]];
    
    EAIntroView *intro = [[EAIntroView alloc] initWithFrame:rootView.bounds andPages:@[page1,page2,page3,page4]];
    [intro setDelegate:self];
    [intro showInView:rootView animateDuration:0.3];

    
}
@end
