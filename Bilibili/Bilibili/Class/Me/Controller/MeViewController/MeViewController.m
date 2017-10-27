//
//  MeViewController.m
//  Bilibili
//
//  Created by Apple-T on 16/9/23.
//  Copyright © 2016年 Apple-T. All rights reserved.
//

#import "MeViewController.h"
#import "VideoPlayerController.h"
#import "CodeDefinition.h"
#import <Masonry.h>

@interface MeViewController ()


@end

@implementation MeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationController.navigationBarHidden = YES;

    VideoPlayerController *videoVC = [[VideoPlayerController alloc] init];
    videoVC.url = [NSURL URLWithString:@"http://dl.live-play.acgvideo.com/live-dl/749463/live_28331819_9666305.flv?wsSecret=e6d1451034b27ec41635bd799fd29b9d&wsTime=1508223722"];
//
    [self.navigationController.navigationBar setHidden:YES];
    self.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:videoVC animated:YES];
//    [self.navigationController.tabBarController presentViewController:videoVC animated:YES completion:nil];
    
    
//    0.58 + 0.42 * 1.2  = 1.084
//    0.58 + 0.42 * 1.25 = 1.105
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end
