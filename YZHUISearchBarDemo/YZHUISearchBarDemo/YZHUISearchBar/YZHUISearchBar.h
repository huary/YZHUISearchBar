//
//  YZHUISearchBar.h
//  contact
//
//  Created by yuan on 2018/12/20.
//  Copyright © 2018年 gdtech. All rights reserved.
//

#import <UIKit/UIKit.h>

//typedef NS_ENUM(NSInteger, YZHSearchPlaceHolderAlignment)
//{
//    YZHSearchPlaceholderAlignmentLeft       = 0,
//    YZHSearchPlaceholderAlignmentCenter     = 1,
//    YZHSearchPlaceholderAlignmentRight      = 2,
//};

@interface YZHUISearchBar : UIView

/* <#注释#> */
@property (nonatomic, strong, readonly) UITextField *inputTextField;

/* <#注释#> */
@property (nonatomic, strong, readonly) UIImageView *imageView;

/* <#注释#> */
@property (nonatomic, strong, readonly) UIButton *cancelButton;

/* <#注释#> */
@property (nonatomic, strong) NSAttributedString *placeholder;

-(void)setSearchImage:(UIImage*)image;

@end
