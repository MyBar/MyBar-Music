//
//  MBMainViewController.m
//  MyBarMusic
//
//  Created by lijingui2010 on 16/5/19.
//  Copyright © 2016年 MyBar. All rights reserved.
//

#import "MBMainViewController.h"
#import "MBMiniPlayerView.h"
#import "MBMyMusicTableViewController.h"
#import "MBPlayerViewController.h"

@interface MBMainViewController () <UIScrollViewDelegate, MBMiniPlayerViewDelegate>

@property (weak, nonatomic) IBOutlet UILabel *myMusicLabel;
@property (weak, nonatomic) IBOutlet UILabel *channelLabel;
@property (weak, nonatomic) IBOutlet UILabel *discoverLabel;

@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;

@property (weak, nonatomic) MBMiniPlayerView *miniPlayerView;

@property (strong, nonatomic) MBMyMusicTableViewController *mymusicTableVC;

@end

@implementation MBMainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = MBVC_BGCOLOR;
    
    [self setupNavigation];
    [self setupScrollView];
    self.miniPlayerView = [self setupMiniPlayerView];
    self.miniPlayerView.enabled = YES;
    self.miniPlayerView.delegate = self;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
}

- (void)setupNavigation {
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"vc_head_bg"] forBarMetrics:UIBarMetricsDefault];
    
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
        if (i == 0) {
            CGRect mymusicTableVCFrame = CGRectMake(i * width, 0, width, height - MBMiniPlayerViewHeight);
            self.mymusicTableVC.view.frame = mymusicTableVCFrame;
            [self.scrollView addSubview:self.mymusicTableVC.view];
        }else {
            CGRect frame = CGRectMake(i * width, 0, width, height);
            UIImageView *imageView = [[UIImageView alloc]initWithFrame:frame];
            
            NSString *imageName = [NSString stringWithFormat:@"Welcome_3.0_%d", i + 1];
            imageView.image = [UIImage imageNamed:imageName];
            
            [self.scrollView addSubview:imageView];
        }
    }
    
    self.scrollView.contentSize = CGSizeMake(3 * width, height);
    self.scrollView.delegate = self;
    
}

- (IBAction)tapNavigationTitleViewAction:(UITapGestureRecognizer *)sender {
    [self updateNavigationTitleViewColor:sender.view];
    
    CGPoint contentOffset;
    if (sender.view == self.myMusicLabel) {
        contentOffset = CGPointMake(0, 0);
    } else if (sender.view == self.channelLabel) {
        contentOffset = CGPointMake(self.scrollView.width, 0);
    } else {
        contentOffset = CGPointMake(2 * self.scrollView.width, 0);
    }
    
    [self.scrollView setContentOffset:contentOffset animated:NO];
}

- (void)updateNavigationTitleViewColor:(UIView *)view {
    if (view == self.myMusicLabel) {
        [self.myMusicLabel setTextColor:[UIColor whiteColor]];
        [self.channelLabel setTextColor:[UIColor lightTextColor]];
        [self.discoverLabel setTextColor:[UIColor lightTextColor]];
    } else if (view == self.channelLabel) {
        [self.myMusicLabel setTextColor:[UIColor lightTextColor]];
        [self.channelLabel setTextColor:[UIColor whiteColor]];
        [self.discoverLabel setTextColor:[UIColor lightTextColor]];
    } else if (view == self.discoverLabel) {
        [self.myMusicLabel setTextColor:[UIColor lightTextColor]];
        [self.channelLabel setTextColor:[UIColor lightTextColor]];
        [self.discoverLabel setTextColor:[UIColor whiteColor]];
    }
}

- (IBAction)tapMoreBarButtonItemAction:(UIButton *)sender {
    MBLog(@"tapMoreBarButtonItemAction");
    
    self.miniPlayerView.enabled = YES;
}

- (IBAction)tapSearchBarButtonItemAction:(UIButton *)sender {
    MBLog(@"tapSearchBarButtonItemAction");
    
    self.miniPlayerView.enabled = NO;
}

/** UIScrollViewDelegate */
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    NSInteger currentPage = scrollView.contentOffset.x / self.scrollView.width + 0.5;
    if (currentPage == 0) {
        [self updateNavigationTitleViewColor:self.myMusicLabel];
    } else if (currentPage == 1) {
        [self updateNavigationTitleViewColor:self.channelLabel];
    } else if (currentPage == 2) {
        [self updateNavigationTitleViewColor:self.discoverLabel];
    }
}

/** MBMiniPlayerViewDelegate 点击ScrollView后的动作 */
- (void)miniPlayerView:(MBMiniPlayerView *)miniPlayerView didClickScrollView:(UIScrollView *)scrollView {
    UINavigationController *playerNavVC = [MBMainStoryboard instantiateViewControllerWithIdentifier:@"playerNavVC"];
    [self presentViewController:playerNavVC animated:YES completion:nil];
}

/** MBMiniPlayerViewDelegate 点击PlayOrPauseButton后的动作 */
-(void)miniPlayerView:(MBMiniPlayerView *)miniPlayerView didClickPlayOrPauseButton:(UIButton *)playOrPauseButton {
    MBLog(@"点击PlayOrPauseButton后的动作");
}

/** MBMiniPlayerViewDelegate 点击PlaylistButton后的动作 */
- (void)miniPlayerView:(MBMiniPlayerView *)miniPlayerView didClickPlaylistButton:(UIButton *)playlistButton {
    MBLog(@"点击PlaylistButton后的动作");
}

#pragma make - Lazy loading Method  懒加载
- (MBMyMusicTableViewController *)mymusicTableVC {
    if (!_mymusicTableVC) {
        _mymusicTableVC = [MBMyMusicStoryboard instantiateViewControllerWithIdentifier:@"mymusicTableVC"];
    }
    
    return _mymusicTableVC;
}

@end
