//
//  UIViewController+Extension.m
//  MyBarMusic
//
//  Created by lijingui2010 on 16/5/27.
//  Copyright © 2016年 MyBar. All rights reserved.
//

#import "UIViewController+Extension.h"

@implementation UIViewController (Extension)

- (MBMiniPlayerView *)setupMiniPlayerView {
    MBMiniPlayerView *miniPlayerView = [MBMiniPlayerView shareMiniPlayerView];
    [self.view addSubview:miniPlayerView];
    
    return miniPlayerView;
}

@end
