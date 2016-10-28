//
//  ViewController.m
//  CustomFlowLayout
//
//  Created by tyhmeng on 16/10/27.
//  Copyright © 2016年 tyhmeng. All rights reserved.
//

#import "ViewController.h"
#import "ProductCollectionViewCell.h"
#import "FlowLayout.h"
#import "ProductCoat.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet FlowLayout *flowLayout;



@property (nonatomic,strong) NSMutableArray *prducts;

@end

@implementation ViewController

-(NSMutableArray *)prducts {

    if (_prducts == nil) {
        NSString *path = [[NSBundle mainBundle] pathForResource:@"1.plist" ofType:nil];
        
        NSArray *temp = [NSArray arrayWithContentsOfFile:path];
        
        NSMutableArray *prs = [NSMutableArray array];
        for (NSDictionary *dict in temp) {
            ProductCoat *proCoat = [ProductCoat productCoatWithDict:dict];
            [prs addObject:proCoat];
            
        }
        self.prducts = prs;
    }

    return _prducts;

}

- (void)viewDidLoad {
    [super viewDidLoad];
    //设置数据  拿到里面的宽 高
    self.flowLayout.products = self.prducts;
    //    设置列数
    self.flowLayout.colCount = 4;
    
}

- (IBAction)loadMoreData:(id)sender {
    NSString *paths = [[NSBundle mainBundle] pathForResource:@"2.plist" ofType:nil];
    NSArray *tem = [NSArray arrayWithContentsOfFile:paths];
    for (NSDictionary *dict  in tem) {
        ProductCoat *coat = [ProductCoat productCoatWithDict:dict];
        [self.prducts addObject:coat];
    }
    
    [self.collectionView reloadData];
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {

    return self.prducts.count;

}


- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {

    ProductCollectionViewCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    cell.productCoat = self.prducts[indexPath.item];
    
    return cell;


}


- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath {

    if (kind == UICollectionElementKindSectionFooter) {
        UICollectionReusableView *footer = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:@"footer" forIndexPath:indexPath];
        
        return footer;
    }

    return nil;

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
