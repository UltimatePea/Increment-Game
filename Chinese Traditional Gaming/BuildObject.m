//
//  BuildObject.m
//  Chinese Traditional Gaming
//
//  Created by Chen Zhibo on 8/14/15.
//  Copyright © 2015 Chen Zhibo. All rights reserved.
//

#import "BuildObject.h"
#import "Game.h"

@implementation BuildObject

- (double)cost
{
    return pow(57, [self.inGame.buildObjects indexOfObject:self]) * pow(7, self.number);
}

- (void)encodeWithCoder:(nonnull NSCoder *)aCoder
{
    [aCoder encodeObject:self.name forKey:@"name"];
    [aCoder encodeDouble:self.number forKey:@"number"];
    [aCoder encodeDouble:self.speedPerUnit forKey:@"speed"];
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.cost = 0;
        self.number = 0;
        self.speedPerUnit = 0;
    }
    return self;
}

- (instancetype)initWithCoder:(nonnull NSCoder *)aDecoder
{
    self = [self init];
    if (self) {
        self.name = [aDecoder decodeObjectForKey:@"name"];
        self.number = [aDecoder decodeDoubleForKey:@"number"];
        self.speedPerUnit = [aDecoder decodeDoubleForKey:@"speed"];
    }
    return self;
}

@end
