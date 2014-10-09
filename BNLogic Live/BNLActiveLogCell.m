//
//  BNLActiveLogCell.m
//  BNLogic Live
//
//  Created by Chuan Xiang dong on 2014-09-25.
//  Copyright (c) 2014 Calgah computer system. All rights reserved.
//

#import "BNLActiveLogCell.h"

@implementation BNLActiveLogCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}

-(void)setIsWhitelistSender:(BOOL)isWhitelistSender
{
    if (isWhitelistSender) {
        self.sendDomainLabel.textColor = [UIColor greenColor];
    } else {
        self.sendDomainLabel.textColor = [UIColor blackColor];
    }
}

-(void)setScoreValue:(float)scoreValue{
    if (scoreValue > 3.0) {
        self.scoreLabel.textColor = [UIColor redColor];
    } else {
        self.scoreLabel.textColor = [UIColor blackColor];
    }
}


@end
