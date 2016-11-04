//
//  ZSHomeTableViewCell.h
//  MaintenanceExpert
//
//  Created by xpc on 16/10/25.
//  Copyright © 2016年 ZSYW. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZSHomeTableViewCell : UITableViewCell

@property (strong, nonatomic) IBOutlet UIImageView *newsImg;

@property (strong, nonatomic) IBOutlet UILabel *newsTitle;

@property (strong, nonatomic) IBOutlet UILabel *newsContent;

@property (strong, nonatomic) IBOutlet UILabel *newsTime;

@end
