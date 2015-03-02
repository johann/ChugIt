//
//  ChooseGameViewController.m
//  ChugIt
//
//  Created by Johann Kerr on 6/24/14.
//  Copyright (c) 2014 Johann Kerr. All rights reserved.
//

#import "ChooseGameViewController.h"
#import "ZFModalTransitionAnimator.h"
#import "AllGirlsViewController.h"
#import "AllGuysViewController.h"
#import "ChooseGameViewController.h"
#import "DrinkViewController.h"
#import "EveryoneViewController.h"
#import "PickViewController.h"
#import "AppDelegate.h"
@interface ChooseGameViewController ()
@property (nonatomic, strong) AppDelegate *appDelegate;
@property (nonatomic, strong) ZFModalTransitionAnimator *animator;
@end

@implementation ChooseGameViewController

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
     self.appDelegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
    //RNLongPressGestureRecognizer *longPress = [[RNLongPressGestureRecognizer alloc] initWithTarget:self action:@selector(handleLongPress:)];
    //[self.view addGestureRecognizer:longPress];
    [self showGridWithHeaderFromPoint];
    
    //[self performSelector:@selector(hideController) withObject:nil afterDelay:2.0];
    
}
//
//- (void)handleLongPress:(UILongPressGestureRecognizer *)longPress {
//    if (longPress.state == UIGestureRecognizerStateBegan) {
//        [self showGridWithHeaderFromPoint];
//        [longPress locationInView:self.view];
//    }
//}

- (void)gridMenu:(RNGridMenu *)gridMenu willDismissWithSelectedItem:(RNGridMenuItem *)item atIndex:(NSInteger)itemIndex {
    switch (itemIndex) {
        case 1:{
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
                
            }

            [self performSelector:@selector(hideController) withObject:nil afterDelay:3.0];
            break;
        }
        
        case 3:{
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
                
                //[[AAAGamificationManager sharedManager] addToMainPlayerScore:1];
            }
            [self performSelector:@selector(hideController) withObject:nil afterDelay:2.0];
            break;
        }
        case 4:{
            DrinkViewController *everyoneVC = [self.storyboard instantiateViewControllerWithIdentifier:@"DrinkViewController"];
            everyoneVC.modalPresentationStyle = UIModalPresentationCustom;
            self.animator = [[ZFModalTransitionAnimator alloc] initWithModalViewController:everyoneVC];
            self.animator.dragable = YES;
            self.animator.direction = ZFModalTransitonDirectionBottom;
            everyoneVC.transitioningDelegate = self.animator;
            [self presentViewController:everyoneVC animated:YES completion:nil];
            [self performSelector:@selector(hideController) withObject:nil afterDelay:2.0];
            break;
        }
        
        case 5:{
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
            }

            [self performSelector:@selector(hideController) withObject:nil afterDelay:2.0];
            break;
        }
        case 7:{
            PickViewController *pickVC = [self.storyboard instantiateViewControllerWithIdentifier:@"PickViewController"];
            pickVC.modalPresentationStyle = UIModalPresentationCustom;
            self.animator = [[ZFModalTransitionAnimator alloc] initWithModalViewController:pickVC];
            self.animator.dragable = YES;
            self.animator.direction = ZFModalTransitonDirectionBottom;
            pickVC.transitioningDelegate = self.animator;
            [self presentViewController:pickVC animated:YES completion:nil];
            break;
        }
            
        
        
        default:
            break;
            
    }
    NSLog(@"Dismissed with item %d: %@", itemIndex, item.title);
    
}



- (void)showGridWithHeaderFromPoint{
    NSInteger numberOfOptions = 9;
    NSArray *items = @[
                       [RNGridMenuItem emptyItem],
                       [[RNGridMenuItem alloc] initWithImage:[UIImage imageNamed:@"e"] title:@"Random"],
                       [RNGridMenuItem emptyItem],
                       [[RNGridMenuItem alloc] initWithImage:[UIImage imageNamed:@"c"] title:@"Guys"],
                       [[RNGridMenuItem alloc] initWithImage:[UIImage imageNamed:@"d"] title:@"Everyone"],
                       [[RNGridMenuItem alloc] initWithImage:[UIImage imageNamed:@"b"] title:@"Girls"],
                       [RNGridMenuItem emptyItem],
                       [[RNGridMenuItem alloc] initWithImage:[UIImage imageNamed:@"a"] title:@"Pick Player"],
                       [RNGridMenuItem emptyItem]
                       ];
    
    RNGridMenu *av = [[RNGridMenu alloc] initWithItems:[items subarrayWithRange:NSMakeRange(0, numberOfOptions)]];
    av.delegate = self;
    av.bounces = NO;
    av.animationDuration = 0.2;
    //av.blurExclusionPath = [UIBezierPath bezierPathWithOvalInRect:self.imageView.frame];
    av.backgroundPath = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(0.f, 0.f, av.itemSize.width*3, av.itemSize.height*3)];
    
    UILabel *header = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 0, 44)];
    header.text = @"Example Header";
    header.font = [UIFont boldSystemFontOfSize:18];
    header.backgroundColor = [UIColor clearColor];
    header.textColor = [UIColor whiteColor];
    header.textAlignment = NSTextAlignmentCenter;
    //av.headerView = header;
    [av showInViewController:self center:CGPointMake(self.view.bounds.size.width/2.f, self.view.bounds.size.height/2.f)];
    //[av showInViewController:self center:point];
}


-(void)hideController{
    if (![[self presentedViewController] isBeingDismissed])
    {
        [self dismissViewControllerAnimated:YES completion:nil];
    }
}

@end
