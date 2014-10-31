//
//  BNLMenuViewController.m
//  BNLogic Live
//
//  Created by Chuan Xiang dong on 2014-10-03.
//  Copyright (c) 2014 Calgah computer system. All rights reserved.
//

#import "BNLMenuViewController.h"
#import "BNLAppDelegate.h"
#import "BNLTabBarController.h"

@interface BNLMenuViewController ()

@property (strong, nonatomic) NSMutableArray *menuViewControllers;
@property (strong, nonatomic) UINavigationController *listNavigationViewController;

@end

@implementation BNLMenuViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.menuTableView.dataSource = self;
    self.menuTableView.delegate = self;

    if(!self.menuViewControllers){
        self.menuViewControllers =[[NSMutableArray alloc] initWithCapacity:3];
    }
}

-(void)viewDidAppear:(BOOL)animated{
    if (!self.listNavigationViewController){
        MMDrawerController *drawController = [self drawControllerFromAppDelegate];
        self.listNavigationViewController = (UINavigationController *)drawController.centerViewController;
        [self.menuViewControllers addObject:self.listNavigationViewController];
    }
    [self.menuTableView reloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (MMDrawerController *) drawControllerFromAppDelegate {
    BNLAppDelegate *appDelegate = ((BNLAppDelegate *)[[UIApplication sharedApplication] delegate]);
    return appDelegate.drawController;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [self.menuViewControllers count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellIdentifier = @"menuCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier forIndexPath:indexPath];
    
    if (!cell){
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    if (indexPath.row == 0){
        cell.imageView.image = [UIImage imageNamed:@"home.png"];
        cell.textLabel.text = @"Home";
    }
    return cell;
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath{
    MMDrawerController *drawController = [self drawControllerFromAppDelegate];
    [drawController setCenterViewController:self.menuViewControllers[indexPath.row] withCloseAnimation:YES completion:nil];
}




@end
