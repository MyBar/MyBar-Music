//
//  MBToolbarView.m
//  MyBarMusic
//
//  Created by lijingui2010 on 16/5/24.
//  Copyright © 2016年 MyBar. All rights reserved.
//

#import "MBMiniPlayerView.h"

@interface MBMiniPlayerView ()

@property (weak, nonatomic) IBOutlet UIView *separatorView;

@property (weak, nonatomic) IBOutlet UILabel *nonePlaylistLabel;

@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;

@property (weak, nonatomic) IBOutlet UIButton *playOrPauseButton;

@property (weak, nonatomic) IBOutlet UIButton *playlistButton;

@property (weak, nonatomic) MBMiniPlayerAlbumCoverView *preMiniPlayerAlbumCoverView;
@property (weak, nonatomic) MBMiniPlayerAlbumCoverView *currentMiniPlayerAlbumCoverView;
@property (weak, nonatomic) MBMiniPlayerAlbumCoverView *nextMiniPlayerAlbumCoverView;

@end

@implementation MBMiniPlayerView


+ (MBMiniPlayerView *)shareMiniPlayerView {
    static MBMiniPlayerView *miniPlayerView;
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        miniPlayerView = [[[NSBundle mainBundle] loadNibNamed:@"MBMiniPlayerView" owner:nil options:nil] lastObject];
        miniPlayerView.frame = CGRectMake(0, MBScreenHeight - MBMiniPlayerViewHeight, MBScreenWidth, MBMiniPlayerViewHeight);
        
        [miniPlayerView setupScrollView];
    });
    
    return miniPlayerView;
}

- (void)setupScrollView {
    CGFloat scrollViewWidth = MBScreenWidth - MBPlayOrPauseButtonWidth - MBPlaylistButtonWidth - MBButtonMargin * 3;
    CGFloat scrollViewHeight = self.height - MBSeparatorViewHeight;
    self.scrollView.frame = CGRectMake(0, MBSeparatorViewHeight, scrollViewWidth, scrollViewHeight);
    self.scrollView.contentSize = CGSizeMake(self.scrollView.width * 3, self.scrollView.height);
    
    self.preMiniPlayerAlbumCoverView = [MBMiniPlayerAlbumCoverView miniPlayerAlbumCoverView];
    self.preMiniPlayerAlbumCoverView.frame = CGRectMake(0, self.scrollView.y, self.scrollView.width , self.scrollView.height);
    [self.scrollView addSubview:self.preMiniPlayerAlbumCoverView];
    
    self.currentMiniPlayerAlbumCoverView = [MBMiniPlayerAlbumCoverView miniPlayerAlbumCoverView];
    self.currentMiniPlayerAlbumCoverView.frame = CGRectMake(self.scrollView.width, self.scrollView.y, self.scrollView.width , self.scrollView.height);
    [self.scrollView addSubview:self.currentMiniPlayerAlbumCoverView];
    
    self.nextMiniPlayerAlbumCoverView = [MBMiniPlayerAlbumCoverView miniPlayerAlbumCoverView];
    self.nextMiniPlayerAlbumCoverView.frame = CGRectMake(self.scrollView.width * 2, self.scrollView.y, self.scrollView.width , self.scrollView.height);
    [self.scrollView addSubview:self.nextMiniPlayerAlbumCoverView];
    
    
    self.scrollView.contentOffset = CGPointMake(self.scrollView.width, 0);
}

- (IBAction)tapPlayOrPauseButtonAction:(UIButton *)sender {
    
}

- (IBAction)tapPlaylistButtonAction:(UIButton *)sender {
    
}


@end
