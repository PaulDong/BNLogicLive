//
//  Login.h
//  BNLogic Live
//
//  Created by Chuan Xiang dong on 2014-10-02.
//  Copyright (c) 2014 Calgah computer system. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
#import "BNLRecord.h"


@interface Login : BNLRecord

@property (nonatomic, retain) NSString * password;
@property (nonatomic, retain) NSString * userName;

@end
