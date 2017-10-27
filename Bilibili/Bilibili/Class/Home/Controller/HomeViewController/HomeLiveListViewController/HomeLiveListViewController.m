//
//  HomeLiveListViewController.m
//  Bilibili
//
//  Created by Apple-T on 16/9/20.
//  Copyright © 2016年 Apple-T. All rights reserved.
//

#import "HomeLiveListViewController.h"
#import "CodeDefinition.h"
#import <AFNetworking.h>
#import "GeneralCollectionCell.h"
#import "LiveCategoryModel.h"
#import "VideoPlayerController.h"


#define CELL_GAP 10.0

@interface HomeLiveListViewController () <UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout>

@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic, strong) NSMutableArray *dataSource;

@end

@implementation HomeLiveListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.frame = FRAME(0, 0, SCREEN_BOUNDS.size.width, SCREEN_BOUNDS.size.height - 64 - 49);
    [self.view addSubview:self.collectionView];
    
//    推荐
//    http://live.bilibili.com/AppNewIndex/recommend?actionKey=appkey&appkey=27eb53fc9058f8c3&build=3710&buvid=245624b4847a0f8f483e82dc8fda94f5&device=phone&mobi_app=iphone&platform=ios&scale=2&sign=ed752ec9eee0709ad5bf2f7b97ceb525&ts=1474359415
    
    [self getDataFromServer];
    

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Data

- (void)getDataFromServer {
    WS(ws);
    [[AFHTTPSessionManager manager] GET:@"http://live.bilibili.com/AppNewIndex/common?scale=3&device=phone&platform=ios" parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        [ws dataFormat:responseObject];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
    }];
}

- (void)dataFormat:(NSDictionary *)data {
    NSLog(@"responseObject = %@", data[@"data"][@"partitions"]);
    
    
//    NSDictionary *dic = data[@"data"][@"partitions"][0][@"lives"][0];
//    
//    for (id key in [dic allKeys]) {
//        NSLog(@"%@ => %@", key, [dic[key] class]);
//    }
    
    
    [self formatPartitions:data[@"data"][@"partitions"]];
    [self.collectionView reloadData];
}

- (void)formatPartitions:(NSArray *)data {
    if (![data isKindOfClass:[NSArray class]]) {
        return;
    }
    
    for (NSDictionary *dataDic in data) {
        LiveCategoryModel *liveCategory = [[LiveCategoryModel alloc] initWithDataDic:dataDic];
        [self.dataSource addObject:liveCategory];
    }
}

#pragma mark - Collection view dataSource

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return self.dataSource.count;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    LiveCategoryModel *liveCategory = self.dataSource[section];
    return liveCategory.livesArray.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    GeneralCollectionCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    LiveCategoryModel *liveCategory = self.dataSource[indexPath.section];
    cell.live = liveCategory.livesArray[indexPath.row];
    return cell;
}

#pragma mark - Collection view delegate

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    LiveCategoryModel *liveCategory = self.dataSource[indexPath.section];
    LiveModel *live = liveCategory.livesArray[indexPath.row];
    VideoPlayerController *videoVC = [[VideoPlayerController alloc] init];
    videoVC.url = [NSURL URLWithString:live.playurl];
//    IJKAVMoviePlayerController *playerVC = [[IJKAVMoviePlayerController alloc] initWithContentURLString:live.playurl];
//    [self.navigationController pushViewController:videoVC animated:YES];
    videoVC.interfaceOrientation = YES;
    [self presentViewController:videoVC animated:YES completion:nil];
}

#pragma mark - Collection delegate flowLayout

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    CGFloat width = (SCREEN_BOUNDS.size.width - CELL_GAP * 3) / 2;
    CGFloat height = width * (180.0 / 320.0) + 40.0;
    return CGSizeMake(width, height);
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    return UIEdgeInsetsMake(CELL_GAP, CELL_GAP, CELL_GAP, CELL_GAP);
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section {
    return CELL_GAP;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section {
    return CELL_GAP;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section {
    return CGSizeMake(320, 50);
}
//- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section;

#pragma mark - Getter

- (UICollectionView *)collectionView {
    if (_collectionView == nil) {
        UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
        flowLayout.itemSize = CGSizeMake(100, 100);
        self.collectionView = [[UICollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:flowLayout];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        _collectionView.backgroundColor = [UIColor whiteColor];
        [_collectionView registerClass:[GeneralCollectionCell class] forCellWithReuseIdentifier:@"cell"];
    }
    return _collectionView;
}

- (NSMutableArray *)dataSource {
    if (_dataSource == nil) {
        self.dataSource = [NSMutableArray new];
    }
    return _dataSource;
}

@end
