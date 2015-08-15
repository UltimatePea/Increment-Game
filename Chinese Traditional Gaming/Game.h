//
//  Game.h
//  Chinese Traditional Gaming
//
//  Created by Chen Zhibo on 8/14/15.
//  Copyright © 2015 Chen Zhibo. All rights reserved.
//

#import <Foundation/Foundation.h>
@class GameConfigurationObject;
@class GameViewController;
@interface Game : NSObject
@property (strong, nonatomic) GameConfigurationObject *gameConfig;
@property (nonatomic) double numberTotal;
@property (strong, nonatomic) NSMutableArray *buildObjects;
@property (strong, nonatomic) GameViewController *vc;
//- (instancetype)initWithGameConfiguration:(GameConfigurationObject *)gameConfig;
- (void)playWithUpdateBlock:(void (^)())block;
- (void)addTotal;
- (double)addTotalNumber;
- (void)save;
- (instancetype)initWithSavedDataWithConfig:(GameConfigurationObject *)gameConfig;
- (double)currentSpeed;
- (void)addNewBuildObject;
@end
