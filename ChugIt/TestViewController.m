//
//  TestViewController.m
//  ChugIt
//
//  Created by Johann Kerr on 6/27/14.
//  Copyright (c) 2014 Johann Kerr. All rights reserved.
//

#import "TestViewController.h"
#import <QuartzCore/QuartzCore.h>
#import "ZFModalTransitionAnimator.h"
#import "AllGirlsViewController.h"
#import "AllGuysViewController.h"
#import "ChooseGameViewController.h"
#import "DrinkViewController.h"
#import "EveryoneViewController.h"
#import "AAAAchievementDataSource.h"
#import "AAAAchievementManager.h"
#import "AAAGamificationManager.h"
#import "AppDelegate.h"
#import "PickViewController.h"


@interface TestViewController ()
@property (nonatomic, strong) ZFModalTransitionAnimator *animator;
@property (strong, nonatomic) AppDelegate *appDelegate;

@end

@implementation TestViewController

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
    [AAAAchievementManager sharedManager].dataSource = [[AAAAchievementDataSource alloc] init];
    
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(handleReceivedDataWithNotification:)
                                                 name:@"MPCDemo_DidChangeStateNotification"
                                               object:nil];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)handleReceivedDataWithNotification:(NSNotification *)notification {
    
    NSDictionary *userInfoDict = [notification userInfo];
    NSData *receivedData = [userInfoDict objectForKey:@"data"];
    NSString *message = [[NSString alloc] initWithData:receivedData encoding:NSUTF8StringEncoding];
    
    
    
    if([message isEqualToString:@"Your Turn"]){
        UIAlertView *newGameAlert = [[UIAlertView alloc] initWithTitle:@"Chug.ly"
                                                               message:@"Get Ready to Drink"
                                                              delegate:self
                                                     cancelButtonTitle:@"Cancel"
                                                     otherButtonTitles:@"Start Game", nil];
        [newGameAlert show];
        
        
        
    }
    /*
     MCPeerID *senderPeerID = [userInfoDict objectForKey:@"peerID"];
     NSString *senderDisplayName = senderPeerID.displayName;
     */
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)everyoneBtn:(UIButton *)sender {
    EveryoneViewController *everyoneVC = [self.storyboard instantiateViewControllerWithIdentifier:@"EveryoneViewController"];
    everyoneVC.modalPresentationStyle = UIModalPresentationCustom;
    self.animator = [[ZFModalTransitionAnimator alloc] initWithModalViewController:everyoneVC];
    self.animator.dragable = YES;
    self.animator.direction = ZFModalTransitonDirectionBottom;
    everyoneVC.transitioningDelegate = self.animator;
    [self presentViewController:everyoneVC animated:YES completion:nil];
}

- (IBAction)guysBtn:(UIButton *)sender {
    AllGuysViewController* allGuysVC = [self.storyboard instantiateViewControllerWithIdentifier:@"AllGuysViewController"];
    allGuysVC.modalPresentationStyle = UIModalPresentationCustom;
    self.animator = [[ZFModalTransitionAnimator alloc] initWithModalViewController:allGuysVC];
    self.animator.dragable = YES;
    self.animator.direction = ZFModalTransitonDirectionLeft;
    allGuysVC.transitioningDelegate = self.animator;
    [self presentViewController:allGuysVC animated:YES completion:nil];
}

- (IBAction)girlsBtn:(UIButton *)sender {
    AllGirlsViewController* allGirlsVC = [self.storyboard instantiateViewControllerWithIdentifier:@"AllGirlsViewController"];
    allGirlsVC.modalPresentationStyle = UIModalPresentationCustom;
    self.animator = [[ZFModalTransitionAnimator alloc] initWithModalViewController:allGirlsVC];
    self.animator.dragable = YES;
    self.animator.direction = ZFModalTransitonDirectionRight;
    allGirlsVC.transitioningDelegate = self.animator;
    [self presentViewController:allGirlsVC animated:YES completion:nil];

}

- (IBAction)drinkBtn:(UIButton *)sender {
    DrinkViewController* drinkVC = [self.storyboard instantiateViewControllerWithIdentifier:@"DrinkViewController"];
    drinkVC.modalPresentationStyle = UIModalPresentationCustom;
    self.animator = [[ZFModalTransitionAnimator alloc] initWithModalViewController:drinkVC];
    self.animator.dragable = YES;
    self.animator.direction = ZFModalTransitonDirectionRight;
    drinkVC.transitioningDelegate = self.animator;
    [self presentViewController:drinkVC animated:YES completion:nil];

}

- (IBAction)pickBtn:(id)sender {
    ChooseGameViewController* chooseVC = [self.storyboard instantiateViewControllerWithIdentifier:@"ChooseGameViewController"];
    chooseVC.modalPresentationStyle = UIModalPresentationCustom;
    self.animator = [[ZFModalTransitionAnimator alloc] initWithModalViewController:chooseVC];
    self.animator.dragable = YES;
    self.animator.direction = ZFModalTransitonDirectionRight;
    chooseVC.transitioningDelegate = self.animator;
    [self presentViewController:chooseVC animated:YES completion:nil];
}

- (IBAction)achievements:(UIButton *)sender {
    [[AAAAchievementManager sharedManager] showAchievementViewControllerOnViewController:self achievementKey:kFratGodAchievementKey];
   
}

- (IBAction)choosePlayer:(UIButton *)sender {
    PickViewController *pickVC = [self.storyboard instantiateViewControllerWithIdentifier:@"PickViewController"];
    pickVC.modalPresentationStyle = UIModalPresentationCustom;
    self.animator = [[ZFModalTransitionAnimator alloc] initWithModalViewController:pickVC];
    self.animator.dragable = YES;
    self.animator.direction = ZFModalTransitonDirectionBottom;
    pickVC.transitioningDelegate = self.animator;
    [self presentViewController:pickVC animated:YES completion:nil];
}
@end
