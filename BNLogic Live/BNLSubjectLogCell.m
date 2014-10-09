//
//  BNLSubjectLogCell.m
//  BNLogic Live
//
//  Created by Chuan Xiang dong on 2014-09-25.
//  Copyright (c) 2014 Calgah computer system. All rights reserved.
//

#import "BNLSubjectLogCell.h"

@implementation BNLSubjectLogCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)setScore:(float)score{
    if (score > 3.0) {
        self.scoreLabel.textColor = [UIColor redColor];
    } else {
        self.scoreLabel.textColor = [UIColor blackColor];
    }
}


@end
