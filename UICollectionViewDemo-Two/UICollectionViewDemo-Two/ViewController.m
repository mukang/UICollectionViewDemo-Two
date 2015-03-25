//
//  ViewController.m
//  UICollectionViewDemo-Two
//
//  Created by 穆康 on 15/3/21.
//  Copyright (c) 2015年 穆康. All rights reserved.
//

#import "ViewController.h"
#import "MKCollectionViewCell.h"
#import "MKCircleLayout.h"
#import "MKStackLayout.h"

@interface ViewController () <UICollectionViewDataSource, UICollectionViewDelegate>

@property (nonatomic, strong) NSMutableArray *images;

@property (nonatomic, weak) UICollectionView *collectionView;

@end

@implementation ViewController

static NSString * const ID = @"image";

#pragma mark - 懒加载

- (NSMutableArray *)images {
    
    if (_images == nil) {
        
        _images = [[NSMutableArray alloc] init];
        
        for (int i=1; i<=20; i++) {
            
            [_images addObject:[NSString stringWithFormat:@"%d", i]];
        }
    }
    
    return _images;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    MKCircleLayout *layout = [[MKCircleLayout alloc] init];
    
    UICollectionView *collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 100, self.view.frame.size.width, 300) collectionViewLayout:layout];
    
    collectionView.dataSource = self;
    
    collectionView.delegate = self;
    
    [collectionView registerNib:[UINib nibWithNibName:@"MKCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:ID];
    
    [self.view addSubview:collectionView];
    
    self.collectionView = collectionView;
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    
    if ([self.collectionView.collectionViewLayout isKindOfClass:[MKCircleLayout class]]) {
        
        [self.collectionView setCollectionViewLayout:[[MKStackLayout alloc] init] animated:YES];
        
    } else {
        
        [self.collectionView setCollectionViewLayout:[[MKCircleLayout alloc] init] animated:YES];
    }
}

#pragma mark - <UICollectionViewDataSource>

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    
    return self.images.count;
}

- (MKCollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    MKCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:ID forIndexPath:indexPath];
    
    cell.image = self.images[indexPath.item];
    
    return cell;
}

#pragma mark - <UICollectionViewDelegate>

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    
    // 删除图片名
    [self.images removeObjectAtIndex:indexPath.item];
    
    // 直接刷新数据源没有动画效果
//    [self.collectionView reloadData];
    
    // 直接将cell删除
    [self.collectionView deleteItemsAtIndexPaths:@[indexPath]];
}


@end
