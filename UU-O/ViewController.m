//
//  ViewController.m
//  UU-O
//
//  Created by admin on 2017/8/21.
//  Copyright © 2017年 L. All rights reserved.
//

#import "ViewController.h"
#import <AVOSCloud/AVOSCloud.h>
#import <AFNetworking/AFNetworking.h>

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *bgImageView;//背景图片
@property (weak, nonatomic) IBOutlet UIView *transParentView;//半透明层
@property (weak, nonatomic) IBOutlet UITextField *userName;
@property (weak, nonatomic) IBOutlet UITextField *userPwd;
@property (nonatomic,assign) Boolean isBool;

- (IBAction)loginButton:(UIButton *)sender;
- (void)logOfTextSend;
- (void)login;
- (void)getData;
@property (nonatomic,strong) NSArray<AVObject *> *searchResult;

@end



@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _transParentView.backgroundColor = [UIColor colorWithRed:220/225 green:220/225 blue:220/225 alpha:0.5];
    self.isBool = false;
    NSLog(@"hello world");
    [self getData];
   // self.logOfTextSend;
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)loginButton:(UIButton *)sender {
    NSLog(@"hello oc");
    [self logOfTextSend];
    //logOfTextSend();
}
//
- (void)logOfTextSend
{
    AVQuery *query = [AVQuery queryWithClassName:@"UserInfo"];
    [query findObjectsInBackgroundWithBlock:^(NSArray * _Nullable objects, NSError * _Nullable error) {
        self.searchResult = objects;
        NSLog(@"%lu", (unsigned long)self.searchResult.count);
        for (int i = 0; i < self.searchResult.count; i++) {
        NSString *resultName = self.searchResult[i][@"userName"];
            NSString *resultPwd = self.searchResult[i][@"userPwd"];
            if ([self.userName.text isEqualToString:resultName] && [self.userPwd.text isEqualToString:resultPwd]){
                NSLog(@"success");
                self.isBool = true;
            }else{
                NSLog(@"error");
            }
            
        NSLog(@"%d", i);
    }
        [self login];
    }];
    
    
//    NSString *loginName = self.userName.text;
//    NSLog(loginName);
//    NSLog(self.userPwd.text);
}

- (void) login
{
    if (_isBool == false){
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"提示" message:@"账户名或者密码错误" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *alertAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleCancel handler:nil];
        
        [alertController addAction:alertAction];
        [self presentViewController:alertController animated:YES completion:nil];
        
        
        
    }else{
        NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
        
        [defaults setObject:self.userName.text forKey:@"name"];
        
        UIStoryboard *sb = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
        UIViewController *vc = [sb instantiateViewControllerWithIdentifier:@"cell"];
         [self presentViewController:vc animated:YES completion:nil];
    }
}

- (void) getData
{
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    AFURLSessionManager *manager = [[AFURLSessionManager alloc] initWithSessionConfiguration:configuration];
    
    NSURL *URL = [NSURL URLWithString:@"https://api.map.baidu.com/location/ip?ak=6imoN8a44I7y8kmuvxn2WDSo4UPDKdMH&mcode=bloc.io.UU&coor=bd09ll/get"];
    NSURLRequest *request = [NSURLRequest requestWithURL:URL];
    
    NSURLSessionDataTask *dataTask = [manager dataTaskWithRequest:request completionHandler:^(NSURLResponse * _Nonnull response, id  _Nullable responseObject, NSError * _Nullable error) {
        if (error){
            NSLog(@"error:%@",error);
        }else{
             //NSLog(@"%@ ",  responseObject);
            
            //json解析
            NSDictionary *dict = (NSDictionary *)responseObject;
            NSLog(@"one=%@",dict[@"address"]);
        }
    }];
    [dataTask resume];
}

@end
