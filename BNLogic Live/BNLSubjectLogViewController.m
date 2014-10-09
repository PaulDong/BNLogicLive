//
//  BNLSubjectLogViewController.m
//  BNLogic Live
//
//  Created by Chuan Xiang dong on 2014-09-17.
//  Copyright (c) 2014 Calgah computer system. All rights reserved.
//

#import "BNLSubjectLogViewController.h"
#import "BNLSubjectLogData.h"
#import "BNLSubjectLogCell.h"

@interface BNLSubjectLogViewController ()

@property (strong, nonatomic) IBOutlet UITableView *subjectTableView;
@property (strong, nonatomic) NSTimer *subjectlogTimer;
@property (strong, nonatomic) NSMutableArray *subjectlogArray;

@end

@implementation BNLSubjectLogViewController

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

    // Do any additional setup after loading the view.
    self.subjectTableView.delegate = self;
    self.subjectTableView.dataSource = self;
    self.subjectlogTimer = [NSTimer scheduledTimerWithTimeInterval:240 target:self selector:@selector(checkUpdate) userInfo:nil repeats:YES];
    if(!_subjectlogArray){
        self.subjectlogArray = [[NSMutableArray alloc] init];
    }
    
    //  self.subjectlogArray = [@[] mutableCopy];
}

-(void)viewDidDisappear:(BOOL)animated{

    [self.subjectlogTimer invalidate];
    self.subjectlogTimer = nil;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [self.subjectlogArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    static NSString *cellIdentifier = @"subjectLogCell";
    BNLSubjectLogCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier forIndexPath:indexPath];
    
    if (!cell){
        cell = [[BNLSubjectLogCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    BNLSubjectLogData *alog = self.subjectlogArray[indexPath.row];
    cell.hostLabel.text = alog.host;
    cell.recDomainLabel.text = alog.recDomain;
    cell.score = alog.score;
    NSNumber *nSocre = [NSNumber numberWithFloat:alog.score];
    NSString *numScore = [NSNumberFormatter localizedStringFromNumber:nSocre numberStyle: NSNumberFormatterDecimalStyle];
    cell.scoreLabel.text = numScore;
    cell.subjectLabel.text = alog.subject;
    NSNumber *nTotal = [NSNumber numberWithInt:alog.total];
    NSString *numTotal = [NSNumberFormatter localizedStringFromNumber:nTotal numberStyle:NSNumberFormatterDecimalStyle];
    cell.totalLabel.text = numTotal;
    return cell;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
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

- (void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath{
    
}

- (void)checkUpdate {
    
}

@end
