//
//  MBMusic.h
//  MyBarMusic
//
//  Created by lijingui2010 on 16/5/25.
//  Copyright © 2016年 MyBar. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MBMusicInfo : NSObject

//@property (nonatomic, strong) NSString *ID;           // 歌曲的id
//@property (nonatomic, strong) NSString *title;        // 歌曲的名称
//@property (nonatomic, strong) NSString *mp3Url;       // 歌曲的Url
//@property (nonatomic, strong) NSString *picUrl;       // 歌曲的图片Url
//@property (nonatomic, strong) NSString *blurPicUrl;   // 歌曲的模糊图片Url
//@property (nonatomic, strong) NSString *album;        // 歌曲的专辑
//@property (nonatomic, strong) NSString *artist;       // 歌曲的歌手
//@property (nonatomic, strong) NSString *duration;     // 歌曲的时长
//@property (nonatomic, strong) NSString *author;       // 歌曲的作者

@property (nonatomic, copy) NSString *title;            // 歌曲的名称
@property (nonatomic, copy) NSString *artist;           // 歌曲的歌手
@property (nonatomic, copy) NSString *albumName;        // 歌曲的专辑
@property (nonatomic, strong) UIImage *artwork;         // 歌曲的图片
@property (nonatomic, copy) NSString *urlStr;             // 歌曲的路径

@end
