//
//  GameViewController.h
//  ChugIt
//
//  Created by Johann Kerr on 6/23/14.
//  Copyright (c) 2014 Johann Kerr. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MultipeerConnectivity/MultipeerConnectivity.h>
#import "EAIntroView.h"


@interface GameViewController : UIViewController <UIAlertViewDelegate,UITextFieldDelegate, EAIntroDelegate>
//@property (weak, nonatomic) IBOutlet UITextView *history;
- (IBAction)newGame:(UIButton *)sender;
//- (IBAction)endGame:(UIButton *)sender;

@end
