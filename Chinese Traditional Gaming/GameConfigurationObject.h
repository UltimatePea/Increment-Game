//
//  GameConfigurationObject.h
//  Chinese Traditional Gaming
//
//  Created by Chen Zhibo on 8/14/15.
//  Copyright © 2015 Chen Zhibo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GameConfigurationObject : NSObject

- (NSString *)titleForBuildObjectAtIndex:(int)index;
- (NSString *)nameForTotalNumber;
+ (instancetype)defaultGameConfiguration;
@end
