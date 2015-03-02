//
//  TestViewController.h
//  ChugIt
//
//  Created by Johann Kerr on 6/27/14.
//  Copyright (c) 2014 Johann Kerr. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EAIntroView.h"
#import <MultipeerConnectivity/MultipeerConnectivity.h>
@interface TestViewController : UIViewController <EAIntroDelegate>




- (IBAction)everyoneBtn:(UIButton *)sender;

- (IBAction)guysBtn:(UIButton *)sender;
- (IBAction)girlsBtn:(UIButton *)sender;

- (IBAction)drinkBtn:(UIButton *)sender;
- (IBAction)pickBtn:(id)sender;

- (IBAction)achievements:(UIButton *)sender;
- (IBAction)choosePlayer:(UIButton *)sender;

@end
