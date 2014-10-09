//
//  BNLActiveLogCell.h
//  BNLogic Live
//
//  Created by Chuan Xiang dong on 2014-09-25.
//  Copyright (c) 2014 Calgah computer system. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BNLActiveLogCell : UITableViewCell

@property (strong, nonatomic) IBOutlet UILabel *subjectLabel;
@property (strong, nonatomic) IBOutlet UILabel *scoreLabel;
@property (strong, nonatomic) IBOutlet UILabel *hostLabel;
@property (strong, nonatomic) IBOutlet UILabel *recDomainLabel;
@property (strong, nonatomic) IBOutlet UILabel *sendDomainLabel;
@property (strong, nonatomic) IBOutlet UILabel *totalLabel;
@property (assign, nonatomic) BOOL isWhitelistSender;
@property (nonatomic) float scoreValue;

@end