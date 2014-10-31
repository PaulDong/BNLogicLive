//
//  KeyLog.m
//  BNLogic Live
//
//  Created by Chuan Xiang dong on 2014-10-02.
//  Copyright (c) 2014 Calgah computer system. All rights reserved.
//

#import "KeyLog.h"


@implementation KeyLog

@dynamic date;
@dynamic host;
@dynamic keyword;
@dynamic recDomain;
@dynamic score;
@dynamic sendDomain;
@dynamic subject;
@dynamic time;
@dynamic total;
@dynamic whitelistsender;
@dynamic id;

+ (NSString *)keyPathForResponseObject{
    
    return @"response.keylog";
}

@end
