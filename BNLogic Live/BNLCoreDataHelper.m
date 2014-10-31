//
//  BNLCoreDataHelper.m
//  BNLogic Live
//
//  Created by Chuan Xiang dong on 2014-10-23.
//  Copyright (c) 2014 Calgah computer system. All rights reserved.
//

#import "BNLCoreDataHelper.h"

@implementation BNLCoreDataHelper

+(NSManagedObjectContext *)managedObjectContext {

    NSManagedObjectContext *context = nil;

    id delegate = [[UIApplication sharedApplication] delegate];

    if ([delegate performSelector:@selector(managedObjectContext)]) {

        context = [delegate managedObjectContext];
    }

    return context;
}


@end
