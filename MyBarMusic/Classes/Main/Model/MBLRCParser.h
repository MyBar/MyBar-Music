//
//  MBLRCParser.h
//  MyBarMusic
//
//  Created by lijingui2010 on 16/5/25.
//  Copyright © 2016年 MyBar. All rights reserved.
//

#import <Foundation/Foundation.h>

//[ar:龙梅子 老猫]
//[ti:漂亮的姑娘就要嫁人啦]
//[al:漂亮的姑娘就要嫁人啦]
//[by:津云制作]
//[00:02.40]漂亮的姑娘就要嫁人啦

@interface MBLRCParser : NSObject

@property (nonatomic, strong) NSString	*artist;    // 歌曲的歌手
@property (nonatomic, strong) NSString	*title;     // 歌曲的名称
@property (nonatomic, strong) NSString 	*album;     // 歌曲的专辑
@property (nonatomic, strong) NSString 	*byWorker;  // 歌词的制作人
@property (nonatomic, assign) NSInteger offset;     // 歌词的偏移
@property (nonatomic, strong) NSMutableDictionary *lrcDictionary; // 时间对应的歌词

- (void)parseLRCWithPath:(NSString *)lrcPath;

@end

