//
//  MBMainViewController.m
//  MyBarMusic
//
//  Created by lijingui2010 on 16/5/19.
//  Copyright © 2016年 MyBar. All rights reserved.
//

#import "MBMainViewController.h"
#import "MBMiniPlayerView.h"

@interface MBMainViewController ()

@property (weak, nonatomic) IBOutlet UILabel *myMusicLabel;
@property (weak, nonatomic) IBOutlet UILabel *channelLabel;
@property (weak, nonatomic) IBOutlet UILabel *discoverLabel;

@property (weak, nonatomic) MBMiniPlayerView *miniPlayerView;

@end

@implementation MBMainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = MBVC_BGCOLOR;
    
    [self setupNavigation];
    
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    self.miniPlayerView = [MBMiniPlayerView shareMiniPlayerView];
    [self.view addSubview:self.miniPlayerView];
}

- (void)setupNavigation {
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"vc_head_bg"] forBarMetrics:UIBarMetricsDefault];
    
}

- (IBAction)updateNavigationTitleViewStatus:(UITapGestureRecognizer *)sender {
    [self updateNavigationTitleViewColor:sender.view];
}

- (void)updateNavigationTitleViewColor:(UIView *)sender {
    if (sender == self.myMusicLabel) {
        [self.myMusicLabel setTextColor:[UIColor whiteColor]];
        [self.channelLabel setTextColor:[UIColor lightTextColor]];
        [self.discoverLabel setTextColor:[UIColor lightTextColor]];
    } else if (sender == self.channelLabel) {
        [self.myMusicLabel setTextColor:[UIColor lightTextColor]];
        [self.channelLabel setTextColor:[UIColor whiteColor]];
        [self.discoverLabel setTextColor:[UIColor lightTextColor]];
    } else {
        [self.myMusicLabel setTextColor:[UIColor lightTextColor]];
        [self.channelLabel setTextColor:[UIColor lightTextColor]];
        [self.discoverLabel setTextColor:[UIColor whiteColor]];
    }
}

- (IBAction)tapMoreBarButtonItemAction:(UIButton *)sender {
    MBLog(@"tapMoreBarButtonItemAction");
}

- (IBAction)tapSearchBarButtonItemAction:(UIButton *)sender {
    MBLog(@"tapSearchBarButtonItemAction");
}


@end
