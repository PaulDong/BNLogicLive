//
//  BNLMenuViewController.h
//  BNLogic Live
//
//  Created by Chuan Xiang dong on 2014-10-03.
//  Copyright (c) 2014 Calgah computer system. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BNLMenuViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>

@property (strong, nonatomic) IBOutlet UITableView *menuTableView;

@end
