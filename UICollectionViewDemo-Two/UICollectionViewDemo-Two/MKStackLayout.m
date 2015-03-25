//
//  MKStackLayout.m
//  UICollectionViewDemo-Two
//
//  Created by 穆康 on 15/3/25.
//  Copyright (c) 2015年 穆康. All rights reserved.
//

#define MKCollectionViewWidth self.collectionView.frame.size.width

#define MKCollectionViewHeight self.collectionView.frame.size.height

#import "MKStackLayout.h"

@implementation MKStackLayout

/**
 *  完全自定义
 */
- (NSArray *)layoutAttributesForElementsInRect:(CGRect)rect {
    
    NSMutableArray *array = [NSMutableArray array];
    
    NSInteger count = [self.collectionView numberOfItemsInSection:0];
    
    for (NSInteger i = 0; i < count; i++) {
        
        NSIndexPath *indexPath = [NSIndexPath indexPathForItem:i inSection:0];
        
        UICollectionViewLayoutAttributes *attrs = [self layoutAttributesForItemAtIndexPath:indexPath];
        
        [array addObject:attrs];
    }
    
    return array;
}

- (UICollectionViewLayoutAttributes *)layoutAttributesForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    UICollectionViewLayoutAttributes *attrs = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:indexPath];
    
    attrs.center = CGPointMake(MKCollectionViewWidth * 0.5, MKCollectionViewHeight * 0.5);
    
    attrs.size = CGSizeMake(100, 100);
    
    // 设置层叠顺序
    attrs.zIndex = - indexPath.item;
    
    if (indexPath.item == 0) {
        
        return attrs;
    }
    
    if (indexPath.item > 4) {
        
        attrs.hidden = YES;
        
        return attrs;
    }
    
    NSArray *angles = @[@0, @(-0.2), @(0.2), @(-0.5), @(0.5)];
    
    CGFloat angle = [angles[indexPath.item] doubleValue];
    
    attrs.transform = CGAffineTransformMakeRotation(angle);
    
    return attrs;
}


@end
