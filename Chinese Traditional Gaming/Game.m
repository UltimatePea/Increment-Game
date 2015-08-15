//
//  Game.m
//  Chinese Traditional Gaming
//
//  Created by Chen Zhibo on 8/14/15.
//  Copyright © 2015 Chen Zhibo. All rights reserved.
//

#import "Game.h"
#import "BuildObject.h"
#import "GameConfigurationObject.h"
#import "GameViewController.h"

@implementation Game

- (NSMutableArray *)buildObjects
{
    if (!_buildObjects) {
        _buildObjects = [NSMutableArray array];
        [self addNewBuildObject];
    }
    return _buildObjects;
}

- (void)addTotal
{
    self.numberTotal += [self addTotalNumber];
}

- (double)addTotalNumber
{
   return     self.numberTotal * 0.001 < 1 ? 1 : self.numberTotal * 0.001;
}

- (void)save
{
    [NSKeyedArchiver archiveRootObject:@{@"buildObjects" : self.buildObjects, @"numTotal": [NSNumber numberWithDouble:self.numberTotal]} toFile:[self saveURL].path]?NSLog(@"saved successfully"):NSLog(@"Saved unsuccessfully");
}

- (NSURL *)saveURL
{
    return [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask]. firstObject URLByAppendingPathComponent:@"default.game"];
}

- (instancetype)initWithSavedDataWithConfig:(GameConfigurationObject *)gameConfig;
{
    self = [super init];
    if (self) {
        NSDictionary *data = [NSKeyedUnarchiver unarchiveObjectWithFile:[self saveURL].path];
        self.buildObjects = [NSMutableArray arrayWithArray:data[@"buildObjects"]];
        [self.buildObjects enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            ((BuildObject *)obj).inGame = self;
        }];
        self.numberTotal = [data[@"numTotal"] doubleValue];
        self.gameConfig = gameConfig;
        if (self.buildObjects.count == 0) {
            [self addNewBuildObject];
        }
//        [self addNewBuildObject];
    }
    return self;
}

- (void)playWithUpdateBlock:(void (^)())block
{
    NSTimer *timer = [NSTimer timerWithTimeInterval:0.1 target:self selector:@selector(timerEvent:) userInfo:@{@"block":block, @"timeInterval":@0.1} repeats:YES];
    [[NSRunLoop currentRunLoop] addTimer:timer forMode:NSDefaultRunLoopMode];
    [timer fire];
}

- (void)timerEvent:(NSTimer *)timer
{
    [self updateToTimeInterval:[timer.userInfo[@"timeInterval"] doubleValue]];
    void (^block)()  = timer.userInfo[@"block"];
    block();
}

- (void)updateToTimeInterval:(NSTimeInterval)tv
{
    
    self.numberTotal += [self currentSpeed] * tv;
    
}

- (void)addNewBuildObject
{
    BuildObject *object = [[BuildObject alloc] init];
    object.name = [self.gameConfig titleForBuildObjectAtIndex:(int)self.buildObjects.count];
    object.number = 0;
    object.speedPerUnit = pow(2, 2 * self.buildObjects.count);
    object.inGame = self;
    [self.buildObjects addObject:object];
    [self.vc reloadLastLine];
}

- (double)currentSpeed
{
    double increment = 0;
    for (BuildObject *object in self.buildObjects) {
        increment += object.number * object.speedPerUnit;
    }
    return increment;
}

@end
