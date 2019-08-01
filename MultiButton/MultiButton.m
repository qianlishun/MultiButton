//
//  MyButton.m
//  ButtonTest
//
//  Created by mrq on 16/9/22.
//

#import "MultiButton.h"

@interface MultiButton(){
    NSInteger theStateCount;
}

@property (nonatomic,strong) NSArray *listState;

@property (nonatomic,assign) NSInteger count;


@end


@implementation MultiButton

- (void)setName:(NSString *)name state:(NSString *)state{
    [self.titleLabel setText:name];
    
    if(![state containsString:@"|"]){
        self.count = state.intValue;
        self.listState = @[state];
        [self.detailLabel setText:@"0"];
        self.currentState = self.detailLabel.text;
    }else{
        self.listState = [state componentsSeparatedByString:@"|"];
        self.count = self.listState.count;
        [self.detailLabel setText:_listState[0]];
        self.currentState = self.detailLabel.text;
    }
    
    [self layoutSubviews];
}

- (void)setTitle:(NSString *)title detail:(NSString *)detail{
    [self.titleLabel setText:title];
    [self.detailLabel setText:detail];
    
    
    self.count = 0;
    
    self.currentState = self.detailLabel.text;
    
    [self layoutSubviews];
}

- (void)setBackgroundImage:(UIImage *)Image{
    
    self.backgroundColor = [UIColor colorWithPatternImage:Image];
    //    self.layer.contents = (id)Image.CGImage;
}

- (UILabel *)titleLabel{
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 60, 30)];
        _titleLabel.font = [UIFont systemFontOfSize:mFontSize];
        _titleLabel.textAlignment = NSTextAlignmentLeft;
        [_titleLabel setTextColor:[UIColor grayColor]];
        
    }
    return _titleLabel;
}

- (UILabel *)detailLabel{
    if (!_detailLabel) {
        _detailLabel = [[UILabel alloc]initWithFrame:CGRectMake(self.frame.size.width - 60, 2, 60, 30)];
        _detailLabel.font = [UIFont systemFontOfSize:mFontSize];
        _detailLabel.textAlignment = NSTextAlignmentRight;
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
    
    [NSObject cancelPreviousPerformRequestsWithTarget:self];
    
    [self.titleLabel setTextColor:[UIColor blackColor]];
    [self.detailLabel setTextColor:[UIColor blackColor]];
    
    [self performSelector:@selector(changeColor) withObject:nil afterDelay:0.1];
    
    [self sendClick];
}

- (void)changeColor{
    [self.titleLabel setTextColor:[UIColor grayColor]];
    [self.detailLabel setTextColor:[UIColor grayColor]];
}

- (void)sendClick{
    if (theStateCount < self.count-1) {
        theStateCount++;
    }else if(theStateCount == self.count-1){
        theStateCount = 0;
    }
    NSString *str;
    
    if (self.listState.count>1) {
        str = self.listState[theStateCount];
    }else if(self.listState.count==1){
        str = [NSString stringWithFormat:@"%zd",theStateCount];
    }else{
        str =  _detailLabel.text;
    }
    
    self.currentState = _detailLabel.text = str;
    
    //    NSLog(@"%@",_detailLabel.text);
    [self layoutSubviews];
}

- (NSInteger)currentStateIndex{
    return theStateCount;
}

- (void)setCurrentStateIndex:(NSInteger)currentStateIndex{
    theStateCount = currentStateIndex;
    
    NSString *str;
    if (self.listState.count>1) {
        str = self.listState[theStateCount];
    }else{
        str = [NSString stringWithFormat:@"%zd",theStateCount];
    }
    self.currentState = _detailLabel.text = str;
    [self layoutSubviews];
}

- (void)setStateStr:(NSString *)str{
    for (int i=0; i<self.listState.count; i++) {
        if ([str isEqualToString:self.listState[i]]) {
            [self setCurrentStateIndex:i];
            return;
        }
    }
    _detailLabel.text = str;
    _currentState = str;
    [self layoutSubviews];
}

-(void)layoutSubviews{
    [super layoutSubviews];
    [_titleLabel sizeToFit];
    [_detailLabel sizeToFit];
    [self sizeToFit];
    _titleLabel.center = CGPointMake(_titleLabel.frame.size.width/2+5, self.frame.size.height/2);
    _detailLabel.center = CGPointMake(self.frame.size.width - _detailLabel.frame.size.width/2 -5 , self.frame.size.height/2);
}

-(void)setEnabled:(BOOL)enabled{
    [super setEnabled:enabled];
    if (enabled)
    {
        self.alpha = 1;
    }
    else
    {
        self.alpha = 0.7;
    }
}

@end
