//
//  PlayerDetailsViewController.h
//  Ratings
//
//  Created by Tasvir H Rohila on 23/08/15.
//  Copyright (c) 2015 Tasvir H Rohila. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Player.h"
#import "GamePickerViewController.h"

@class PlayerDetailsViewController;

//This defines a new delegate protocol that we’ll use to communicate back from the Add Player screen to the main Players screen when the user taps Cancel or Done.
@protocol PlayerDetailsViewControllerDelegate <NSObject>
//Cancel
- (void)playerDetailsViewControllerDidCancel: (PlayerDetailsViewController *)controller;
//Done
-(void) PlayerDetailsViewController: (PlayerDetailsViewController*)controller didAddPlayer:(Player*)player;

@end

@interface PlayerDetailsViewController : UITableViewController <GamePickerViewControllerDelegate>

@property (nonatomic, weak) id <PlayerDetailsViewControllerDelegate> delegate;

- (IBAction)cancel:(id)sender;
- (IBAction)done:(id)sender;


@end
