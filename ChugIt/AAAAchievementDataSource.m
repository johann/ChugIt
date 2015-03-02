//
//  AAAAchievementDataSource.m
//  ChugIt
//
//  Created by Johann Kerr on 6/24/14.
//  Copyright (c) 2014 Johann Kerr. All rights reserved.
//

#import "AAAAchievementDataSource.h"
NSString *const kForestStarAchievementKey = @"forestStar";
NSString *const kPenguinAchievementKey = @"penguin";
NSString *const kFratStarAchievementKey = @"fratStar";
NSString *const kFirstCollegePartyKey = @"firstCollegeParty";
NSString *const takeAWaterBreakKey = @"takeawaterbreak";
NSString *const discombobulatedWreckKey = @"discombobulatedwreck";
NSString *const messFestKey = @"messfest";
NSString *const goHomeYourDrunkKey = @"gohomeyourdrunk";
NSString *const pukeAndRebootKey = @"pukeandreboot";
NSString *const chugOfShameKey = @"chugofshame";
NSString *const fratBoyStatusKey = @"fratboy";
NSString *const kegStandChampKey = @"kegstandchamp";
NSString *const beerBongChampKey = @"beerbongchamp";
NSString *const animalHouseKey = @"animalhouse";
NSString *const fullBlownAlcoholicKey = @"fullblownalcoholic";
NSString *const notMakingMeetingKey = @"notmakingmeeting";
NSString *const runALapKey = @"runalap";
NSString *const noDrivingKey = @"nodriving";
NSString *const drunkAsASkunkKey = @"drunkasaskunk";
NSString *const spillQueenKey = @"spillqueen";
NSString *const shitShowKey = @"shitshow";
NSString *const kFratGodAchievementKey = @"fratgod";
NSString *const kFratKingAchievementKey = @"fratking";
NSString *const kLightWeightKey = @"lightweight";
NSString *const irishKey = @"irish";
NSString *const kegKingKey = @"kegking";
NSString *const freshmenKey = @"freshmen";
NSString *const sophomoreKey = @"sophomore";
NSString *const juniorKey = @"junior";
NSString *const seniorKey = @"senior";

@implementation AAAAchievementDataSource

- (AAAAchievement *)achievementForKey:(NSString *)key
{
    if ([key isEqualToString:kForestStarAchievementKey]) {
        AAAAchievement *achievement = [[AAAAchievement alloc] initWithTitleText:NSLocalizedString(@"Drunk as a Skunk", @"") descriptionText:NSLocalizedString(@"You're drunk go home", @"") image:[UIImage imageNamed:@"meme5"]];
        return achievement;
        
    } else if ([key isEqualToString:kFratStarAchievementKey]) {
        AAAAchievement *achievement = [[AAAAchievement alloc] initWithTitleText:NSLocalizedString(@"Drunk as a Skunk", @"") descriptionText:NSLocalizedString(@"You're drunk go home", @"") image:[UIImage imageNamed:@"meme5"]];
        return achievement;
        
    } else if ([key isEqualToString:kFirstCollegePartyKey]) {
        AAAAchievement *achievement = [[AAAAchievement alloc] initWithTitleText:NSLocalizedString(@"Drunk as a Skunk", @"") descriptionText:NSLocalizedString(@"You're drunk go home", @"") image:[UIImage imageNamed:@"Hungover-Cat"]];
        return achievement;
        
    }else if ([key isEqualToString:takeAWaterBreakKey]) {
        AAAAchievement *achievement = [[AAAAchievement alloc] initWithTitleText:NSLocalizedString(@"Drunk as a Skunk", @"") descriptionText:NSLocalizedString(@"You're drunk go home", @"") image:[UIImage imageNamed:@"Hungover-Cat"]];
        return achievement;
        
    }else if ([key isEqualToString:discombobulatedWreckKey]) {
        AAAAchievement *achievement = [[AAAAchievement alloc] initWithTitleText:NSLocalizedString(@"Drunk as a Skunk", @"") descriptionText:NSLocalizedString(@"You're drunk go home", @"") image:[UIImage imageNamed:@"Hungover-Cat"]];
        return achievement;
        
    }else if ([key isEqualToString:messFestKey]) {
        AAAAchievement *achievement = [[AAAAchievement alloc] initWithTitleText:NSLocalizedString(@"Drunk as a Skunk", @"") descriptionText:NSLocalizedString(@"You're drunk go home", @"") image:[UIImage imageNamed:@"Hungover-Cat"]];
        return achievement;
        
    }else if ([key isEqualToString:goHomeYourDrunkKey]) {
        AAAAchievement *achievement = [[AAAAchievement alloc] initWithTitleText:NSLocalizedString(@"Drunk as a Skunk", @"") descriptionText:NSLocalizedString(@"You're drunk go home", @"") image:[UIImage imageNamed:@"Hungover-Cat"]];
        return achievement;
        
    }else if ([key isEqualToString:pukeAndRebootKey]) {
        AAAAchievement *achievement = [[AAAAchievement alloc] initWithTitleText:NSLocalizedString(@"Drunk as a Skunk", @"") descriptionText:NSLocalizedString(@"You're drunk go home", @"") image:[UIImage imageNamed:@"Hungover-Cat"]];
        return achievement;
        
    }else if ([key isEqualToString:chugOfShameKey]) {
        AAAAchievement *achievement = [[AAAAchievement alloc] initWithTitleText:NSLocalizedString(@"Drunk as a Skunk", @"") descriptionText:NSLocalizedString(@"You're drunk go home", @"") image:[UIImage imageNamed:@"Hungover-Cat"]];
        return achievement;
    }else if ([key isEqualToString:fratBoyStatusKey]){
        AAAAchievement *achievement = [[AAAAchievement alloc] initWithTitleText:NSLocalizedString(@"Drunk as a Skunk", @"") descriptionText:NSLocalizedString(@"You're drunk go home", @"") image:[UIImage imageNamed:@"Hungover-Cat"]];
        return achievement;
    }
    else if ([key isEqualToString:beerBongChampKey]){
        AAAAchievement *achievement = [[AAAAchievement alloc] initWithTitleText:NSLocalizedString(@"Drunk as a Skunk", @"") descriptionText:NSLocalizedString(@"You're drunk go home", @"") image:[UIImage imageNamed:@"Hungover-Cat"]];
        return achievement;
    }
    else if ([key isEqualToString:animalHouseKey]){
        AAAAchievement *achievement = [[AAAAchievement alloc] initWithTitleText:NSLocalizedString(@"Drunk as a Skunk", @"") descriptionText:NSLocalizedString(@"You're drunk go home", @"") image:[UIImage imageNamed:@"Hungover-Cat"]];
        return achievement;
    }
    else if ([key isEqualToString:fullBlownAlcoholicKey]){
        AAAAchievement *achievement = [[AAAAchievement alloc] initWithTitleText:NSLocalizedString(@"Drunk as a Skunk", @"") descriptionText:NSLocalizedString(@"You're drunk go home", @"") image:[UIImage imageNamed:@"Hungover-Cat"]];
        return achievement;
    }
    else if ([key isEqualToString:notMakingMeetingKey]){
        AAAAchievement *achievement = [[AAAAchievement alloc] initWithTitleText:NSLocalizedString(@"Drunk as a Skunk", @"") descriptionText:NSLocalizedString(@"You're drunk go home", @"") image:[UIImage imageNamed:@"Hungover-Cat"]];
        return achievement;
    }
    else if ([key isEqualToString:runALapKey]){
        AAAAchievement *achievement = [[AAAAchievement alloc] initWithTitleText:NSLocalizedString(@"Drunk as a Skunk", @"") descriptionText:NSLocalizedString(@"You're drunk go home", @"") image:[UIImage imageNamed:@"Hungover-Cat"]];
        return achievement;
    }
    else if ([key isEqualToString:noDrivingKey]){
        AAAAchievement *achievement = [[AAAAchievement alloc] initWithTitleText:NSLocalizedString(@"Drunk as a Skunk", @"") descriptionText:NSLocalizedString(@"You're drunk go home", @"") image:[UIImage imageNamed:@"Hungover-Cat"]];
        return achievement;
    }
    else if ([key isEqualToString:drunkAsASkunkKey]){
        AAAAchievement *achievement = [[AAAAchievement alloc] initWithTitleText:NSLocalizedString(@"Drunk as a Skunk", @"") descriptionText:NSLocalizedString(@"You're drunk go home", @"") image:[UIImage imageNamed:@"Hungover-Cat"]];
        return achievement;
    }
    else if ([key isEqualToString:spillQueenKey]){
        AAAAchievement *achievement = [[AAAAchievement alloc] initWithTitleText:NSLocalizedString(@"Drunk as a Skunk", @"") descriptionText:NSLocalizedString(@"You're drunk go home", @"") image:[UIImage imageNamed:@"Hungover-Cat"]];
        return achievement;
    }
    else if ([key isEqualToString:kFratGodAchievementKey]){
        AAAAchievement *achievement = [[AAAAchievement alloc] initWithTitleText:NSLocalizedString(@"Drunk as a Skunk", @"") descriptionText:NSLocalizedString(@"You're drunk go home", @"") image:[UIImage imageNamed:@"meme12.jpg"]];
        return achievement;
    }
    else if ([key isEqualToString:kFratKingAchievementKey]){
        AAAAchievement *achievement = [[AAAAchievement alloc] initWithTitleText:NSLocalizedString(@"Drunk as a Skunk", @"") descriptionText:NSLocalizedString(@"You're drunk go home", @"") image:[UIImage imageNamed:@"meme5 "]];
        return achievement;
    }
    else if ([key isEqualToString:kLightWeightKey]){
        AAAAchievement *achievement = [[AAAAchievement alloc] initWithTitleText:NSLocalizedString(@"Drunk as a Skunk", @"") descriptionText:NSLocalizedString(@"You're drunk go home", @"") image:[UIImage imageNamed:@"Hungover-Cat"]];
        return achievement;
    }
    else if ([key isEqualToString:irishKey]){
        AAAAchievement *achievement = [[AAAAchievement alloc] initWithTitleText:NSLocalizedString(@"Drunk as a Skunk", @"") descriptionText:NSLocalizedString(@"You're drunk go home", @"") image:[UIImage imageNamed:@"Hungover-Cat"]];
        return achievement;
    }
    else if ([key isEqualToString:kegKingKey]){
        AAAAchievement *achievement = [[AAAAchievement alloc] initWithTitleText:NSLocalizedString(@"Drunk as a Skunk", @"") descriptionText:NSLocalizedString(@"You're drunk go home", @"") image:[UIImage imageNamed:@"Hungover-Cat"]];
        return achievement;
    }
    else if ([key isEqualToString:freshmenKey]){
        AAAAchievement *achievement = [[AAAAchievement alloc] initWithTitleText:NSLocalizedString(@"Drunk as a Skunk", @"") descriptionText:NSLocalizedString(@"You're drunk go home", @"") image:[UIImage imageNamed:@"Hungover-Cat"]];
        return achievement;
    }
    else if ([key isEqualToString:sophomoreKey]){
        AAAAchievement *achievement = [[AAAAchievement alloc] initWithTitleText:NSLocalizedString(@"Drunk as a Skunk", @"") descriptionText:NSLocalizedString(@"You're drunk go home", @"") image:[UIImage imageNamed:@"Hungover-Cat"]];
        return achievement;
    }
    else if ([key isEqualToString:juniorKey]){
        AAAAchievement *achievement = [[AAAAchievement alloc] initWithTitleText:NSLocalizedString(@"Drunk as a Skunk", @"") descriptionText:NSLocalizedString(@"You're drunk go home", @"") image:[UIImage imageNamed:@"Hungover-Cat"]];
        return achievement;
    }
    else if ([key isEqualToString:seniorKey]){
        AAAAchievement *achievement = [[AAAAchievement alloc] initWithTitleText:NSLocalizedString(@"Drunk as a Skunk", @"") descriptionText:NSLocalizedString(@"You're drunk go home", @"") image:[UIImage imageNamed:@"Hungover-Cat"]];
        return achievement;
    }
    
    return nil;
}


@end
