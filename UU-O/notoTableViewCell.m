//
//  notoTableViewCell.m
//  UU-O
//
//  Created by admin on 2017/9/8.
//  Copyright © 2017年 L. All rights reserved.
//

#import "notoTableViewCell.h"
#import <Masonry/Masonry.h>

//#define WEAKSELF(weakSelf)  __weak __typeof(&*self)weakSelf = self;
@implementation notoTableViewCell

//- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
//{
//    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
//    if (self) {
////        self.notoTextLabel = [[UILabel alloc] init];
////        self.myLabel.backgroundColor = [UIColor orangeColor];
////        self.myLabel.font = [UIFont systemFontOfSize:10];
////        self.myLabel.numberOfLines = 0;
////        [self.contentView addSubview:_myLabel];
////        
////        self.otherLabel = [[UILabel alloc] init];
////        self.otherLabel.backgroundColor = [UIColor cyanColor];
////        self.otherLabel.font = [UIFont systemFontOfSize:16];
////        self.otherLabel.numberOfLines = 0;
////        [self.contentView addSubview:_otherLabel];
//        
//        WEAKSELF(weakSelf);
//        
//        [_notoTextLabel mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.width.mas_equalTo(@150);
//            make.top.mas_equalTo(weakSelf.contentView.mas_top).offset(5);
//            make.left.mas_equalTo(weakSelf.contentView.mas_left).offset(5);
//            make.bottom.equalTo(weakSelf.contentView).offset(-5);
//            make.right.mas_equalTo(_notoTitleLabel.mas_left).offset(-5);
//        }];
//        [_notoTitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.top.mas_equalTo(_notoTextLabel.mas_top).offset(0);
//            make.left.mas_equalTo(_notoTextLabel.mas_right).offset(5);
//            make.bottom.mas_equalTo(weakSelf.contentView.mas_bottom).offset(-5);
//            make.right.mas_equalTo(weakSelf.contentView.mas_right).offset(-5);
//        }];
//    }
//    return self;
//}
//
- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
