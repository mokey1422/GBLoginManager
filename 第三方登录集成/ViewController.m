//
//  ViewController.m
//  第三方登录集成
//
//  Created by marks on 15/6/3.
//  Copyright (c) 2015年 zhangguobing. All rights reserved.
//

#import "ViewController.h"
#import "GBLoginManager.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    NSArray*arr=@[@"新浪",@"微信",@"QQ",@"Qzone",@"腾讯微博",@"人人网",@"解除授权"];
    
    CGFloat x=10;
    CGFloat y=64;
    CGFloat Height=40;
    CGFloat width=90;
    
    for(int i=0;i<arr.count;i++){
        
        UIButton*button=[UIButton buttonWithType:UIButtonTypeCustom ];
        button.backgroundColor=[UIColor orangeColor];
        button.frame=CGRectMake(x, y, width, Height) ;
        [button setTitle:arr[i] forState:UIControlStateNormal];
        [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        
        button.tag=100+i;
        
        [button addTarget:self action:@selector(buttonclick:) forControlEvents:UIControlEventTouchUpInside];
        
        [self.view addSubview:button];
        if(i%3!=2){
            
            x=x+width+10;
            
        }else{
            
            x=10;
            y=y+Height+20;
        }
            
        
    }
    
    
}

-(void)buttonclick:(UIButton*)button{
    if(button.tag==100){
        
        //新浪
       [GBLoginManager SinaSSO:self AndGetUserinfoBlock:^(NSDictionary *snsAccount) {
           NSLog(@"===========%@",snsAccount[@"userName"]);
       }];
        
        
    }else if(button.tag==101){
        
        //微信
        
        [GBLoginManager WeiChatSSO:self AndGetUserinfoBlock:^(NSDictionary *snsAccount) {
            NSLog(@"===========%@",snsAccount[@"userName"]);
        }];

        
        
    }else if (button.tag==102){
        //qq
        
        [GBLoginManager QQSSOWithDelegate:self AndGetUserinfoBlock:^(NSDictionary *snsAccount) {
             NSLog(@"===========%@",snsAccount[@"userName"]);
        }];
        
        
    }else if(button.tag==103){
        
        //qqzone
        
        [GBLoginManager QQZoneSSO:self AndGetUserinfoBlock:^(NSDictionary *snsAccount) {
            NSLog(@"===========%@",snsAccount[@"userName"]);
        }];
        
    }else if (button.tag==104){
        //腾讯微博
        
        [GBLoginManager TencentWeiboSSO:self AndGetUserinfoBlock:^(NSDictionary *snsAccount) {
             NSLog(@"===========%@",snsAccount[@"userName"]);
        }];
        
        
        
    }else if (button.tag==105){
        //人人网
        [GBLoginManager RenRenSSO:self AndGetUserinfoBlock:^(NSDictionary *snsAccount) {
            NSLog(@"===========%@",snsAccount[@"userName"]);
        }];
        
    }
    
    else  if(button.tag==106){
        
        // 解除授权
        
        [GBLoginManager cancelLogin];
       
        
    }
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
