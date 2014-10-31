//
//  BNLSessionManager.m
//  BNLogic Live
//
//  Created by Chuan Xiang dong on 2014-10-02.
//  Copyright (c) 2014 Calgah computer system. All rights reserved.
//

#import "BNLSessionManager.h"

@implementation BNLSessionManager

static NSString *const BNLBasicURLString = @"http://208.72.178.132/api/index_json.php";

+(instancetype)sharedClient{
    static BNLSessionManager *_sharedClient = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedClient =[[BNLSessionManager alloc] initWithBaseURL:[NSURL URLWithString: BNLBasicURLString]];
    });
    
    return _sharedClient;
}

@end