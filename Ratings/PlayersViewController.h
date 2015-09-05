//
//  PlayersViewController.h
//  Ratings
//
//  Created by Tasvir H Rohila on 22/08/15.
//  Copyright (c) 2015 Tasvir H Rohila. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PlayerDetailsViewController.h"

@interface PlayersViewController : UITableViewController <PlayerDetailsViewControllerDelegate>

@property (nonatomic, strong) NSMutableArray *players;

@end
