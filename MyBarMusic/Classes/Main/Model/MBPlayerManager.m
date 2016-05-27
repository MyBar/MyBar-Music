//
//  MBPlayer.m
//  MyBarMusic
//
//  Created by lijingui2010 on 16/5/27.
//  Copyright © 2016年 MyBar. All rights reserved.
//

#import "MBPlayerManager.h"
@import AVFoundation;

@interface MBPlayerManager ()

@property (nonatomic,strong) NSMutableArray<MBMusicInfo *> *playlist; // 歌曲播放列表
@property (nonatomic,strong) AVPlayer *avPlayer; // 播放器属性
@property (nonatomic,strong) NSTimer *timer;  // 定时器
@property (nonatomic,assign) NSInteger currentIndex;  // 当前的音乐下标

@end

@implementation MBPlayerManager

- (instancetype)init
{
    self = [super init];
    if (self) {
        
    }
    return self;
}

+ (MBPlayerManager *)sharePlayerManager {
    static MBPlayerManager *_sharePlayerManager;
    
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        _sharePlayerManager = [[MBPlayerManager alloc]init];
    });
    
    return _sharePlayerManager;
}

// 通过外部点击的行数确定是在音乐列表中的哪一条数据 然后将歌曲的模型返回
- (MBMusicInfo *)getMusicWithIndex:(NSUInteger)index {
    return self.playlist[index];
}

#pragma make - Lazy loading Method  懒加载
- (NSMutableArray *)playlist {
    if (!_playlist) {
        _playlist = [NSMutableArray array];
    }
    return _playlist;
}

- (AVPlayer *)avPlayer {
    if (!_avPlayer) {
        _avPlayer = [[AVPlayer alloc]init];
    }
    return _avPlayer;
}

@end
