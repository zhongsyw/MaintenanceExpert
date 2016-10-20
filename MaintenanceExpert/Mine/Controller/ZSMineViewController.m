//
//  ZSMineViewController.m
//  MaintenanceExpert
//
//  Created by koka on 16/10/18.
//  Copyright © 2016年 ZSYW. All rights reserved.
//

#import "ZSMineViewController.h"
#import "ZSLoginViewController.h"

@interface ZSMineViewController ()

@end

@implementation ZSMineViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor cyanColor];
    
    [self loginbtn];
    
}

- (void)loginbtn {
    
    UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(50, 200, 50, 50)];
    btn.backgroundColor = [UIColor blueColor];
    [btn addTarget:self action:@selector(click) forControlEvents:UIControlEventTouchDown];
    
    [self.view addSubview:btn];
}

- (void)click {
    
    ZSLoginViewController *zslogin = [[ZSLoginViewController alloc]init];
    [self.navigationController pushViewController:zslogin animated:YES];
    
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
