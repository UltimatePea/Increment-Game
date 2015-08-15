//
//  GameConfigurationObject.m
//  Chinese Traditional Gaming
//
//  Created by Chen Zhibo on 8/14/15.
//  Copyright © 2015 Chen Zhibo. All rights reserved.
//

#import "GameConfigurationObject.h"
#import "StoneCollectGameConfig.h"

@implementation GameConfigurationObject

- (NSString *)titleForBuildObjectAtIndex:(int)index;
{
    return nil;
}
- (NSString *)nameForTotalNumber;
{
    return nil;
}

+ (instancetype)defaultGameConfiguration
{
    return [[StoneCollectGameConfig alloc] init];
}

@end
