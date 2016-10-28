//
//  FlowLayout.m
//  CustomFlowLayout
//
//  Created by tyhmeng on 16/10/27.
//  Copyright © 2016年 tyhmeng. All rights reserved.
//

#import "FlowLayout.h"

#import "ProductCoat.h"

@interface FlowLayout ()

@property (nonatomic,strong) NSMutableArray *arr;


@end


@implementation FlowLayout


- (NSMutableArray *)arr {

    if (_arr == nil) {
        _arr = [NSMutableArray array];
        
    }

    return _arr;
}

/**
 *  当collectionView修改布局的时候 会调用该方法  
 一般在这个方法里设置准备工作 如 ：itemsize   滚动方向  内边距  。如果不设置就是默认storyboard中的
 */
- (void)prepareLayout {
    [super prepareLayout];
    
    NSMutableArray *ar = [NSMutableArray array];

//内容的宽度
    
    CGFloat contentW = self.collectionView.frame.size.width - self.sectionInset.left - self.sectionInset.right - (self.colCount - 1) * self.minimumInteritemSpacing;

//    item宽度
    
    CGFloat itemW = contentW/self.colCount;
    
    CGFloat itemH = 0;
//    定义c语言数组
    CGFloat colHeight[self.colCount];
    
    for (int j = 0; j < self.colCount; j++) {
        colHeight[j] = self.sectionInset.top;
    }
    
    for (int i = 0; i < self.products.count; i ++) {
        ProductCoat *product = self.products[i];
//        item的高度
        itemH = product.h/product.w *itemW;
//        创建UICollectionViewLayoutAttributes对象  保存每个item 的frame
        
        NSIndexPath *indexPath = [NSIndexPath indexPathForItem:i inSection:0];
        
        UICollectionViewLayoutAttributes *attributes = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:indexPath];
        
//        获取行高最短的一列   保证加一个 item  的时候添加在最短的那一列上面
        CGFloat temp = colHeight[0];
        int  min = 0;
        
        for (int a = 1; a < self.colCount; a ++) {
            if (temp > colHeight[a]) {
                temp = colHeight[a];
                min = a;
                
            }
        }
        
//        特别注意  放在哪个位置  也就是第几列  和x y  值都有联系
        
        CGFloat itemX = self.sectionInset.left + min * (self.minimumInteritemSpacing + itemW);
        
        attributes.frame = CGRectMake(itemX, temp, itemW, itemH);
        
        colHeight[min] = temp + itemH +self.minimumInteritemSpacing;
        [ar addObject:attributes];
        
    }
    
    
    //判断哪一列最高
    CGFloat maxHeight = 0;
    
    for ( int j = 0; j <self.colCount; j ++) {
        
        
        if (maxHeight < colHeight[j]) {
            
            maxHeight = colHeight[j];
        }
    }
    
    
    //计算总数 total
    
    int total;
    
    for (int q = 0; q < MAXFLOAT; q ++) {
        
        if (((int)self.products.count + q ) % self.colCount == 0) {
            
            total = (int)self.products.count + q;
            break;
        }
    }
    
    
    self.itemSize = CGSizeMake(itemW, (maxHeight - self.sectionInset.top) * self.colCount / total);
    
    
    NSIndexPath *footerIndexPath = [NSIndexPath indexPathForItem:0 inSection:0];
    
    UICollectionViewLayoutAttributes *footerAtt = [UICollectionViewLayoutAttributes layoutAttributesForSupplementaryViewOfKind:UICollectionElementKindSectionFooter withIndexPath:footerIndexPath];
    
    footerAtt.frame = CGRectMake(0, maxHeight, self.collectionView.frame.size.width, 100);
    
    [ar addObject:footerAtt];
    
    
    self.arr = ar;
    
   
}


//返回一个数组  数组里面盛放的是  UICollectionViewLayoutAttributes 对象  布局属性
//UICollectionViewLayoutAttributes  里面的frame 正好对应item的frame
//是根据 itemSize 自动算出来的 如果想改变每个的位置,提前计算出来,并且创建 布局属性保存
- (NSArray<UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect
{
    NSLog(@"%@",self.arr);
    
    return  self.arr;
}



@end
