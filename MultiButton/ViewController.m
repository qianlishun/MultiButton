//
//  ViewController.m
//  MultiButton
//
//  Created by mrq on 16/10/13.
//  Copyright © 2016年 MrQ. All rights reserved.
//

#import "ViewController.h"
#import "MultiButton.h"

@interface ViewController ()
@property (nonatomic,strong) MultiButton *btn1;

@property (nonatomic,strong) MultiButton *btn2;

@end

@implementation ViewController

#import "MultiButton.h"

MultiButton *btn = [[MultiButton alloc]initWithFrame:CGRectMake(0, 0, 200, 30)];
btn.center = CGPointMake(self.view.center.x, 300);
[btn setName:@"volume" state:@"11"];
[self.view addSubview:btn];


- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor grayColor];
    
    self.btn1 = [[MultiButton alloc]initWithFrame:CGRectMake(0, 0, 200, 50)];
    _btn1.center = CGPointMake(self.view.center.x, 100);
    [_btn1 setName:@"name" state:@"0%|33%|66%|100%"];
    [_btn1.titleLabel setFont:[UIFont systemFontOfSize:30]];
    [self.view addSubview:_btn1];
    
    [_btn1 setBackgroundColor:[UIColor orangeColor]];
    [_btn1 addTarget:self action:@selector(timeDidClick) forControlEvents:UIControlEventTouchUpInside];
    
    self.btn2 = [[MultiButton alloc]initWithFrame:CGRectMake(0, 0, 200, 30)];
    _btn2.center = CGPointMake(self.view.center.x, 200);
    [self.view addSubview:_btn2];
    [_btn2 setName:@"name" state:@"ON|OFF"];
    [_btn2 setBackgroundImage:[UIImage imageNamed:@"xxx.png"]];
    
    MultiButton *btn3 = [[MultiButton alloc]initWithFrame:CGRectMake(0, 0, 200, 30)];
    btn3.center = CGPointMake(self.view.center.x, 300);
    [self.view addSubview:btn3];
    [btn3 setName:@"volume" state:@"11"];
    
}

- (void)timeDidClick{
    
    NSLog(@"%@",self.btn1.currentState);
    NSLog(@"%@",self.btn2.currentState);
    
    if([self.btn2.currentState  isEqual: @"ON"]){
        [self btnON];
    }
    if ([self.btn1.currentState isEqualToString:@"33%"]) {
        
        self.view.backgroundColor = [UIColor lightGrayColor];
        
    }else if ([self.btn1.currentState isEqualToString:@"66%"]){
        self.view.backgroundColor = [UIColor darkGrayColor];
        
    }else if ([self.btn1.currentState isEqualToString:@"100%"]){
        
        self.view.backgroundColor = [UIColor blackColor];
        
    }else{
        self.view.backgroundColor = [UIColor whiteColor];
    }
}

- (void)btnON{
    
    NSLog(@"=====>BLE is ON");
}

@end
