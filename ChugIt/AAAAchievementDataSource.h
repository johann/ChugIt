//
//  AAAAchievementDataSource.h
//  ChugIt
//
//  Created by Johann Kerr on 6/24/14.
//  Copyright (c) 2014 Johann Kerr. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AAAAchievementManager.h"
/*
 
 “First College Party?”
 “Take a Water Break”
 Discombobulated Wreck”
 “Mess Fest”
 “Go Home, Your Drunk”
 “Puke & Reboot”
 “The Chug of Shame”
 “Frat Boy/Sorority Girl Status”
 “Keg-stand Champ”
 “Beer-Bong Extraordinaire”
 “ANIMAL HOUSE”
 “Full Blown Alcoholic”
 “Not making that 9am meeting tomorrow”
 “Run a lap”
 “Officially ineligible to drive”
 “Drunk as a skunk”
 “Spill Queen/Spill King”
 “Shit Show Forshow”
 */

extern NSString *const kForestStarAchievementKey;
extern NSString *const kPenguinAchievementKey;
extern NSString *const kFirstCollegePartyKey;
extern NSString *const takeAWaterBreakKey;
extern NSString *const discombobulatedWreckKey;
extern NSString *const messFestKey;
extern NSString *const goHomeYourDrunkKey;
extern NSString *const pukeAndRebootKey;
extern NSString *const chugOfShameKey;
extern NSString *const fratBoyStatusKey;
extern NSString *const kegStandChampKey;
extern NSString *const beerBongChampKey;
extern NSString *const animalHouseKey;
extern NSString *const fullBlownAlcoholicKey;
extern NSString *const notMakingMeetingKey;
extern NSString *const runALapKey;
extern NSString *const noDrivingKey;
extern NSString *const drunkAsASkunkKey;
extern NSString *const spillQueenKey;
extern NSString *const shitShowKey;
extern NSString *const kFratStarAchievementKey;
extern NSString *const kFratGodAchievementKey;
extern NSString *const kFratKingAchievementKey;
extern NSString *const kLightWeightKey;
extern NSString *const irishKey;
extern NSString *const kegKingKey;
extern NSString *const freshmenKey;
extern NSString *const sophomoreKey;
extern NSString *const juniorKey;
extern NSString *const seniorKey;

@interface AAAAchievementDataSource : NSObject<AAAAchievementManagerDataSource>

@end
