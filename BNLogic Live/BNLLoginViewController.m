//
//  BNLLoginViewController.m
//  BNLogic Live
//
//  Created by Chuan Xiang dong on 2014-09-17.
//  Copyright (c) 2014 Calgah computer system. All rights reserved.
//

#import "BNLLoginViewController.h"

@interface BNLLoginViewController ()

@end

@implementation BNLLoginViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.activityIndicator.hidden = YES;
    self.userNameTextField.delegate = self;
    self.passwordTextField.delegate = self;

    // Do any additional setup after loading the view.
}

-(void)viewWillAppear:(BOOL)animated{
    self.userNameTextField.text = @"";
    self.passwordTextField.text = @"";
    self.UITips.text = @"Please type your Login info below.";
    self.UITips.textColor = [UIColor blackColor];
    self.activityIndicator.hidden = YES;
    [self.activityIndicator stopAnimating];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)loginButtonPressed:(UIButton *)sender {
    //
    if ([self.userNameTextField isFirstResponder]) {
        [self.userNameTextField resignFirstResponder];
    }
    if ([self.passwordTextField isFirstResponder]) {
        [self.passwordTextField resignFirstResponder];
    }

    [self systemlogin];
}

- (void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {

    UITouch *touch = [[event allTouches] anyObject];
    if ([self.userNameTextField isFirstResponder] && [touch view] != self.userNameTextField) {
        [self.userNameTextField resignFirstResponder];
    }
    
    if ([self.passwordTextField isFirstResponder] && [touch view] != self.passwordTextField) {
        [self.passwordTextField resignFirstResponder];
    }
    [super touchesBegan:touches withEvent:event];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    if ([self.userNameTextField isFirstResponder]) {
        [self.userNameTextField resignFirstResponder];
    }
    if ([self.passwordTextField isFirstResponder]) {
        [self.passwordTextField resignFirstResponder];
        [self systemlogin];
    }

    return YES;
}

- (void) systemlogin {
    self.activityIndicator.hidden = NO;
    [self.activityIndicator startAnimating];
    NSString *username = @"admin";
    NSString *password = @"test";
    if( [self.userNameTextField.text isEqualToString: username] && [self.passwordTextField.text isEqualToString: password]){
        [self performSegueWithIdentifier:@"toTabBarController" sender:nil];
    }else {
        [self.activityIndicator stopAnimating];
        self.activityIndicator.hidden = YES;
        UIAlertView *alertview = [[UIAlertView alloc] initWithTitle:@"Error" message:@"Worng input username or password" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles: nil];
        [alertview show];
        self.UITips.text = @"Worng username or password try again";
        self.UITips.textColor = [UIColor redColor];
    }
}


@end
