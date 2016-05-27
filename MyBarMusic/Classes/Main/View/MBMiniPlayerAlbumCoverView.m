//
//  MBMiniPlayerAlbumCoverView.m
//  MyBarMusic
//
//  Created by lijingui2010 on 16/5/24.
//  Copyright © 2016年 MyBar. All rights reserved.
//

#import "MBMiniPlayerAlbumCoverView.h"

@implementation MBMiniPlayerAlbumCoverView

+ (instancetype)miniPlayerAlbumCoverView
{
    MBMiniPlayerAlbumCoverView *miniPlayerAlbumCoverView = [[[NSBundle mainBundle] loadNibNamed:@"MBMiniPlayerAlbumCoverView" owner:nil options:nil] lastObject];
    
    miniPlayerAlbumCoverView.albumImageView.layer.cornerRadius = miniPlayerAlbumCoverView.albumImageView.width * 0.5;
    miniPlayerAlbumCoverView.albumImageView.layer.masksToBounds = YES;
    
    return miniPlayerAlbumCoverView;
}

@end
