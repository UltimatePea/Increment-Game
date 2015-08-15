//
//  BuildObjectTableViewCell.m
//  Chinese Traditional Gaming
//
//  Created by Chen Zhibo on 8/14/15.
//  Copyright © 2015 Chen Zhibo. All rights reserved.
//

#import "BuildObjectTableViewCell.h"
#import "BuildObject.h"
#import "Game.h"
@implementation BuildObjectTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (IBAction)addObject:(id)sender {
    if (self.buildObject.cost < self.buildObject.inGame.numberTotal) {
        self.buildObject.inGame.numberTotal -= self.buildObject.cost;
        self.buildObject.number ++;
        
        if (self.buildObject.number == 1) {
            [self.buildObject.inGame addNewBuildObject];
        }
        [self update];

    }
}

- (void)update
{
    self.numberLabel.text = [NSString stringWithFormat:@"🔢:%f", self.buildObject.number];
    self.speedLabel.text = [NSString stringWithFormat:@"⏫:%f", self.buildObject.number * self.buildObject.speedPerUnit];
    self.costLabel.text = [NSString stringWithFormat:@"💵:%f", self.buildObject.cost];
}




@end
