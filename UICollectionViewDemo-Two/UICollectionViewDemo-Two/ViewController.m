//
//  ViewController.m
//  UICollectionViewDemo-Two
//
//  Created by 穆康 on 15/3/21.
//  Copyright (c) 2015年 穆康. All rights reserved.
//

#import "ViewController.h"
#import "MKCollectionViewCell.h"
#import "MKCollectionViewLayout.h"

@interface ViewController () <UICollectionViewDataSource>

@property (nonatomic, strong) NSMutableArray *images;

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
    
    MKCollectionViewLayout *layout = [[MKCollectionViewLayout alloc] init];
    
    UICollectionView *collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 100, self.view.frame.size.width, 300) collectionViewLayout:layout];
    
    collectionView.dataSource = self;
    
    [collectionView registerNib:[UINib nibWithNibName:@"MKCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:ID];
    
    [self.view addSubview:collectionView];
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



@end
