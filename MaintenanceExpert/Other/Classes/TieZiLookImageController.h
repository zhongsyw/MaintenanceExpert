//
//  TieZiLookImageController.h
//  好逑
//
//  Created by 訾玉洁 on 16/2/23.
//  Copyright © 2016年 bandaochina. All rights reserved.
//

#import <UIKit/UIKit.h>

@class TieZiLookImageController;
@protocol TieZiLookImageControllerDelegate <NSObject>

//删除图片之后你要做的事情，一般你得更新frame
- (void)onDeleteImage;
- (void)didDelete:(NSInteger)index;

@end

@interface TieZiLookImageController : UIViewController

@property (nonatomic,weak) id<TieZiLookImageControllerDelegate> delegate; //代理

@property (nonatomic,strong) NSMutableArray   *imageUrlList;//网络图片数组

@property (nonatomic, assign) NSInteger        imageIndex; //imageView 的tag

@property (nonatomic,strong) NSMutableArray   *imageList; //真实存在图片数组

@end
