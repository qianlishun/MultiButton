# MultiButton
Multi-Button, click button change the state. 多功能按钮,点击变换状态.

### Use

①

      #import "MultiButton.h"

      MultiButton *btn = [[MultiButton alloc]initWithFrame:CGRectMake(0, 0, 200, 30)];
      btn.center = CGPointMake(self.view.center.x, 300);
      [btn setName:@"volume" state:@"11"];
      [self.view addSubview:btn];

* the state set the numbers like this

②

      MultiButton *btn = [[MultiButton alloc]initWithFrame:CGRectMake(0, 0, 200, 30)];
      btn.center = CGPointMake(self.view.center.x, 300);
      [btn setName:@"volume" state:@"ON|OFF"];
      [self.view addSubview:btn];
      
* the state set the @"sting1|string2|string3"  like this 

    

* you also can addTarget
        
      [btn addTarget:self action:@selector(timeDidClick) forControlEvents:UIControlEventTouchUpInside];

* Style
          
      [btn setBackgroundImage:[UIImage imageNamed:@"xxx.png"]];
      [btn setBackgroundColor:[UIColor orangeColor]];
      [btn.titleLabel setFont:...];
      [btn.detailLabel setFont:...];
      
 ### Screen
