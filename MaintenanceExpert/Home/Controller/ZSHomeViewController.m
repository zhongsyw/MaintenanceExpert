//
//  ZSHomeViewController.m
//  MaintenanceExpert
//
//  Created by 中数 on 16/10/25.
//  Copyright © 2016年 ZSYW. All rights reserved.
//

#import "ZSHomeViewController.h"
#import "ZSHomeTableViewCell.h"
#import "SDCycleScrollView.h"

@interface ZSHomeViewController ()<UITableViewDelegate, UITableViewDataSource,SDCycleScrollViewDelegate>

@property (strong, nonatomic) UITableView *tableView;

@end

@implementation ZSHomeViewController

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES animated:YES];
}

/*  显示 NavigationBar
 - (void)viewWillDisappear:(BOOL)animated
 {
 [super viewWillDisappear:animated];
 if ( self.navigationController.childViewControllers.count > 1 ) {
 [self.navigationController setNavigationBarHidden:NO animated:YES];
 }
 }
 */
- (void)viewDidLoad {
    [super viewDidLoad];
    //    self.navigationController.navigationBarHidden = NO;
    
    [self creatTableView];
    [self creatHeadView];
}

- (void)creatHeadView {
    
//    NSArray *imageNames = @[@"h1.jpg",
//                            @"h2.jpg",
//                            @"h3.jpg",
//                            @"h4.jpg" // 本地图片请填写全名
//                            ];
    
    NSArray *imagesURLStrings = @[
                                  @"http://img2.3lian.com/2014/c7/12/d/77.jpg",
                                  @"http://img2.pconline.com.cn/pconline/0706/19/1038447_34.jpg",
                                  @"http://img3.iqilu.com/data/attachment/forum/201308/21/192654ai88zf6zaa60zddo.jpg"
                                  ];
    
    NSArray *titles = @[@"中数运维中数运维",
                        @"中数运维中数运维",
                        @"中数运维中数运维",
                        @"中数运维中数运维"
                        ];
    
    _imgCount = 5;
    
    //  本地图片
    //    SDCycleScrollView *headSV = [SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(0, 64, self.view.bounds.size.width, 180) shouldInfiniteLoop:YES imageNamesGroup:imageNames];
    //    headSV.delegate = self;
    //    headSV.pageControlAliment = SDCycleScrollViewPageContolAlimentRight;
    //    headSV.scrollDirection = UICollectionViewScrollDirectionVertical;
    //    headSV.titlesGroup = titles;
    ////    headSV.placeholderImage = [UIImage imageNamed:@"placeholder"];
    //    headSV.backgroundColor = [UIColor purpleColor];
    
    SDCycleScrollView *headSV = [SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(0, 0, KScreenWidth, 180) delegate:self placeholderImage:[UIImage imageNamed:@"placeholder"]];
    
    headSV.pageControlAliment = SDCycleScrollViewPageContolAlimentRight;
    headSV.titlesGroup = titles;
    headSV.imageURLStringsGroup = imagesURLStrings;
    headSV.currentPageDotColor = [UIColor whiteColor]; // 自定义分页控件小圆标颜色
    _tableView.tableHeaderView = headSV;
    //         --- 模拟加载延迟
    //    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
    //
    //    });
    
}

- (void)creatTableView {
    
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height) style:UITableViewStylePlain];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [self.view addSubview:_tableView];
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 12;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIndentifier = @"ZSHomeTableViewCell";
    ZSHomeTableViewCell *cell = (ZSHomeTableViewCell *)[tableView dequeueReusableCellWithIdentifier:cellIndentifier];
    if(nil == cell) {
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:cellIndentifier owner:self options:nil];
        cell = [nib objectAtIndex:0];
    }
    
    _tableView.rowHeight = cell.frame.size.height;
    return cell;
}

#pragma mark - SDCycleScrollViewDelegate

- (void)cycleScrollView:(SDCycleScrollView *)cycleScrollView didSelectItemAtIndex:(NSInteger)index {
    NSLog(@"---点击了第%ld张图片", (long)index);
    
    [self.navigationController pushViewController:[NSClassFromString(@"DemoVCWithXib") new] animated:YES];
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
