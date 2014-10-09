//
//  SubjectLog.h
//  BNLogic Live
//
//  Created by Chuan Xiang dong on 2014-10-02.
//  Copyright (c) 2014 Calgah computer system. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
#import "BNLRecord.h"


@interface SubjectLog : BNLRecord

@property (nonatomic, retain) NSString * date;
@property (nonatomic, retain) NSString * host;
@property (nonatomic, retain) NSString * recDomain;
@property (nonatomic, retain) NSNumber * score;
@property (nonatomic, retain) NSString * subject;
@property (nonatomic, retain) NSString * time;
@property (nonatomic, retain) NSNumber * total;
@property (nonatomic, retain) NSNumber * id;

@end
