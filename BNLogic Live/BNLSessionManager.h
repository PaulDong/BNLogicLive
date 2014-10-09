//
//  BNLSessionManager.h
//  BNLogic Live
//
//  Created by Chuan Xiang dong on 2014-10-02.
//  Copyright (c) 2014 Calgah computer system. All rights reserved.
//

#import "AFHTTPSessionManager.h"

@interface BNLSessionManager : AFHTTPSessionManager

+(instancetype)sharedClient;

@end
