//
//  ConnectionViewController.h
//  ChugIt
//
//  Created by Johann Kerr on 6/23/14.
//  Copyright (c) 2014 Johann Kerr. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MultipeerConnectivity/MultipeerConnectivity.h>
#import "QBFlatButton.h"
@interface ConnectionViewController : UIViewController<MCBrowserViewControllerDelegate, UITextFieldDelegate>


@property (weak, nonatomic) IBOutlet UITextField *txtPlayerName;
//@property (weak, nonatomic) IBOutlet UISwitch *swVisible;
@property (weak, nonatomic) IBOutlet UITextView *tvPlayerList;
//@property (weak, nonatomic) IBOutlet UIButton *startBtn;

//- (IBAction)toggle:(id)sender;
- (IBAction)search:(id)sender;
- (IBAction)dis:(id)sender; 
//- (IBAction)start:(UIButton *)sender;


@end
