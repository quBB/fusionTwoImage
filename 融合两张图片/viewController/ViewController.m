//
//  ViewController.m
//  融合两张图片
//
//  Created by beginner on 15/10/26.
//  Copyright © 2015年 beginner. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initImageView];
}

- (void)initImageView {
    UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(100, 100, 30, 30)];
    imageView.image = [UIImage imageNamed:@"icon-share-wechat.png"];
    [self mergeMutilImage:imageView];
    [self.view addSubview:imageView];
}

- (void)mergeMutilImage:(UIImageView *)imageView {
    UIImage *leftImage = [UIImage imageNamed:@"icon-share-wechat.png"];
    leftImage = [self imageWithImage:leftImage size:CGSizeMake(30, 60) rect:CGRectMake(0, 0, 60, 60)];
    UIImage *rightImage = [UIImage imageNamed:@"icon-share-weibo.png"];
    rightImage = [self imageWithImage:rightImage size:CGSizeMake(30, 60) rect:CGRectMake(-30, 0, 60, 60)];
    CGSize imageViewSize = imageView.image.size;
    
    UIGraphicsBeginImageContextWithOptions(imageViewSize ,NO,[UIScreen mainScreen].scale);
    CGRect leftRect = CGRectMake(0, 0, imageViewSize.width/2, imageViewSize.height);
    CGRect rightRect = CGRectMake(imageViewSize.width/2, 0, imageViewSize.width/2, imageViewSize.height);
    [leftImage drawInRect:leftRect];
    [rightImage drawInRect:rightRect];
    UIImage  *newimage = UIGraphicsGetImageFromCurrentImageContext();
    imageView.image = newimage;
    UIGraphicsEndImageContext();
}

-(UIImage*)imageWithImage:(UIImage *)image size:(CGSize)size rect:(CGRect)rect {
    if (!image) {
        return nil;
    }
    UIGraphicsBeginImageContext(size);  //size 为CGSize类型，即你所需要的图片尺寸
    [image drawInRect:rect];
    UIImage* scaledImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return scaledImage;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
