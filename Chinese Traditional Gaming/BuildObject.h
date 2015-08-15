//
//  BuildObject.h
//  Chinese Traditional Gaming
//
//  Created by Chen Zhibo on 8/14/15.
//  Copyright © 2015 Chen Zhibo. All rights reserved.
//

#import <Foundation/Foundation.h>
@class Game;

@interface BuildObject : NSObject <NSCoding>

@property (strong, nonatomic) NSString *name;
@property (nonatomic) double number;//how many are there
@property (nonatomic) double speedPerUnit, cost;//increment per unit
@property (weak, nonatomic) Game *inGame;

@end
