//
//  BuildObjectTableViewCell.h
//  Chinese Traditional Gaming
//
//  Created by Chen Zhibo on 8/14/15.
//  Copyright © 2015 Chen Zhibo. All rights reserved.
//

#import <UIKit/UIKit.h>
@class BuildObject;

@interface BuildObjectTableViewCell : UITableViewCell

@property (weak, nonatomic) BuildObject *buildObject;
@property (weak, nonatomic) IBOutlet UILabel *numberLabel;
@property (weak, nonatomic) IBOutlet UILabel *speedLabel;
@property (weak, nonatomic) IBOutlet UILabel *costLabel;
- (void)update;
@end
