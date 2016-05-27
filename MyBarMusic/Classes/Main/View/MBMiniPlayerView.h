//
//  MBToolbarView.h
//  MyBarMusic
//
//  Created by lijingui2010 on 16/5/24.
//  Copyright © 2016年 MyBar. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MBMiniPlayerAlbumCoverView.h"

#define MBSeparatorViewHeight 1
#define MBPlayOrPauseButtonWidth 40
#define MBPlayOrPauseButtonHeight 40
#define MBPlaylistButtonWidth 40
#define MBPlaylistButtonHeight 40
#define MBButtonMargin 8

@class MBMiniPlayerView;

@protocol MBMiniPlayerViewDelegate <NSObject>

@optional
- (void)miniPlayerView:(MBMiniPlayerView *)miniPlayerView didClickScrollView:(UIScrollView *)scrollView;
- (void)miniPlayerView:(MBMiniPlayerView *)miniPlayerView didClickPlayOrPauseButton:(UIButton *)playOrPauseButton;
- (void)miniPlayerView:(MBMiniPlayerView *)miniPlayerView didClickPlaylistButton:(UIButton *)playlistButton;

@end

@interface MBMiniPlayerView : UIView

@property(assign, nonatomic, getter = isEnabled) BOOL enabled;
@property (nonatomic, weak) id<MBMiniPlayerViewDelegate> delegate;

+ (MBMiniPlayerView *)shareMiniPlayerView;

@end
