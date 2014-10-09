//
//  BNLKeyLogData.h
//  BNLogic Live
//
//  Created by Chuan Xiang dong on 2014-09-18.
//  Copyright (c) 2014 Calgah computer system. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BNLKeyLogData : NSObject

@property (strong, nonatomic) NSString *date;
@property (strong, nonatomic) NSString *time;
@property (strong, nonatomic) NSString *host;
@property (strong, nonatomic) NSString *recDomain;
@property (strong, nonatomic) NSString *sendDomain;
@property (assign) BOOL whitelistsender;
@property (strong, nonatomic) NSString *keyword;
@property (nonatomic) float score;
@property (strong, nonatomic) NSString *subject;
@property (nonatomic) int total;

@end
