//
//  AppDelegate.h
//  ChugIt
//
//  Created by Johann Kerr on 6/23/14.
//  Copyright (c) 2014 Johann Kerr. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MPCHandler.h"



@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (nonatomic, strong) MPCHandler *mpcHandler;
@property (nonatomic) BOOL hasCreatedGame;
@property (nonatomic) BOOL isGameRunning;



@end

