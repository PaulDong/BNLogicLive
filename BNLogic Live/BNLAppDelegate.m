//
//  BNLAppDelegate.m
//  BNLogic Live
//
//  Created by Chuan Xiang dong on 2014-09-17.
//  Copyright (c) 2014 Calgah computer system. All rights reserved.
//

#import "BNLAppDelegate.h"
#import "BNLMenuViewController.h"
#import "BNLLoginViewController.h"
#import "MMDrawerVisualState.h"


@implementation BNLAppDelegate

-(BOOL)application:(UIApplication *)application willFinishLaunchingWithOptions:(NSDictionary *)launchOptions{

    [MagicalRecord setupCoreDataStackWithStoreNamed:@"BNLogicLiveModel"];
    UIStoryboard *mainStoryboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    BNLMenuViewController *menuController = [mainStoryboard instantiateViewControllerWithIdentifier:@"MenuViewControllerID"];
    BNLLoginViewController *loginController = [mainStoryboard instantiateViewControllerWithIdentifier:@"DataViewControllerID"];

    self.drawController = [[MMDrawerController alloc] initWithCenterViewController:loginController leftDrawerViewController:menuController];

    [self.drawController setMaximumLeftDrawerWidth:240.0];

    [self.drawController setOpenDrawerGestureModeMask:MMOpenDrawerGestureModeAll];
    [self.drawController setCloseDrawerGestureModeMask:MMCloseDrawerGestureModeAll];

    [self.drawController setDrawerVisualStateBlock:[MMDrawerVisualState slideAndScaleVisualStateBlock]];
    self.window = [[UIWindow alloc]initWithFrame:[[UIScreen mainScreen] bounds]];
    [self.window setRootViewController:self.drawController];
    [MagicalRecord setupCoreDataStackWithStoreNamed:@"BNLData"];
    return YES;
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.
    [[UINavigationBar appearance] setBarTintColor:[UIColor colorWithRed:15/255.0 green:15/255.0 blue:15/255.0 alpha:1.0]];
    [[UINavigationBar appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor],NSFontAttributeName:[UIFont fontWithName:@"HelveticaNeue-Light" size:18.0]}];
    [[UIBarButtonItem appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor]} forState:UIControlStateNormal];
    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleLightContent;

    [self.window makeKeyAndVisible];

    return YES;
}
							
- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
