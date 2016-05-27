//
//  MBPlayer.h
//  MyBarMusic
//
//  Created by lijingui2010 on 16/5/27.
//  Copyright © 2016年 MyBar. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MBMusicInfo.h"

@interface MBPlayerManager : NSObject

+ (MBPlayerManager *)sharePlayerManager;

/*
 *获取播放列表中的歌曲:通过外部点击的行数确定是在音乐列表中的哪一条数据 然后将歌曲的模型返回
 *@param index获取哪一个
 *@retun 返回对应歌曲
 */
- (MBMusicInfo *)getMusicWithIndex:(NSUInteger)index;

@end
