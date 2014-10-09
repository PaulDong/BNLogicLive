//
//  BNLLoginViewController.h
//  BNLogic Live
//
//  Created by Chuan Xiang dong on 2014-09-17.
//  Copyright (c) 2014 Calgah computer system. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BNLLoginViewController : UIViewController <UITextFieldDelegate>

@property (strong, nonatomic) IBOutlet UIActivityIndicatorView *activityIndicator;

@property (strong, nonatomic) IBOutlet UILabel *UITips;

@property (strong, nonatomic) IBOutlet UITextField *userNameTextField;

@property (strong, nonatomic) IBOutlet UITextField *passwordTextField;

- (IBAction)loginButtonPressed:(UIButton *)sender;

@end
