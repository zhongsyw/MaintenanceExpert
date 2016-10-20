//
//  ZSLoginViewController.m
//  MaintenanceExpert
//
//  Created by koka on 16/10/20.
//  Copyright © 2016年 ZSYW. All rights reserved.
//

#import "ZSLoginViewController.h"
#import "ZSNavigationController.h"

#import "UIView+ZSExtension.h"
#import "UIbutton.h"

#define KScreenWidth [UIScreen mainScreen].bounds.size.width
#define KScreenHeight [UIScreen mainScreen].bounds.size.height


@implementation ZSLoginViewController

{
    UIButton *_logobtn;
    UIButton *_otherBtn;
    UITextField *_phone;
    UITextField *_secret;
    
}

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    _logobtn = [[UIButton alloc]init];
    _otherBtn = [[UIButton alloc]init];
    _phone = [[UITextField alloc]init];
    _secret = [[UITextField alloc]init];
    
    //背景图片
    UIImageView *imageview = [[UIImageView alloc]initWithFrame:self.view.frame];
    imageview.image = [UIImage imageNamed:@"93S58PICcXy_1024_meitu_1"];
    [self.view addSubview:imageview];
    
    [self createUI];

   
    
//    UIBarButtonItem *item = [[UIBarButtonItem alloc]initWithTitle:@"返回" style:UIBarButtonItemStylePlain target:nil action:nil];
//    self.navigationItem.backBarButtonItem = item;
    
}

- (void)createUI {
   
//导航栏的透明
 
    [self.navigationController.navigationBar setBackgroundImage:[[UIImage alloc] init] forBarMetrics:UIBarMetricsDefault];
    
    self.view.contentMode = UIViewContentModeScaleAspectFill;
    
    [self.navigationController.navigationBar setShadowImage:[[UIImage alloc] init]];
    
    [self createlogo];
    
    [self createtextfield];
    
    [self createLoginButton];
    
    [self createOtherlogin];
    
    [self createRegisterAndForgetsecret];
    
}

- (void)createlogo {
    
    UILabel *logolb = [[UILabel alloc]initWithFrame:CGRectMake(KScreenWidth / 3, KScreenHeight * 0.2, KScreenWidth / 3, (KScreenWidth / 3) / 2 )];
    
    logolb.center = CGPointMake(KScreenWidth / 2, KScreenHeight * 0.2);
    [logolb setTextAlignment:NSTextAlignmentCenter];
    logolb.text = @"运维专家";
    logolb.textColor = [UIColor whiteColor];
    logolb.font = [UIFont systemFontOfSize:30 weight:5];
    
//    UILabel *logolb1 = [[UILabel alloc]initWithFrame:CGRectMake(KScreenWidth / 3, KScreenHeight * 0.2 + logolb.frame.size.height, KScreenWidth / 3, (KScreenWidth / 3) / 2 )];
//    
//    logolb1.center = CGPointMake(KScreenWidth / 2, KScreenHeight * 0.2  + logolb.frame.size.height + (KScreenWidth / 3) / 4 );
//    [logolb1 setTextAlignment:NSTextAlignmentCenter];
//    logolb1.text = @"Maintenance Expert";
//    logolb1.textColor = [UIColor whiteColor];
//    logolb1.font = [UIFont systemFontOfSize:25 weight:4];
//    
//    [self.view addSubview:logolb1];
    [self.view addSubview:logolb];
    
}

/**
 *  手机号和密码 文本框
 */
- (void)createtextfield {
    
    UITextField *phonetextfield = [[UITextField alloc]initWithFrame:CGRectMake(30,KScreenHeight / 2 - 100, KScreenWidth - 60, 40)];
    phonetextfield.placeholder = @"请输入手机号";
    [phonetextfield setValue:[UIColor colorWithRed:85.0 / 255.0 green:85.0 / 255.0 blue:85.0 / 255.0 alpha:1] forKeyPath:@"_placeholderLabel.textColor"];
    [phonetextfield setValue:[UIFont boldSystemFontOfSize:16] forKeyPath:@"_placeholderLabel.font"];
    phonetextfield.clearButtonMode = UITextFieldViewModeAlways;
    
    UIView *lineView = [[UIView alloc]initWithFrame:CGRectMake(0, phonetextfield.frame.size.height - 1, phonetextfield.frame.size.width , 1)];
    lineView.backgroundColor = [UIColor blackColor];
    [phonetextfield addSubview:lineView];
    
    [self.view addSubview:phonetextfield];
    [self.view addSubview:phonetextfield];
    
    UIImageView *rightView1 = [[UIImageView alloc]initWithFrame:CGRectMake(KScreenWidth - 110, -2, 30, 25)];
    rightView1.image = [UIImage imageNamed:@"login_phone-1"];
    rightView1.contentMode =UIViewContentModeScaleAspectFit;
    CGRect frame1 = rightView1.frame;
    frame1.size = CGSizeMake(40, 40);
    rightView1.contentMode = UIViewContentModeCenter;
    phonetextfield.rightView = rightView1;
    phonetextfield.rightViewMode = UITextFieldViewModeAlways;
    _phone = phonetextfield;

    
    
    UITextField *secrettextfield = [[UITextField alloc]initWithFrame:CGRectMake(30,KScreenHeight / 2 - 40, KScreenWidth - 60, 40)];
    secrettextfield.placeholder = @"请输入密码";
    [secrettextfield setValue:[UIColor colorWithRed:85.0 / 255.0 green:85.0 / 255.0 blue:85.0 / 255.0 alpha:1] forKeyPath:@"_placeholderLabel.textColor"];
    [secrettextfield setValue:[UIFont boldSystemFontOfSize:16] forKeyPath:@"_placeholderLabel.font"];
    secrettextfield.secureTextEntry = YES;
    secrettextfield.clearButtonMode = UITextFieldViewModeWhileEditing;
    
    UIView *lineView1 = [[UIView alloc]initWithFrame:CGRectMake(0, secrettextfield.frame.size.height - 1, secrettextfield.frame.size.width, 1)];
    lineView1.backgroundColor = [UIColor blackColor];
    
    [secrettextfield addSubview:lineView1];
    [self.view addSubview:secrettextfield];

    UIImageView *rightView = [[UIImageView alloc]initWithFrame:CGRectMake(KScreenWidth - 110, 0, 30, 30)];
    rightView.image = [UIImage imageNamed:@"login_psw-1"];
    CGRect frame = rightView.frame;
    frame.size = CGSizeMake(40, 40);
    rightView.contentMode =UIViewContentModeScaleAspectFit;
    //rightView.contentMode = UIViewContentModeCenter;
    secrettextfield.rightView = rightView;
    secrettextfield.rightViewMode = UITextFieldViewModeAlways;
    _secret = secrettextfield;
}

/**
 *  登录按钮
 */
- (void)createLoginButton {
    
    UIbutton *btn = [[UIbutton alloc]init];
    UIButton *button = [btn addButtonWithImage:nil highImage:nil disableImage:nil frame:CGRectMake(30, KScreenHeight / 2 + 40, KScreenWidth - 60, 40) tag:0 action:@selector(loginclick)];
    
    button.backgroundColor = [UIColor colorWithRed:41.0 / 255.0 green:182.0 / 255.0 blue:246.0 / 255.0 alpha:1];
    button.layer.cornerRadius = 10;
    [ button setTitle:@"登           录" forState:UIControlStateNormal];
    
    _logobtn = button;
    
    [self.view addSubview:button];
    
}

- (void)loginclick {
    NSLog(@"登录");
}

/**
 *  其他登录方式
 *
 */
- (void)createOtherlogin {
    
    /**
     其他登录方式
     */
    UILabel *otherlogin = [[UILabel alloc]initWithFrame:CGRectMake(0, _logobtn.frame.origin.y + _logobtn.size.height + 80, KScreenWidth , 10)];
    otherlogin.textAlignment = NSTextAlignmentCenter;
    otherlogin.text = @"其他登录方式";
    otherlogin.textColor = [UIColor colorWithRed:70.0 / 255.0 green:70.0 / 255.0 blue:70.0 / 255.0 alpha:1];
    otherlogin.font = [UIFont systemFontOfSize:14];
    
    UIView *lineView = [[UIView alloc]initWithFrame:CGRectMake(_logobtn.frame.origin.x, otherlogin.frame.size.height + 5, _logobtn.frame.size.width, 1)];
    lineView.backgroundColor = [UIColor colorWithRed:150.0 / 255.0 green:170.0 / 255.0 blue:180.0 / 255.0 alpha:1];
    [otherlogin addSubview:lineView];
    
    [self.view addSubview:otherlogin];
    
    
    /**
     *  第三方登录
     
     每种登录的button的tag值来区分
     *
     */
    UIbutton *btn = [[UIbutton alloc]init];
    
    UIButton *QQ = [btn addButtonWithImage:@"share_platform_qqfriends-1" highImage:nil disableImage:nil frame:CGRectMake(_logobtn.frame.origin.x, otherlogin.frame.origin.y + 25, _logobtn.frame.size.width / 6, _logobtn.frame.size.width / 6) tag:0 action:@selector(clickQQ)];
    QQ.layer.cornerRadius = 10;
    
    _otherBtn = QQ;
    [self.view addSubview:QQ];
    
    UIButton *weixin = [btn addButtonWithImage:@"share_wechat" highImage:nil disableImage:nil frame:CGRectMake(_logobtn.frame.origin.x + (_logobtn.frame.size.width * 5) / 18, otherlogin.frame.origin.y + 25, _logobtn.frame.size.width / 6, _logobtn.frame.size.width / 6) tag:1 action:@selector(clickweixin)];
    weixin.layer.cornerRadius = 10;
    
    [self.view addSubview:weixin];
    
    UIButton *weibo = [btn addButtonWithImage:@"share_platform_sina" highImage:nil disableImage:nil frame:CGRectMake(_logobtn.frame.origin.x + (_logobtn.frame.size.width * 5) / 9, otherlogin.frame.origin.y + 25, _logobtn.frame.size.width / 6, _logobtn.frame.size.width / 6) tag:2 action:@selector(clickweibo)];
    weibo.layer.cornerRadius = 10;
    
    [self.view addSubview:weibo];
    
    UIButton *yanzhengma = [btn addButtonWithImage:@"post_office_icon" highImage:nil disableImage:nil frame:CGRectMake(_logobtn.frame.origin.x + (_logobtn.frame.size.width * 5) / 6, otherlogin.frame.origin.y + 25, _logobtn.frame.size.width / 6, _logobtn.frame.size.width / 6) tag:3 action:@selector(clickyanzhengma)];
    yanzhengma.layer.cornerRadius = 10;
    
    [self.view addSubview:yanzhengma];
    
}

/**
 *  四种第三方登录
 */
- (void)clickQQ {
    
    NSLog(@"QQ");
    
}

- (void)clickweixin {
    
    NSLog(@"weixin");
}

- (void)clickweibo {
    
    NSLog(@"weibo");
}

- (void)clickyanzhengma {
    
    NSLog(@"yanzhengma");
}


/**
 *  注册按钮
 */
- (void)createRegisterAndForgetsecret {
    
    UIButton *registerbtn = [[UIButton alloc]initWithFrame:CGRectMake(_logobtn.frame.origin.x, _otherBtn.frame.origin.y + _otherBtn.frame.size.height + 50 , 80, 20)];
    NSMutableAttributedString *title = [[NSMutableAttributedString alloc] initWithString:@"注册账号"];
    NSRange titleRange = {0,[title length]};
    [title addAttribute:NSUnderlineStyleAttributeName value:[NSNumber numberWithInteger:NSUnderlineStyleSingle] range:titleRange];
    [registerbtn setAttributedTitle:title
                      forState:UIControlStateNormal];
    
    registerbtn.tintColor = [UIColor redColor];
    
    registerbtn.titleLabel.font = [UIFont systemFontOfSize:14];
    
    [registerbtn addTarget:self  action:@selector(registerb) forControlEvents:UIControlEventTouchDown];
    
    [self.view addSubview:registerbtn];
    
    
    
    UIButton *ForgetSecret = [[UIButton alloc]initWithFrame:CGRectMake(_logobtn.frame.size.width + registerbtn.frame.origin.x - registerbtn.frame.size.width, _otherBtn.frame.origin.y + _otherBtn.frame.size.height + 50 , 80, 20)];
    NSMutableAttributedString *title1 = [[NSMutableAttributedString alloc] initWithString:@"忘记密码"];
    NSRange titleRange1 = {0,[title length]};
    [title1 addAttribute:NSUnderlineStyleAttributeName value:[NSNumber numberWithInteger:NSUnderlineStyleSingle] range:titleRange1];
    [ForgetSecret setAttributedTitle:title1
                           forState:UIControlStateNormal];
    
    ForgetSecret.tintColor = [UIColor redColor];
    
    ForgetSecret.titleLabel.font = [UIFont systemFontOfSize:14];
    
    [ForgetSecret addTarget:self  action:@selector(Forget) forControlEvents:UIControlEventTouchDown];

    
    [self.view addSubview:ForgetSecret];
   
}

/**
 *  跳转注册和忘记密码界面
 */
- (void)registerb {
    NSLog(@"跳转注册");
}

- (void)Forget {
    NSLog(@"跳转改密");
}

/**
 *  界面消失
 *
 */
- (void)viewWillDisappear:(BOOL)animated {

    [self.navigationController.navigationBar setBackgroundImage:nil forBarMetrics:UIBarMetricsDefault];
    
    [self.navigationController.navigationBar setShadowImage:nil];
    
}

/**
 *  键盘响应
 *
 */
-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [_phone resignFirstResponder];
    [_secret resignFirstResponder];
}

@end
