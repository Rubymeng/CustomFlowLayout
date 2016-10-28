//
//  ProductCoat.h
//  CustomFlowLayout
//
//  Created by tyhmeng on 16/10/27.
//  Copyright © 2016年 tyhmeng. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface ProductCoat : NSObject


/**
 *  <dict>
 <key>h</key>
 <integer>275</integer>
 <key>img</key>
 <string>http://s13.mogujie.cn/b7/bao/131012/vud8_kqywordekfbgo2dwgfjeg5sckzsew_310x426.jpg_200x999.jpg</string>
 <key>price</key>
 <string>¥169</string>
 <key>w</key>
 <integer>200</integer>
	</dict>
 */


@property (nonatomic,assign) CGFloat h;
@property (nonatomic,assign) CGFloat w;
@property (nonatomic,copy) NSString *img;
@property (nonatomic,copy) NSString *price;


- (instancetype)initWithDict:(NSDictionary *)dict;
+ (instancetype)productCoatWithDict:(NSDictionary *)dict;



@end
