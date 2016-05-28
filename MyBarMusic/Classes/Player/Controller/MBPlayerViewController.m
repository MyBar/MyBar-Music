//
//  MBPlayerViewController.m
//  MyBarMusic
//
//  Created by lijingui2010 on 16/5/27.
//  Copyright © 2016年 MyBar. All rights reserved.
//

#import "MBPlayerViewController.h"

@interface MBPlayerViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *albumCoverImageView;
@property (weak, nonatomic) IBOutlet UIImageView *albumCoverBackgroundImageView;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *albumCoverImageViewLeadingConstraint;


@property (weak, nonatomic) IBOutlet UISlider *progressSlider;
@property (weak, nonatomic) IBOutlet UILabel *currentTimeLabel;
@property (weak, nonatomic) IBOutlet UILabel *totalTimeLabel;

@end

@implementation MBPlayerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = MBVC_BGCOLOR;
    
    [self setupNavigation];
    [self initUI];
    
    
    [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(updateCurrentTime) userInfo:nil repeats:YES];
}


- (void)updateCurrentTime {
    static NSInteger i = 0;
    i += 1;
    self.currentTimeLabel.text = [NSString stringWithFormat:@"%02d:%02d", (int)(i / 60), (int)(i % 60)];
    //self.progressSlider.value = self.player.currentTime;
}


- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
}

- (void)setupNavigation {
    [self.navigationController.navigationBar setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
    
}

- (void)initUI {
    self.albumCoverImageView.width = self.view.width - self.albumCoverImageViewLeadingConstraint.constant * self.albumCoverImageViewLeadingConstraint.multiplier * 2;
    self.albumCoverImageView.layer.cornerRadius = self.albumCoverImageView.width * 0.5;
    self.albumCoverImageView.layer.borderWidth = 8;
    self.albumCoverImageView.layer.masksToBounds = YES;
    
    self.albumCoverBackgroundImageView.layer.cornerRadius = self.albumCoverImageView.width * 0.5;
    self.albumCoverBackgroundImageView.layer.masksToBounds = YES;
    
    [self.progressSlider setThumbImage:[UIImage imageNamed:@"player_slider_playback_thumb"] forState:UIControlStateNormal];
    [self.progressSlider setThumbImage:[UIImage imageNamed:@"player_slider_playback_thumb"] forState:UIControlStateHighlighted];
    [self.progressSlider setMinimumTrackImage:[UIImage imageNamed:@"player_slider_playback_left"] forState:UIControlStateNormal];
    [self.progressSlider setMaximumTrackImage:[UIImage imageNamed:@"player_slider_playback_right"] forState:UIControlStateNormal];
    
}

- (IBAction)tapBackBarButtonItemAction:(UIButton *)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)tapMoreBarButtonItemAction:(UIButton *)sender {
    
}


@end
