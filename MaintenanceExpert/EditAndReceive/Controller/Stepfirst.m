//
//  Stepfirst.m
//  MaintenanceExpert
//
//  Created by koka on 16/11/3.
//  Copyright © 2016年 ZSYW. All rights reserved.
//

#import "Stepfirst.h"
#import "STPickerArea.h"


@interface Stepfirst()<UITableViewDataSource,UITableViewDelegate,UITextFieldDelegate,STPickerAreaDelegate>
{
    UITableView *_tableview;
}
@property (strong,nonatomic)UITextField *textArea;
@property (strong,nonatomic)UITextField *textdetailArea;
@property (strong,nonatomic)UITextField *textcontact;
@property (strong,nonatomic)UITextField *textcontactTel;

@end

@implementation Stepfirst

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    self.navigationController.navigationBarHidden = NO;
    
    
    self.navigationItem.title = [NSString stringWithFormat:@"%ld",self.model.IndexTwo];
    
    self.view.backgroundColor = [UIColor greenColor];
    self.textArea = [[UITextField alloc]init];
    self.textdetailArea = [[UITextField alloc]init];
    self.textdetailArea.delegate = self;
    self.textcontact = [[UITextField alloc]init];
    self.textcontact.delegate = self;
    self.textcontactTel = [[UITextField alloc]init];
    self.textcontactTel.delegate = self;
    
    
    _tableview = [[UITableView alloc]initWithFrame:self.view.frame style:UITableViewStylePlain];
    _tableview.bounces = NO;
    _tableview.delegate = self;
    _tableview.dataSource = self;
    UIImageView *image = [[UIImageView alloc]initWithFrame:self.view.frame];
    image.image = [UIImage imageNamed:@"121"];
    [_tableview setBackgroundView:image];
    
    [self.view addSubview:_tableview];
    
    [_tableview registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return 5;
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return 50;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"cell"];
    cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.backgroundColor = [UIColor clearColor];
    
    if (indexPath.row == 0) {
        
        cell.textLabel.text = @"* 请选择区域:";
        self.textArea.frame = CGRectMake(KScreenWidth / 3, 10, KScreenWidth/2, 30);
        self.textArea.placeholder = @"请选择地址:";
        self.textArea.textAlignment = NSTextAlignmentRight;
        self.textArea.delegate = self;
        [cell addSubview:self.textArea];
        
    }else if (indexPath.row == 1){
        
        cell.textLabel.text = @"* 详细地址:";
        self.textdetailArea.frame = CGRectMake(KScreenWidth / 3, 10, KScreenWidth/2, 30);
        self.textdetailArea.placeholder = @"请输入详细地址:";
        self.textdetailArea.textAlignment = NSTextAlignmentRight;
        self.textdetailArea.returnKeyType = UIReturnKeyDone;
        [cell addSubview:self.textdetailArea];
        
    }else if (indexPath.row == 2){
        
        cell.textLabel.text = @"* 联系人:";
        self.textcontact.frame = CGRectMake(KScreenWidth / 3, 10, KScreenWidth/2, 30);
        self.textcontact.placeholder = @"请输入联系人:";
        self.textcontact.textAlignment = NSTextAlignmentRight;
        self.textcontact.returnKeyType = UIReturnKeyDone;
        [cell addSubview:self.textcontact];
        
    }else if (indexPath.row == 3){
        
        cell.textLabel.text = @"* 联系电话:";
        self.textcontactTel.frame = CGRectMake(KScreenWidth / 3, 10, KScreenWidth/2, 30);
        self.textcontactTel.placeholder = @"请输入联系人电话:";
        self.textcontactTel.textAlignment = NSTextAlignmentRight;
        self.textcontactTel.returnKeyType = UIReturnKeyDone;

        [cell addSubview:self.textcontactTel];
        
    }else {
        
        cell.textLabel.text = @"* 请选择服务类别:";
        NSArray *array = [[NSArray alloc]initWithObjects:@"维修",@"安装", nil];
        UISegmentedControl *segmentcontrol = [[UISegmentedControl alloc]initWithItems:array];
        segmentcontrol.frame = CGRectMake((KScreenWidth *5 / 6) - 100 , 10, 100, 30);
        segmentcontrol.selectedSegmentIndex = 2;
        segmentcontrol.tintColor = [UIColor blueColor];

//        // 在指定索引插入一个选项并设置图片
//        [segmentcontrol insertSegmentWithImage:[UIImage imageNamed:@"mei.png"] atIndex:0 animated:NO];
//        // 在指定索引插入一个选项并设置题目
//        [segmentcontrol insertSegmentWithTitle:@"insert" atIndex:1 animated:NO];
        // 设置在点击后是否恢复原样
        segmentcontrol.momentary = NO;
        [segmentcontrol setTitle:@"维修" forSegmentAtIndex:0];//设置指定索引的题目
        [segmentcontrol setTitle:@"安装" forSegmentAtIndex:1];
        // 设置指定索引选项的宽度
        [segmentcontrol setWidth:50.0 forSegmentAtIndex:0];
        [segmentcontrol addTarget:self action:@selector(didClicksegmentedControlAction:) forControlEvents:UIControlEventValueChanged];
        [cell addSubview:segmentcontrol];
        
    }
    return cell;
}


- (void)didClicksegmentedControlAction:(UISegmentedControl *)Seg {
    
    NSInteger Index = Seg.selectedSegmentIndex;
    switch (Index) {
        case 0:
            NSLog(@"维修");
            break;
        case 1:
            NSLog(@"安装");
            break;
            
        default:
            break;
    }
}

#pragma mark - --- delegate 视图委托 ---

- (void)textFieldDidBeginEditing:(UITextField *)textField {
    
    if (textField == self.textArea) {
        [self.textArea resignFirstResponder];
        STPickerArea *pickerArea = [[STPickerArea alloc]init];
        [pickerArea setDelegate:self];
        [pickerArea setContentMode:STPickerContentModeCenter];
        [pickerArea show];
    }
}

/**
 *  地址选择器
 *

 */
- (void)pickerArea:(STPickerArea *)pickerArea province:(NSString *)province city:(NSString *)city area:(NSString *)area
{
    NSString *text = [NSString stringWithFormat:@"%@ %@ %@", province, city, area];
    self.textArea.text = text;
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

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self.textArea resignFirstResponder];
    [self.textdetailArea resignFirstResponder];
    [self.textcontact resignFirstResponder];
    [self.textcontactTel resignFirstResponder];
}

- (void)viewWillDisappear:(BOOL)animated {
    self.navigationController.navigationBarHidden = YES;
}


@end
