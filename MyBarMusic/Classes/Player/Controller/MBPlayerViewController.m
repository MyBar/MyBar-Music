//
//  MBPlayerViewController.m
//  MyBarMusic
//
//  Created by lijingui2010 on 16/5/27.
//  Copyright © 2016年 MyBar. All rights reserved.
//

#import "MBPlayerViewController.h"

@interface MBPlayerViewController ()

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *artistLabel;
@property (weak, nonatomic) IBOutlet UIButton *qualityButton;
@property (weak, nonatomic) IBOutlet UIButton *copyrightButton;
@property (weak, nonatomic) IBOutlet UIButton *mvButton;
@property (weak, nonatomic) IBOutlet UIButton *dtsButton;
@property (weak, nonatomic) IBOutlet UIImageView *albumCoverImageView;
@property (weak, nonatomic) IBOutlet UIImageView *albumCoverBackgroundImageView;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UILabel *lyricLabel;
@property (weak, nonatomic) IBOutlet UIPageControl *pageControl;
@property (weak, nonatomic) IBOutlet UISlider *progressSlider;
@property (weak, nonatomic) IBOutlet UILabel *currentTimeLabel;
@property (weak, nonatomic) IBOutlet UILabel *totalTimeLabel;
@property (weak, nonatomic) IBOutlet UIButton *playOrPauseButton;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *albumCoverImageViewLeadingConstraint;


@end

@implementation MBPlayerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = MBVC_BGCOLOR;
    
    [self setupNavigation];
    [self initUI];
    [self setupScrollView];
    
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

- (void)setupScrollView {
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    CGRect frame = self.view.bounds;
    frame.origin.y = CGRectGetMaxY(self.navigationController.navigationBar.frame);
    frame.size.height = frame.size.height - CGRectGetMaxY(self.navigationController.navigationBar.frame) - MBMiniPlayerViewHeight;
    self.scrollView.frame = frame;
    
    CGFloat width = self.scrollView.width;
    CGFloat height = self.scrollView.height;
    
    for (int i = 0; i < 3; i++) {
        CGRect frame = CGRectMake(i * width, 0, width, height);
        UIImageView *imageView = [[UIImageView alloc]initWithFrame:frame];
        
        NSString *imageName = [NSString stringWithFormat:@"Welcome_3.0_%d", i + 1];
        imageView.image = [UIImage imageNamed:imageName];
        
        [self.scrollView addSubview:imageView];
    }
    
    self.scrollView.contentSize = CGSizeMake(3 * width, height);
    
}

- (IBAction)tapBackBarButtonItemAction:(UIButton *)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)tapMoreBarButtonItemAction:(UIButton *)sender {
    
}


@end
