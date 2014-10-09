//
//  BNLActiveLogViewController.m
//  BNLogic Live
//
//  Created by Chuan Xiang dong on 2014-09-17.
//  Copyright (c) 2014 Calgah computer system. All rights reserved.
//

#import "BNLActiveLogViewController.h"
#import "BNLActiveLogData.h"
#import "BNLActiveLogCell.h"

@interface BNLActiveLogViewController ()

@property (strong, nonatomic) IBOutlet UITableView *activeTableView;
@property (strong, nonatomic) NSTimer *activelogTimer;
@property (strong, nonatomic) NSMutableArray *activelogArray;


@end

@implementation BNLActiveLogViewController

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
    self.activeTableView.delegate = self;
    self.activeTableView.dataSource = self;
    self.navigationController.title = @"Active Log";
    self.activelogTimer = [NSTimer scheduledTimerWithTimeInterval:240 target:self selector:@selector(checkUpdate) userInfo:nil repeats:YES];
    BNLActiveLogData *log1 = [[BNLActiveLogData alloc]init];
    log1.host = @"antispam";
    log1.recDomain = @"ens.etsmtl.ca";
    log1.sendDomain = @"bounce.logilys.com";
    log1.whitelistsender = YES;
    log1.score =0.0;
    log1.subject = @"[Activites a venir - Reseau ETS] Infocourriel des evenements a venir au Reseau ETS - 19 septembre 2014";
    log1.total = 3130;
    BNLActiveLogData *log2 = [[BNLActiveLogData alloc]init];
    log2.host = @"relais";
    log2.recDomain = @"uqtr.ca";
    log2.sendDomain = @"uqtr.ca";
    log2.whitelistsender = NO;
    log2.score = 3.15;
    log2.subject = @"Offre d'emploi (coordonnateur)";
    log2.total = 1087;
    BNLActiveLogData *log3 = [[BNLActiveLogData alloc]init];
    log3.host = @"relais";
    log3.recDomain = @"uqtr.ca";
    log3.sendDomain = @"uqtr.ca";
    log3.whitelistsender = YES;
    log3.score = 1.38;
    log3.subject = @"Offre d'emploi (coordonnateur)";
    log3.total = 501;
    if(!_activelogArray){
        self.activelogArray = [[NSMutableArray alloc] init];
    }
    self.activelogArray = [@[log1, log2, log3] mutableCopy];
}

- (void)viewDidDisappear:(BOOL)animated{

    [self.activelogTimer invalidate];
    self.activelogTimer = nil;

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [self.activelogArray count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    static NSString *cellIdentifier = @"activeLogCell";
    BNLActiveLogCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier forIndexPath:indexPath];

    if (!cell){
        cell = [[BNLActiveLogCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    BNLActiveLogData *alog = self.activelogArray[indexPath.row];
    cell.hostLabel.text = alog.host;
    cell.recDomainLabel.text = alog.recDomain;
    cell.sendDomainLabel.text = alog.sendDomain;
    cell.scoreValue = alog.score;
    NSNumber *nSocre = [NSNumber numberWithFloat:alog.score];
    NSString *numScore = [NSNumberFormatter localizedStringFromNumber:nSocre numberStyle: NSNumberFormatterDecimalStyle];
    cell.scoreLabel.text = numScore;
    cell.subjectLabel.text = alog.subject;
    cell.isWhitelistSender = alog.whitelistsender;
    NSNumber *nTotal = [NSNumber numberWithInt:alog.total];
    NSString *numTotal = [NSNumberFormatter localizedStringFromNumber:nTotal numberStyle:NSNumberFormatterDecimalStyle];
    cell.totalLabel.text = numTotal;

    //  cell.imageView.contentMode = UIViewContentModeScaleAspectFill;
    return cell;
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
    BNLActiveLogData *log = self.activelogArray[indexPath.row];
    log.whitelistsender = NO;
    [self.activeTableView reloadData];
}

- (void)checkUpdate {

}
@end
