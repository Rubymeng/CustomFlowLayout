//
//  ProductCollectionViewCell.m
//  CustomFlowLayout
//
//  Created by tyhmeng on 16/10/27.
//  Copyright © 2016年 tyhmeng. All rights reserved.
//

#import "ProductCollectionViewCell.h"
#import "ProductCoat.h"
#import "UIImageView+WebCache.h"


@interface ProductCollectionViewCell ()
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UILabel *priceLabel;

@end

@implementation ProductCollectionViewCell


- (void)setProductCoat:(ProductCoat *)productCoat
{

    _productCoat = productCoat;
    self.priceLabel.text = [NSString stringWithFormat:@"价格是%@",productCoat.price];
    
    [self.imageView sd_setImageWithURL:[NSURL URLWithString:productCoat.img] placeholderImage:[UIImage imageNamed:@"12.jpg"]];


}


@end
