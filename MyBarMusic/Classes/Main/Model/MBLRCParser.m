//
//  MBLRCParser.m
//  MyBarMusic
//
//  Created by lijingui2010 on 16/5/25.
//  Copyright © 2016年 MyBar. All rights reserved.
//

#import "MBLRCParser.h"

@implementation MBLRCParser

- (void)parseLRCWithPath:(NSString *)lrcPath {
    NSError *error;
    NSString *lrcContent = [NSString stringWithContentsOfFile:lrcPath encoding:NSUTF8StringEncoding error:&error];
    
    NSString *propertyLines = [lrcContent substringToIndex:[lrcContent rangeOfString:@"[00:"].location];
    MBLog(@"property-->%@-->property", propertyLines);
    [self parseProperties:propertyLines];
    
    lrcContent = [lrcContent substringFromIndex:[lrcContent rangeOfString:@"[00:"].location];
    lrcContent = [lrcContent stringByTrimmingCharactersInSet:[NSCharacterSet newlineCharacterSet]];
    NSArray *lrcLines = [lrcContent componentsSeparatedByString:@"\n"];
    [self parseLRCLine:lrcLines];
}

/** 以下的行就是歌词文件的 property 行
 
[ar:龙梅子 老猫]
[ti:漂亮的姑娘就要嫁人啦]
[al:漂亮的姑娘就要嫁人啦]
[by:津云制作]
 
*/
- (void)parseProperties:(NSString *)propertyString{
    propertyString = [propertyString stringByTrimmingCharactersInSet:[NSCharacterSet newlineCharacterSet]];
    MBLog(@"%@-->parser", propertyString);
    NSArray *properties = [propertyString componentsSeparatedByString:@"\n"];
    for(NSString *propertyLine in properties){
        if([propertyLine length] > 0){
            NSArray *tmpArray = [propertyLine componentsSeparatedByString:@":"];
            NSString *propertyName = [tmpArray objectAtIndex:0];
            if([propertyName isEqualToString:@"[ar"]){
                self.artist = [[tmpArray objectAtIndex:1] stringByReplacingOccurrencesOfString:@"]" withString:@""];
            }else if([propertyName isEqualToString:@"[ti"]){
                self.title = [[tmpArray objectAtIndex:1] stringByReplacingOccurrencesOfString:@"]" withString:@""];
            }else if([propertyName isEqualToString:@"[al"]){
                self.album = [[tmpArray objectAtIndex:1] stringByReplacingOccurrencesOfString:@"]" withString:@""];
            }else if([propertyName isEqualToString:@"[by"]){
                self.byWorker = [[tmpArray objectAtIndex:1] stringByReplacingOccurrencesOfString:@"]" withString:@""];
            }else if([propertyName isEqualToString:@"[offset"]){
                NSString *offsetStr = [[tmpArray objectAtIndex:1] stringByReplacingOccurrencesOfString:@"]" withString:@""];
                self.offset = [offsetStr intValue];
            }
        }
    }
}

/** 以下的行就是歌词文件的 LRC 行
 
 [00:02.40]漂亮的姑娘就要嫁人啦

*/
- (void)parseLRCLine:(NSArray *)lrcLines {
    self.lrcDictionary = [NSMutableDictionary dictionary];
    
    //遍历使用"\n"拆解后的每行字符串
    for (int i = 0; i < lrcLines.count; i++) {
        //取得每行字符串:"[00:02.40]漂亮的姑娘就要嫁人啦"
        NSString *lineString = [lrcLines objectAtIndex:i];
        //在使用"]"拆解每行字符串后的结果["[00:02.40", "漂亮的姑娘就要嫁人啦"]
        NSArray *lineArray = [lineString componentsSeparatedByString:@"]"];
        
        if ([lineArray[0] length] > 8) {
            
            NSString *str1 = [lineString substringWithRange:NSMakeRange(3, 1)];
            
            NSString *str2 = [lineString substringWithRange:NSMakeRange(6, 1)];
            
            if ([str1 isEqualToString:@":"] && [str2 isEqualToString:@"."]) {
                
                for (int i = 0; i < lineArray.count - 1; i++) {
                    
                    NSString *lrcString = [lineArray objectAtIndex:lineArray.count - 1];
                    
                    //求歌词时间
                    NSString *timeString = [lineArray objectAtIndex:i];
                    NSInteger startedTime = [[timeString substringWithRange:NSMakeRange(1,2)] intValue];
                    startedTime = startedTime * 60 + [[timeString substringWithRange:NSMakeRange(4,2)] intValue];
                    startedTime = startedTime * 1000 + [[timeString substringWithRange:NSMakeRange(7,2)] intValue];
                    timeString = [NSString stringWithFormat:@"%ld", startedTime];
                    
                    if (!self.lrcDictionary) {
                        self.lrcDictionary = [NSMutableDictionary dictionary];
                    }
                    
                    //把时间 和 歌词 加入词典
                    [self.lrcDictionary setObject:lrcString forKey:timeString];
                }
            }
        }
    }
}

@end
