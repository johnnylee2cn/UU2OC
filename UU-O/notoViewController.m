//
//  notoViewController.m
//  UU-O
//
//  Created by admin on 2017/9/7.
//  Copyright © 2017年 L. All rights reserved.
//

#import "notoViewController.h"
#import "notoTableViewCell.h"
#import <AVOSCloud/AVOSCloud.h>

@interface notoViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *notoTableView;
@property (nonatomic,assign) NSString *userName;
@property (nonatomic,strong) NSArray<AVObject *> *searchResult;

- (void)getDataFromCloud;
- (void)labelNSAttracment:(UILabel*)label andText:(NSString *)text andImage:(UIImage*)image;
@end

@implementation notoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [_notoTableView setDelegate:self];
    [_notoTableView setDataSource:self];
    
    NSUserDefaults *defafults = [NSUserDefaults standardUserDefaults];
    _userName = [defafults objectForKey:@"name"];
    NSLog(@"=========================================");
    NSLog(@"%@", _userName);
    [self getDataFromCloud];
    
    //将tableview未显示部分设置为空白
    UIView *footView = [[UIView alloc]init];
    self.notoTableView.tableFooterView = footView;
    
    self.notoTableView.rowHeight = UITableViewAutomaticDimension;
    self.notoTableView.estimatedRowHeight = 200;
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)getDataFromCloud{
    AVQuery *query = [AVQuery queryWithClassName:@"UserNoto"];
    [query findObjectsInBackgroundWithBlock:^(NSArray * _Nullable objects, NSError * _Nullable error) {
        _searchResult = objects;
        self.notoTableView.reloadData;
    }];
}

- (void)labelNSAttracment:(UILabel *)label andText:(NSString *)text andImage:(UIImage *)image{
    //创建一个富文本
    NSMutableAttributedString *attri = [[NSMutableAttributedString alloc]initWithString:text];
    
    //添加图片
    NSTextAttachment *attachment = [[NSTextAttachment alloc]init];
   // attachment.image = image;
    
    //创建带有图片等富文本
    NSAttributedString *string = [NSAttributedString attributedStringWithAttachment:attachment];
    [attri appendAttributedString:string];
    label.attributedText = attri;
}

//MARK: - TableViewDelegate && TableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.searchResult.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    AVObject *value = self.searchResult[indexPath.row];
    notoTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    cell.notoTextLabel.text = value[@"notoText"];
    UIImage *image = [UIImage imageNamed:@"4"];
    [self labelNSAttracment:cell.notoTextLabel andText:value[@"notoText"] andImage:image];
    return cell;
}


//- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
//    return 200;
//}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
