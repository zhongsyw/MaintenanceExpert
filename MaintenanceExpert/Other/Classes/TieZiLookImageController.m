//
//  TieZiLookImageController.m
//  好逑
//
//  Created by 訾玉洁 on 16/2/23.
//  Copyright © 2016年 bandaochina. All rights reserved.
//

#import "TieZiLookImageController.h"
#import "AppDelegate.h"
#import "UIImageView+WebCache.h"

@interface TieZiLookImageController ()<UIScrollViewDelegate>
{
    UIScrollView    *_scrollv;
    NSInteger        _totol ;
    int              _page;
}
@property (nonatomic, weak) UILabel *indicator;

@end

@implementation TieZiLookImageController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"大图浏览";
    self.view.backgroundColor = [UIColor whiteColor];
    self.automaticallyAdjustsScrollViewInsets = NO;
    UILabel *indicator = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 40, 20)];

    if (self.imageUrlList) {
        _totol = self.imageUrlList.count;
    }else{
        _totol = self.imageList.count;
    }
    
    indicator.text = [NSString stringWithFormat:@"%ld/%lu", (long)self.imageIndex + 1,_totol];
    self.indicator = indicator;
    indicator.font = [UIFont systemFontOfSize:12];
    indicator.textColor = [UIColor grayColor];
    
    UIBarButtonItem *textLabel=[[UIBarButtonItem alloc] initWithCustomView:indicator];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:indicator];

    [self createScrollerView];
    UIButton *deleteBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    
       [deleteBtn addTarget:self action:@selector(onDeleteImageBtnClicked) forControlEvents:UIControlEventTouchUpInside];

    deleteBtn.frame = CGRectMake(0, 0, 40,40);
    UIImageView *flightImageV = [[UIImageView alloc]initWithFrame:CGRectMake(0,  8, 30, 30)];
    flightImageV.image = [UIImage imageNamed:@"删除"];
    [deleteBtn addSubview:flightImageV];
     UIBarButtonItem *flightItem=[[UIBarButtonItem alloc] initWithCustomView:deleteBtn];
    
    self.navigationItem.rightBarButtonItems = @[textLabel,flightItem];
   // [self.view addSubview:deleteBtn];
    
}

- (void)createScrollerView
{
    _scrollv = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width , self.view.frame.size.height+60)];
    _scrollv.backgroundColor = [UIColor whiteColor];
    _scrollv.pagingEnabled = YES;
    _scrollv.bounces = NO;
    _scrollv.delegate=self;
    _scrollv.tag = 102;
    [self.view addSubview:_scrollv];
    //[_scrollv setBackgroundColor:[UIColor colorWithWhite:0 alpha:1]];
    
    _page = (int)self.imageIndex;
    [self setObjectToScroller];
    
    [_scrollv addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(scrollvTap:)]];
}

//刷新ScrollerView
- (void)setObjectToScroller
{
    for (id obj in _scrollv.subviews) {
        [obj removeFromSuperview];
    }
    
    if (self.imageUrlList) {
        _scrollv.contentSize = CGSizeMake(self.view.frame.size.width * self.imageUrlList.count, _scrollv.frame.size.height);
        for (NSInteger i = 0; i < self.imageUrlList.count; i ++) {
            
            //每张图片
            UIScrollView *scrollview =[[UIScrollView alloc] initWithFrame:CGRectMake(self.view.frame.size.width *i, 0, self.view.frame.size.width , _scrollv.frame.size.height)];
            [scrollview setShowsHorizontalScrollIndicator:NO];
            [scrollview setShowsVerticalScrollIndicator:NO];
            scrollview.maximumZoomScale=3.0;
            scrollview.delegate=self;
            scrollview.tag = 101;
            [_scrollv addSubview:scrollview];
            
            UIImageView *imagev = [[UIImageView alloc] init];
            imagev.contentMode = UIViewContentModeCenter;
           // MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:imagev animated:YES];
            
            [imagev sd_setImageWithURL:[NSURL URLWithString:self.imageUrlList[i]] placeholderImage:[UIImage imageNamed:@"ic_picture_loading"] options:SDWebImageProgressiveDownload completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
                //[hud hide:YES];
            }];
            
            CGFloat w = scrollview.frame.size.width;
            CGFloat h = scrollview.frame.size.height;
            
            CGFloat x = 0;
            CGFloat y = 0;
            
            imagev.frame = CGRectMake(x, y, w, h);
            
            [scrollview addSubview:imagev];
        }
    }else if(self.imageList){
        
        _scrollv.contentSize = CGSizeMake(self.view.frame.size.width * self.imageList.count, self.view.frame.size.height);
        
        for (NSInteger i = 0; i < self.imageList.count; i++) {
            
            //每张图片
            UIScrollView *scrollview =[[UIScrollView alloc] initWithFrame:CGRectMake(self.view.frame.size.width *i, -27, self.view.frame.size.width , _scrollv.frame.size.height)];
            [scrollview setShowsHorizontalScrollIndicator:NO];
            [scrollview setShowsVerticalScrollIndicator:NO];
            scrollview.maximumZoomScale=3.0;
            scrollview.delegate=self;
            [_scrollv addSubview:scrollview];
            
            UIImageView *imagev = [[UIImageView alloc] init];
            imagev.contentMode = UIViewContentModeScaleAspectFit;
            
            imagev.image = self.imageList[i];
            imagev.tag = i;
            
            CGFloat w = _scrollv.frame.size.width;
            CGFloat h = _scrollv.frame.size.height;
            
            CGFloat x = 0;
            CGFloat y = 0;
            
            imagev.frame = CGRectMake(x, y, w, h);
            imagev.userInteractionEnabled = YES;
            [scrollview addSubview:imagev];
            
            UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(TapAction)];
            [imagev addGestureRecognizer:tap];
        }
    }
    self.indicator.text = [NSString stringWithFormat:@"%d/%lu", _page + 1,_totol];
    [_scrollv setContentOffset:CGPointMake(_page * self.view.frame.size.width, 0)];
}

- (void)TapAction{
    
    if (self.navigationController.navigationBar.hidden ==NO) {
        
        
        [UIView animateWithDuration:1.5 animations:^{
            self.navigationController.navigationBar.hidden = YES;

        }];
        
    }else{
        
        [UIView animateWithDuration:1.5 animations:^{
            self.navigationController.navigationBar.hidden = NO;
            
        }];
    }
    
    
}

- (void)fanhui
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - Btn

- (void)onDeleteImageBtnClicked
{
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"提示" message:@"是否删除这张照片" preferredStyle:UIAlertControllerStyleAlert];
    
    [alertController addAction:[UIAlertAction actionWithTitle:@"否" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        
    }]];
    
    [alertController addAction:[UIAlertAction actionWithTitle:@"是" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        //删除图片
        if (self.imageUrlList) {
            [self.imageUrlList removeObjectAtIndex:_page];
            if (_page > 0) {
                _page --;
            }
            _totol --;
            
        }else if(self.imageList){
            
            [self.imageList removeObjectAtIndex:_page];
            [_delegate didDelete:_page-1];
            if (_page > 0) {
                _page --;
            }
           

            _totol --;
        }
        
        [self setObjectToScroller];
        if (_delegate && [_delegate respondsToSelector:@selector(onDeleteImage)]) {
            [_delegate onDeleteImage];
            
        }
        
        if (_totol <= 0) {
            [self.navigationController popViewControllerAnimated:YES];
        }

    }]];
    
     [self presentViewController:alertController animated:YES completion:nil];
}

- (void)scrollvTap:(UITapGestureRecognizer *)tap
{
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark - scrollview delegate

-(UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView
{
    if (scrollView.tag != 102) {
        for (UIView *view in scrollView.subviews) {
            if ([view isKindOfClass:[UIImageView class]]) {
                return view;
            }
        }
    }
    return nil;
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    if (scrollView.tag == 102) {
        
        int page =  (scrollView.contentOffset.x + self.view.frame.size.width ) / self.view.frame.size.width ;
        _page = page - 1;
        self.indicator.text = [NSString stringWithFormat:@"%d/%lu", page,_totol];
    }
}

@end
