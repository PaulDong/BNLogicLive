//
//  BNLTabBarController.m
//  BNLogic Live
//
//  Created by Chuan Xiang dong on 2014-10-07.
//  Copyright (c) 2014 Calgah computer system. All rights reserved.
//

#import "BNLTabBarController.h"
#import "BNLAppDelegate.h"

@interface BNLTabBarController ()

@end

@implementation BNLTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)menuBarButtonItemPressed:(UIBarButtonItem *)sender {
    [[self drawControllerFromAppDelegate] toggleDrawerSide:MMDrawerSideLeft animated:YES completion:nil];
}


- (MMDrawerController *) drawControllerFromAppDelegate {
    BNLAppDelegate *appDelegate = ((BNLAppDelegate *)[[UIApplication sharedApplication] delegate]);
    return appDelegate.drawController;
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
