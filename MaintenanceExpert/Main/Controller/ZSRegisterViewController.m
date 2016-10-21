//
//  ZSRegisterViewController.m
//  MaintenanceExpert
//
//  Created by 中数 on 16/10/20.
//  Copyright © 2016年 ZSYW. All rights reserved.
//

#import "ZSRegisterViewController.h"
#import "SDAutoLayout.h"

@interface ZSRegisterViewController (){
    
    UIImageView* topImageView;
    UIImageView* logoView;
    UITextView* textV1;
    UIButton* nextStepBtn;
    UIView* phoneNum;
    UIView* messageNum;
    UIView* passwordNum;
    UIView* passwordTwo;
    
}

@end

@implementation ZSRegisterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self creatView];
}


- (void)creatView {
    
    [self topImageVAndType];
    [self phoneNum];
    [self messageNum];
    [self passwordNum];
    [self nextStepOfBtn];
}

//  顶部 Logo 和 注册类型
- (void)topImageVAndType {
    
    topImageView = [[UIImageView alloc] init];
    topImageView.backgroundColor = [UIColor orangeColor];
    CGRect frame = topImageView.frame;
    frame.size = CGSizeMake(100, 200);
    topImageView.frame = frame;
    [self.view addSubview:topImageView];
    
    topImageView.sd_layout
    .leftSpaceToView(self.view,0)
    .topSpaceToView(self.view,64)
    .rightSpaceToView(self.view,0);
    
    //  Logo
    logoView = [[UIImageView alloc] init];
    logoView.backgroundColor = [UIColor blueColor];
    [topImageView addSubview:logoView];
    
    logoView.sd_layout
    .leftSpaceToView(topImageView, 50)
    .rightSpaceToView(topImageView, 50)
    .topSpaceToView(topImageView, 30)
    .bottomSpaceToView(topImageView, 30);
    
    //  注册类型
    textV1 = [[UITextView alloc] init];
    textV1.backgroundColor = [UIColor cyanColor];
    textV1.editable = NO;
    [textV1 setText:@"请选择注册类型:"];
    textV1.font = [UIFont systemFontOfSize:15];
    [self.view addSubview:textV1];
    
    textV1.sd_layout
    .leftSpaceToView(self.view, 30)
    .topSpaceToView(topImageView, 20)
    .heightIs(30)
    .widthIs(120);
}

//  手机号
- (void)phoneNum {
    
    //  手机号  top 50  zishen 40  left 20
    phoneNum = [[UIView alloc] init];
    phoneNum.backgroundColor = [UIColor cyanColor];
    [self.view addSubview:phoneNum];
    
    phoneNum.sd_layout
    .topSpaceToView(textV1, 40)
    .leftSpaceToView(self.view, 20)
    .rightSpaceToView(self.view, 20)
    .heightIs(50);
    
    //  图
    UIImageView* imageV = [[UIImageView alloc] init];
    imageV.backgroundColor = [UIColor yellowColor];
    imageV.image = [UIImage imageNamed:@"icon_signin_phone"];
    [phoneNum addSubview:imageV];
    
    imageV.sd_layout
    .topSpaceToView(phoneNum, 10)
    .leftSpaceToView(phoneNum, 5)
    .widthIs(25)
    .heightIs(30);
    //  输入框
    UITextField* textF = [[UITextField alloc] init];
    textF.backgroundColor = [UIColor yellowColor];
    textF.placeholder = @"请输入手机号";
    [phoneNum addSubview:textF];
    
    textF.sd_layout
    .topEqualToView(imageV)
    .leftSpaceToView(imageV, 5)
    .rightSpaceToView(phoneNum, 10)
    .heightIs(30);
    //  横线
    UIView* line = [[UIView alloc] init];
    line.backgroundColor = [UIColor grayColor];
    [phoneNum addSubview:line];
    
    line.sd_layout
    .leftSpaceToView(phoneNum, 1)
    .bottomSpaceToView(phoneNum, 1)
    .rightSpaceToView(phoneNum, 1)
    .heightIs(1);
    
}

//  验证码
- (void)messageNum {
    
    //  验证码
    messageNum = [[UIView alloc] init];
    messageNum.backgroundColor = [UIColor cyanColor];
    [self.view addSubview:messageNum];
    
    messageNum.sd_layout
    .topSpaceToView(phoneNum, 10)
    .leftSpaceToView(self.view, 20)
    .rightSpaceToView(self.view, 20)
    .heightIs(50);
    
    //  图
    UIImageView* imageV = [[UIImageView alloc] init];
    imageV.backgroundColor = [UIColor yellowColor];
    imageV.image = [UIImage imageNamed:@"alert_login_yzm"];
    [messageNum addSubview:imageV];
    
    imageV.sd_layout
    .topSpaceToView(messageNum, 10)
    .leftSpaceToView(messageNum, 5)
    .widthIs(25)
    .heightIs(30);
    //  输入框
    UITextField* textF = [[UITextField alloc] init];
    textF.backgroundColor = [UIColor yellowColor];
    textF.placeholder = @"验证码";
    [messageNum addSubview:textF];
#warning 验证码按钮！！！！！！！！！！！！！！！！！！！！ 调用的 获取验证码的 方法
    textF.sd_layout
    .topEqualToView(imageV)
    .leftSpaceToView(imageV, 5)
    .rightSpaceToView(messageNum, 120)
    .heightIs(30);
    //  获取验证码
    UIButton* btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.backgroundColor = [UIColor orangeColor];
    [btn setTitle:@"获取验证码" forState:UIControlStateNormal];
    btn.titleLabel.font = [UIFont systemFontOfSize:14];
    [btn addTarget:self action:@selector(extractMsg) forControlEvents:UIControlEventTouchDown];
    [messageNum addSubview:btn];
    
    btn.sd_layout
    .leftSpaceToView(textF, 10)
    .topEqualToView(textF)
    .rightSpaceToView(messageNum, 0)
    .widthIs(90)
    .heightIs(30);
    //  横线
    UIView* line = [[UIView alloc] init];
    line.backgroundColor = [UIColor grayColor];
    [messageNum addSubview:line];
    
    line.sd_layout
    .leftSpaceToView(messageNum, 1)
    .bottomSpaceToView(messageNum, 1)
    .rightSpaceToView(messageNum, 1)
    .heightIs(1);
    
}

//  密码
- (void)passwordNum {
    
    //  密码
    passwordNum = [[UIView alloc] init];
    passwordNum.backgroundColor = [UIColor cyanColor];
    [self.view addSubview:passwordNum];
    
    passwordNum.sd_layout
    .topSpaceToView(messageNum, 10)
    .leftSpaceToView(self.view, 20)
    .rightSpaceToView(self.view, 20)
    .heightIs(50);
    
    //  图
    UIImageView* imageV = [[UIImageView alloc] init];
    imageV.backgroundColor = [UIColor yellowColor];
    imageV.image = [UIImage imageNamed:@"alert_login_pass"];
    [passwordNum addSubview:imageV];
    
    imageV.sd_layout
    .topSpaceToView(passwordNum, 10)
    .leftSpaceToView(passwordNum, 5)
    .widthIs(25)
    .heightIs(30);
    //  输入框
    UITextField* textF = [[UITextField alloc] init];
    textF.backgroundColor = [UIColor yellowColor];
    textF.placeholder = @"请输入密码";
    [passwordNum addSubview:textF];
    
    textF.sd_layout
    .topEqualToView(imageV)
    .leftSpaceToView(imageV, 5)
    .rightSpaceToView(passwordNum, 10)
    .heightIs(30);
    //  横线
    UIView* line = [[UIView alloc] init];
    line.backgroundColor = [UIColor grayColor];
    [passwordNum addSubview:line];
    
    line.sd_layout
    .leftSpaceToView(passwordNum, 1)
    .bottomSpaceToView(passwordNum, 1)
    .rightSpaceToView(passwordNum, 1)
    .heightIs(1);
    
    //  确认密码  二次输入
    passwordTwo = [[UIView alloc] init];
    passwordTwo.backgroundColor = [UIColor cyanColor];
    [self.view addSubview:passwordTwo];
    
    passwordTwo.sd_layout
    .topSpaceToView(passwordNum, 10)
    .leftSpaceToView(self.view, 20)
    .rightSpaceToView(self.view, 20)
    .heightIs(50);
    
    //  图
    UIImageView* imageV2 = [[UIImageView alloc] init];
    imageV2.backgroundColor = [UIColor yellowColor];
    imageV2.image = [UIImage imageNamed:@"alert_login_pass"];
    [passwordTwo addSubview:imageV2];
    
    imageV2.sd_layout
    .topSpaceToView(passwordTwo, 10)
    .leftSpaceToView(passwordTwo, 5)
    .widthIs(25)
    .heightIs(30);
    //  输入框
    UITextField* textF2 = [[UITextField alloc] init];
    textF2.backgroundColor = [UIColor yellowColor];
    textF2.placeholder = @"请输入密码";
    [passwordTwo addSubview:textF2];
    
    textF2.sd_layout
    .topEqualToView(imageV)
    .leftSpaceToView(imageV, 5)
    .rightSpaceToView(passwordTwo, 10)
    .heightIs(30);
    //  横线
    UIView* line2 = [[UIView alloc] init];
    line2.backgroundColor = [UIColor grayColor];
    [passwordTwo addSubview:line2];
    
    line2.sd_layout
    .leftSpaceToView(passwordTwo, 1)
    .bottomSpaceToView(passwordTwo, 1)
    .rightSpaceToView(passwordTwo, 1)
    .heightIs(1);
    
}

//  注册按钮
- (void)nextStepOfBtn {
    
    //  注册按钮
    nextStepBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    nextStepBtn.backgroundColor = [UIColor cyanColor];
    [nextStepBtn setTitle:@"注   册" forState:UIControlStateNormal];
    [nextStepBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [nextStepBtn.titleLabel setFont:[UIFont systemFontOfSize:15]];
    [nextStepBtn addTarget:self action:@selector(btnOfRegistration:) forControlEvents:UIControlEventTouchDown];
    [self.view addSubview:nextStepBtn];
    
    nextStepBtn.sd_layout
    .leftSpaceToView(self.view, 78)
    .topSpaceToView(passwordTwo, 40)
    .heightIs(35)
    .widthIs(220);
}


//  获取 验证码
- (void)extractMsg {
    
}


//  注 册 按 钮 方法
- (void)btnOfRegistration:(NSNumber* )number {
    
    
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
