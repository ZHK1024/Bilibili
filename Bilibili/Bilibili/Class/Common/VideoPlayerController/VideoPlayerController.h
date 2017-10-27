//
//  VideoPlayerController.h
//  Bilibili
//
//  Created by Apple-T on 16/9/23.
//  Copyright © 2016年 Apple-T. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <IJKMediaFramework/IJKMediaFramework.h>

@interface VideoPlayerController : UIViewController

@property (nonatomic, strong) NSURL                 *url;
@property (nonatomic, strong) id <IJKMediaPlayback>  player;
@property (nonatomic, strong) UIView                *playerView;

@property (nonatomic, assign) BOOL interfaceOrientation;

@end
