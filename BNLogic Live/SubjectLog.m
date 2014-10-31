//
//  SubjectLog.m
//  BNLogic Live
//
//  Created by Chuan Xiang dong on 2014-10-02.
//  Copyright (c) 2014 Calgah computer system. All rights reserved.
//

#import "SubjectLog.h"


@implementation SubjectLog

@dynamic date;
@dynamic host;
@dynamic recDomain;
@dynamic score;
@dynamic subject;
@dynamic time;
@dynamic total;
@dynamic id;


+ (NSString *)keyPathForResponseObject{
    
    return @"response.subjectlog";
}
@end
