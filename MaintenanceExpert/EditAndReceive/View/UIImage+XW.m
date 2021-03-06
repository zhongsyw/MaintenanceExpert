//
//  UIImage+XW.m
//  Spread
//
//  Created by koka on 16/10/18.
//  Copyright © 2016年 ZSYW. All rights reserved.
//

#import "UIImage+XW.h"

@implementation UIImage (XW)

+ (UIImage *)imageWithCaputureView:(UIView *)view
{
    CGSize size = CGSizeMake(view.bounds.size.width, view.bounds.size.height*1.0);
    
    // 开启位图上下文
    UIGraphicsBeginImageContextWithOptions(size, NO, 0);
    
    // 获取上下文
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    // 把控件上的图层渲染到上下文,layer只能渲染
    [view.layer renderInContext:ctx];
    
    // 生成新图片
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    
    // 关闭上下文
    UIGraphicsEndImageContext();
    
    return image;
}


@end
