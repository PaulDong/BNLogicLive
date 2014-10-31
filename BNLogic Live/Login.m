//
//  Login.m
//  BNLogic Live
//
//  Created by Chuan Xiang dong on 2014-10-02.
//  Copyright (c) 2014 Calgah computer system. All rights reserved.
//

#import "Login.h"


@implementation Login

@dynamic password;
@dynamic userName;

+ (NSString *)keyPathForResponseObject{
    
    return @"response.login";
}
@end
