//
//  OneViewController.m
//  XWPopMenuVCDemo
//
//  Created by koka on 16/10/18.
//  Copyright © 2016年 ZSYW. All rights reserved.
//
/**
 *  这是详细下单页面
 *
 */

#import "OneViewController.h"



@interface OneViewController ()<UITableViewDataSource,UITableViewDelegate>
{
    UITableView *_tableview;
    UITableViewCell *_Areacell;
    
}

@end

@implementation OneViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.view setBackgroundColor:[UIColor whiteColor]];
    //初始化
    [self inittableview];
    
    //添加取消按钮->
    [self addCancelBtn];
}

- (void)inittableview {
    
    _tableview = [[UITableView alloc]initWithFrame:CGRectMake(5, 70, KScreenWidth - 10, KScreenHeight - 70) style:UITableViewStyleGrouped];
    _tableview.delegate = self;
    _tableview.dataSource = self;
    _tableview.showsHorizontalScrollIndicator = NO;
    _tableview.showsVerticalScrollIndicator = YES;
    [self.view addSubview:_tableview];
    [_tableview registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    
    _Areacell = [[UITableViewCell alloc]init];
    
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    
    NSString *str = [NSString stringWithFormat:@"cell%ld ",section];
    return str;
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 12;
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    
    return 5;
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    if (section == 0) {
        return 1;
    }else if (section == 1) {
        return 1;
    }else if (section == 2) {
        return 1;
    }else if (section == 3) {
        return 2;
    }else if (section == 4) {
        return 4;
    }else if (section == 5) {
        return 7;
    }else if (section == 6) {
        return 5;
    }else if (section == 7) {
        return 5;
    }else if (section == 8) {
        return 5;
    }else if (section == 9) {
        return 8;
    }else if (section == 10) {
        return 2;
    }else {
        return 3;
    }

}

/**
 *  订单cell详情
 *
 
 */
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSString *CellIdentifier = [NSString stringWithFormat:@"cell%ld%ld",indexPath.section,indexPath.row];
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    //cell.selectionStyle = UITableViewCellSelectionStyleNone;
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
    }
    /**
     *  不同section显示
     */
    switch (indexPath.section) {
        case 0:
            cell.textLabel.text = @"* 一级分类:";
            
            break;
        case 1:
            cell.textLabel.text = @"* 二级分类:";
            break;
        case 2:
            cell.textLabel.text = @"* 维修/安装:";
            break;
            /**
             *  通用部分
             *
             
             */
        case 3:
            switch (indexPath.row) {
                case 0:
                    cell.textLabel.text = @"* 地区:";
                    _Areacell = cell;
                    [self CreateArea];
                    break;
                case 1:
                    cell.textLabel.text = @"* 详细地址:";
                    break;
                    
                default:
                    break;
            }

            break;
        case 4://安装通用部分
            switch (indexPath.row) {
                case 0:
                    cell.textLabel.text = @"* 安装时间:";
                    break;
                case 1:
                    cell.textLabel.text = @"* 安装联系人:";
                    break;
                case 2:
                    cell.textLabel.text = @"* 联系电话:";
                    break;
                case 3:
                    cell.textLabel.text = @"* 是否郊县:";
                    break;
                default:
                    break;
            }
            break;
        case 5://安装主机和电池
            switch (indexPath.row) {
                case 0:
                    cell.textLabel.text = @"* UPS类型:";
                    break;
                case 1:
                    cell.textLabel.text = @"* 功率:";
                    break;
                case 2:
                    cell.textLabel.text = @" 主机品牌:";
                    break;
                case 3:
                    cell.textLabel.text = @"* UPS主机台数:";
                    break;
                case 4:
                    cell.textLabel.text = @"* 电池组:";
                    break;
                case 5:
                    cell.textLabel.text = @"* UPS功率:";
                    break;
                case 6:
                    cell.textLabel.text = @"* 电池主机间连线:";
                    break;
                
                default:
                    break;
            }

            break;
        case 6://更换主机
            switch (indexPath.row) {
                case 0:
                    cell.textLabel.text = @"* UPS类型:";
                    break;
                case 1:
                    cell.textLabel.text = @"* 功率:";
                    break;
                case 2:
                    cell.textLabel.text = @"  主机品牌:";
                    break;
                case 3:
                    cell.textLabel.text = @"* UPS主机台数:";
                    break;
                case 4:
                    cell.textLabel.text = @"* 电池主机之间连线:";
                    break;
                
                default:
                    break;
            }

            break;
        case 7://更换电池
            switch (indexPath.row) {
                case 0:
                    cell.textLabel.text = @"* UPS类型:";
                    break;
                case 1:
                    cell.textLabel.text = @"* 功率:";
                    break;
                case 2:
                    cell.textLabel.text = @"  主机品牌:";
                    break;
                case 3:
                    cell.textLabel.text = @"* UPS主机台数:";
                    break;
                case 4:
                    cell.textLabel.text = @"* 电池主机之间连线:";
                    break;
                    
                default:
                    break;
            }

            break;
        case 8://维护
            switch (indexPath.row) {
                case 0:
                    cell.textLabel.text = @"* UPS类型:";
                    break;
                case 1:
                    cell.textLabel.text = @"* 功率:";
                    break;
                case 2:
                    cell.textLabel.text = @"  主机品牌:";
                    break;
                case 3:
                    cell.textLabel.text = @"* UPS主机台数:";
                    break;
                case 4:
                    cell.textLabel.text = @"* 电池主机之间连线:";
                    break;
                    
                default:
                    break;
            }

            break;
        case 9:
            switch (indexPath.row) {
                case 0:
                    cell.textLabel.text = @"* 维修点联系人:";
                    break;
                case 1:
                    cell.textLabel.text = @"* 联系电话:";
                    break;
                case 2:
                    cell.textLabel.text = @"* 维修系统:";
                    break;
                case 3:
                    cell.textLabel.text = @"* 到达时间:";
                    break;
                case 4:
                    cell.textLabel.text = @"* 故障点:";
                    break;
                case 5:
                    cell.textLabel.text = @"* 是否高空作业:";
                    break;
                case 6:
                    cell.textLabel.text = @"* 维修时间:";
                    break;
                case 7:
                    cell.textLabel.text = @"* 是否郊县:";
                    break;
                    
                default:
                    break;
            }

            break;
            /**
             *  通用部分
             *
             
             */
        case 10://维修通用
            switch (indexPath.row) {
                case 0:
                    cell.textLabel.text = @"* 维修问题描述:";
                    break;
                case 1:
                    cell.textLabel.text = @"  维修照片:";
                    break;
                    
                default:
                    break;
            }
            break;
        case 11://维修通用
            switch (indexPath.row) {
                case 0:
                    cell.textLabel.text = @"* 服务名义:";
                    break;
                case 1:
                    cell.textLabel.text = @"* 工单报告模板:";
                    break;
                case 2:
                    cell.textLabel.text = @"* 安装维修说明:";
                    break;
                    
                default:
                    break;
            }
            break;
        default:
            break;
    }
    
    return cell;
}

- (void)CreateArea {
    
//    self.Area = [[UITextField alloc]initWithFrame:CGRectMake(100, 5, 200, 40)];
//    [_Areacell addSubview:self.Area];
//    self.Area.placeholder = @"请选择地区";
    _Area =[[UITextField alloc]initWithFrame:CGRectMake(100, 5, 200, 40)];
    [_Areacell addSubview:_Area];
    _Area.placeholder = @"请选择地区";
    
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return 50;
}


//添加取消按钮->
-(void)addCancelBtn{
    UIButton *cancelBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    [cancelBtn setFrame:CGRectMake(5, 20, KScreenWidth - 10, 50)];
    [cancelBtn setTitle:@"取   消" forState:UIControlStateNormal];
    [self.view addSubview:cancelBtn];
    cancelBtn.backgroundColor = [UIColor blueColor];
    cancelBtn.layer.cornerRadius = 10;
    [cancelBtn addTarget:self action:@selector(cancelClick) forControlEvents:UIControlEventTouchUpInside];
}
//取消按钮点击方法
-(void)cancelClick{
    [self finishPublish];
}


#pragma mark - 完成发布
//完成发布
-(void)finishPublish{
    //2.block传值
    if (self.mDismissBlock != nil) {
        self.mDismissBlock();
    }
    [self dismissViewControllerAnimated:YES completion:nil];
}
//block声明方法
-(void)toDissmissSelf:(dismissBlock)block{
    self.mDismissBlock = block;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
