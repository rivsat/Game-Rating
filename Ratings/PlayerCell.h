//
//  PlayerCell.h
//  Ratings
//
//  Created by Tasvir H Rohila on 22/08/15.
//  Copyright (c) 2015 Tasvir H Rohila. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PlayerCell : UITableViewCell

@property (nonatomic, strong) IBOutlet UILabel *nameLabel;
@property (nonatomic, strong) IBOutlet UILabel *gameLabel;
@property (nonatomic, strong) IBOutlet UIImageView *ratingImageView;

@end
