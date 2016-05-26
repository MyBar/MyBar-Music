//
//  MBMiniPlayerAlbumCoverView.h
//  MyBarMusic
//
//  Created by lijingui2010 on 16/5/24.
//  Copyright © 2016年 MyBar. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MBMiniPlayerAlbumCoverView : UIView

@property (weak, nonatomic) IBOutlet UIImageView *albumImageView;

@property (weak, nonatomic) IBOutlet UILabel *nameLabel;

@property (weak, nonatomic) IBOutlet UILabel *lyricLabel;

+ (instancetype)miniPlayerAlbumCoverView;

@end
