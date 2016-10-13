//
//  MyButton.m
//  ButtonTest
//
//  Created by mrq on 16/9/22.
//  Copyright © 2016年 Sonoptek. All rights reserved.
//

#import "MultiButton.h"

@interface MultiButton(){
    int theStateCount;
}

@property (nonatomic,strong) NSArray *listState;

@property (nonatomic,assign) int count;


@end


@implementation MultiButton

- (void)setName:(NSString *)name state:(NSString *)state{
    [self.titleLabel setText:name];
    
    if(![state containsString:@"|"]){
        self.count = state.intValue;
        [self.detailLabel setText:@"0"];
        self.currentState = self.detailLabel.text;
    }else{
        self.listState = [state componentsSeparatedByString:@"|"];
        self.count = (int)self.listState.count;
        [self.detailLabel setText:_listState[0]];
        self.currentState = self.detailLabel.text;
    }
    
    [self layoutSubviews];
}

- (void)setBackgroundImage:(UIImage *)Image{

    self.backgroundColor = [UIColor colorWithPatternImage:Image];
//    self.layer.contents = (id)Image.CGImage;
}

- (UILabel *)titleLabel{
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 60, 30)];
        
        _titleLabel.font = [UIFont systemFontOfSize:20];
        _titleLabel.textAlignment = NSTextAlignmentRight;
        [_titleLabel setTextColor:[UIColor grayColor]];
        
    }
    return _titleLabel;
}

- (UILabel *)detailLabel{
    if (!_detailLabel) {
        _detailLabel = [[UILabel alloc]initWithFrame:CGRectMake(self.frame.size.width - 60, 2, 60, 30)];
        _detailLabel.font = [UIFont systemFontOfSize:18];

        [_detailLabel setTextColor:[UIColor grayColor]];
 
        
    }
    return _detailLabel;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:self.titleLabel];
        [self addSubview:self.detailLabel];
        
        self.layer.cornerRadius = 5;
        self.layer.masksToBounds = YES;
        self.backgroundColor = [UIColor whiteColor];
        
        self.listState = [NSArray array];
        
        theStateCount = 0;
    }
    return self;
}

- (void)endTrackingWithTouch:(nullable UITouch *)touch withEvent:(nullable UIEvent *)event{

    
    if (theStateCount < self.count-1) {
        theStateCount++;
    }else if(theStateCount == self.count-1){
        theStateCount = 0;
    }
    
    if (self.listState.count>1) {
        _detailLabel.text = self.listState[theStateCount];
    }else{
        _detailLabel.text = [NSString stringWithFormat:@"%d",theStateCount];
    }
    
    self.currentState = _detailLabel.text;
    
    NSLog(@"%@",_detailLabel.text);
    
    [self layoutSubviews];

}

-(NSInteger)tag{
    return self.currentState.integerValue;
}

-(void)layoutSubviews{
    [super layoutSubviews];
    [_titleLabel sizeToFit];
    [_detailLabel sizeToFit];
    [self sizeToFit];
    _titleLabel.center = CGPointMake(_titleLabel.frame.size.width/2+5, self.frame.size.height/2);
    _detailLabel.center = CGPointMake(self.frame.size.width - _titleLabel.frame.size.width/2 -10 , self.frame.size.height/2);
}

@end
