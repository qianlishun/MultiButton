//
//  MultiButton.h
//  ButtonTest
//
//  Created by mrq on 16/9/22.
//

#define mFontSize [UIScreen mainScreen].bounds.size.width>1000 ? 20 : 15

#import <UIKit/UIKit.h>

@interface MultiButton : UIControl

- (void)setName:(NSString *)title state:(NSString *)state;

- (void)setTitle:(NSString *)title detail:(NSString *)detail;

- (void)setBackgroundImage:(UIImage *)Image;


@property (nonatomic,strong) UILabel *detailLabel;
@property (nonatomic,strong) UILabel *titleLabel;

/// 当前状态
@property (nonatomic,copy) NSString* currentState;

@property (nonatomic,assign) NSInteger  currentStateIndex;


- (void)setStateStr:(NSString *)str;
- (void)sendClick;
@end
