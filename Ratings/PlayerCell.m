//
//  PlayerCell.m
//  Ratings
//
//  Created by Tasvir H Rohila on 22/08/15.
//  Copyright (c) 2015 Tasvir H Rohila. All rights reserved.
//

#import "PlayerCell.h"

@implementation PlayerCell

@synthesize nameLabel;
@synthesize gameLabel;
@synthesize ratingImageView;


- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
