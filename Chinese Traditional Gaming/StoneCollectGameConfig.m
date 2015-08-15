//
//  StoneCollectGameConfig.m
//  Chinese Traditional Gaming
//
//  Created by Chen Zhibo on 8/14/15.
//  Copyright © 2015 Chen Zhibo. All rights reserved.
//

#import "StoneCollectGameConfig.h"

@implementation StoneCollectGameConfig

- (NSArray *)basicTitles
{
    return @[@"🚲",@"🚕",@"🚗",@"🚛",@"🚚",@"🚊",@"✈️"];
}



- (NSString *)nameForTotalNumber
{
    return @"💎";
}

- (NSString *)titleForBuildObjectAtIndex:(int)index
{
    if (index < [self basicTitles].count) {
        return [self basicTitles][index];
    } else {
        return [NSString stringWithFormat:@"%dx%@", (int)(index/[self basicTitles].count),
                [self basicTitles][index % [self basicTitles].count]];
    }
}

@end
