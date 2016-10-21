//
//  MultiButton.h
//  ButtonTest
//
//  Created by mrq on 16/9/22.
//  Copyright © 2016年 Sonoptek. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MultiButton : UIControl

- (void)setName:(NSString *)title state:(NSString *)state;

- (void)setBackgroundImage:(UIImage *)Image;

@property (nonatomic,strong) UILabel *detailLabel;
@property (nonatomic,strong) UILabel *titleLabel;

/// 当前状态
@property (nonatomic,copy) NSString* currentState;
@property (nonatomic,assign) NSInteger  theCurrentState;

@end
