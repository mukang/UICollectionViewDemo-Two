//
//  MKCollectionViewLayout.m
//  UICollectionViewDemo-Two
//
//  Created by 穆康 on 15/3/21.
//  Copyright (c) 2015年 穆康. All rights reserved.
//

#define MKCollectionViewWidth self.collectionView.frame.size.width

#define MKCollectionViewHeight self.collectionView.frame.size.height

#import "MKCollectionViewLayout.h"

@implementation MKCollectionViewLayout


///  决定 cell 怎么排布
- (NSArray *)layoutAttributesForElementsInRect:(CGRect)rect {
    
    NSMutableArray *array = [NSMutableArray array];
    
    NSInteger count = [self.collectionView numberOfItemsInSection:0];
    
    // 半径
    CGFloat radius = 120;
    
    // 圆心
    CGFloat centerX = MKCollectionViewWidth * 0.5;
    
    CGFloat centerY = MKCollectionViewHeight * 0.5;
    
    for (int i=0; i<count; i++) {
        
        // 创建i位置的cell对应的indexPath
        NSIndexPath *indexPath = [NSIndexPath indexPathForItem:i inSection:0];
        
        // 创建i位置cell对应的布局属性
        UICollectionViewLayoutAttributes *attrs = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:indexPath];
        
        attrs.size = CGSizeMake(60, 60);
        
        if (count == 1) {
            
            attrs.center = CGPointMake(centerX, centerY);
            
        } else {
            
            CGFloat angle = 2 * M_PI / count * indexPath.item;
            
            CGFloat attrsCenterX = centerX - radius * cos(angle);
            
            CGFloat attrsCenterY = centerY - radius * sin(angle);
            
            attrs.center = CGPointMake(attrsCenterX, attrsCenterY);
        }
        
        // 添加布局属性
        [array addObject:attrs];
    }
    
    return array;
}






@end
