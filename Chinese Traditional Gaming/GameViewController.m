//
//  GameViewController.m
//  Chinese Traditional Gaming
//
//  Created by Chen Zhibo on 8/14/15.
//  Copyright © 2015 Chen Zhibo. All rights reserved.
//

#import "GameViewController.h"
#import "Game.h"
#import "BuildObjectTableViewCell.h"
#import "GameConfigurationObject.h"
@interface GameViewController () <UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UILabel *totalLabel;
@property (weak, nonatomic) IBOutlet UILabel *speedLabel;
@property (weak, nonatomic) IBOutlet UIButton *button;
@property (strong, nonatomic) Game *game;
@property (weak, nonatomic) IBOutlet UITableView *displayingTableView;

@end

@implementation GameViewController

- (IBAction)clickedButton:(id)sender {
    [self.game addTotal];
}


- (void)viewDidLoad {
    [super viewDidLoad];
    self.game = [[Game alloc] initWithSavedDataWithConfig:[GameConfigurationObject defaultGameConfiguration]];
    self.game.vc = self;
    [[NSNotificationCenter defaultCenter] addObserverForName:UIApplicationWillResignActiveNotification object:nil queue:nil usingBlock:^(NSNotification * _Nonnull note) {
        [self.game save];
    }];
    // Do any additional setup after loading the view.
}

- (void)viewDidAppear:(BOOL)animated
{
    [self.game playWithUpdateBlock:^{
        [self update];
    }];
}

- (void)update
{
    self.totalLabel.text = [NSString stringWithFormat:@"%f%@", self.game.numberTotal, [self.game.gameConfig nameForTotalNumber]];
    self.speedLabel.text = [NSString stringWithFormat:@"+%f%@", [self.game currentSpeed], [self.game.gameConfig nameForTotalNumber]];
    [UIView setAnimationsEnabled:NO];
    [self.button setTitle: [NSString stringWithFormat:@"%@[+%f]", [self.game.gameConfig nameForTotalNumber], [self.game addTotalNumber]] forState:UIControlStateNormal];
//    [UIView setAnimationsEnabled:NO];
    
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.game.buildObjects.count;
}

- (NSInteger)numberOfSectionsInTableView:(nonnull UITableView *)tableView
{
    return 1;
}

- (UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath
{
    BuildObjectTableViewCell *botvcell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([BuildObjectTableViewCell class])];
    botvcell.buildObject = self.game.buildObjects[indexPath.row];
    [botvcell update];
    return botvcell;
                                          
}

- (void)reloadLastLine
{
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:self.game.buildObjects.count inSection:0];
    
    
//    [self.displayingTableView reloadRowsAtIndexPaths: @[indexPath] withRowAnimation:UITableViewRowAnimationBottom];
    [self.displayingTableView reloadData];
}



/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
