//
//  BNLKeyLogViewController.m
//  BNLogic Live
//
//  Created by Chuan Xiang dong on 2014-09-17.
//  Copyright (c) 2014 Calgah computer system. All rights reserved.
//

#import "BNLKeyLogViewController.h"
#import "BNLKeyLogData.h"
#import "BNLKeyLogCell.h"

@interface BNLKeyLogViewController ()

@property (strong, nonatomic) IBOutlet UITableView *keyTableView;
@property (strong, nonatomic) NSTimer *keylogTimer;
@property (strong, nonatomic) NSMutableArray *keylogArray;

@end

@implementation BNLKeyLogViewController

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
    self.keyTableView.delegate = self;
    self.keyTableView.dataSource = self;
    self.keylogTimer = [NSTimer scheduledTimerWithTimeInterval:240 target:self selector:@selector(checkUpdate) userInfo:nil repeats:YES];
    if(!_keylogArray){
        self.keylogArray = [[NSMutableArray alloc] init];
    }
    BNLKeyLogData *log1 = [[BNLKeyLogData alloc]init];
    log1.host = @"antispam";
    log1.recDomain = @"ens.etsmtl.ca";
    log1.sendDomain = @"bounce.logilys.com";
    log1.whitelistsender = YES;
    log1.score =0.0;
    log1.subject = @"[Activites a venir - Reseau ETS] Infocourriel des evenements a venir au Reseau ETS - 19 septembre 2014";
    log1.total = 3130;
    BNLKeyLogData *log2 = [[BNLKeyLogData alloc]init];
    log2.host = @"relais";
    log2.recDomain = @"uqtr.ca";
    log2.sendDomain = @"uqtr.ca";
    log2.whitelistsender = YES;
    log2.score = 3.15;
    log2.subject = @"Offre d'emploi (coordonnateur)";
    log2.total = 1087;
    BNLKeyLogData *log3 = [[BNLKeyLogData alloc]init];
    log3.host = @"relais";
    log3.recDomain = @"uqtr.ca";
    log3.sendDomain = @"uqtr.ca";
    log3.whitelistsender = YES;
    log3.score = 1.38;
    log3.subject = @"Offre d'emploi (coordonnateur)";
    log3.total = 501;

    self.keylogArray = [@[log1, log2, log3] mutableCopy];
}

- (void)viewDidDisappear:(BOOL)animated{

    [self.keylogTimer invalidate];
    self.keylogTimer = nil;

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [self.keylogArray count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellIdentifier = @"keyLogCell";
    BNLKeyLogCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier forIndexPath:indexPath];
    
    if (!cell){
        cell = [[BNLKeyLogCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }

    BNLKeyLogData *alog = self.keylogArray[indexPath.row];
    cell.hostLabel.text = alog.host;
    cell.recDomainLabel.text = alog.recDomain;
    cell.sendDomainLabel.text = alog.sendDomain;
    cell.score = alog.score;
    NSNumber *nSocre = [NSNumber numberWithFloat:alog.score];
    NSString *numScore = [NSNumberFormatter localizedStringFromNumber:nSocre numberStyle: NSNumberFormatterDecimalStyle];
    cell.scoreLabel.text = numScore;
    cell.subjectLabel.text = alog.subject;
    cell.isWhitelistSender = alog.whitelistsender;
    cell.keywordLabel.text = alog.keyword;
    NSNumber *nTotal = [NSNumber numberWithInt:alog.total];
    NSString *numTotal = [NSNumberFormatter localizedStringFromNumber:nTotal numberStyle:NSNumberFormatterDecimalStyle];
    cell.totalLabel.text = numTotal;

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
    
}

- (void)checkUpdate {
    
}

@end
