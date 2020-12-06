//
//  DZTableViewCell.m
//  DZCommonDataSource_Example
//
//  Created by 张晓龙 on 2020/12/6.
//  Copyright © 2020 176840964. All rights reserved.
//

#import "DZTableViewCell.h"
#import <Masonry.h>

@interface DZTableViewCell ()
@property (nonatomic, strong) UILabel *nameLab;
@property (nonatomic, strong) UILabel *numLab;
@property (nonatomic, strong) UIButton *btn;
@property (nonatomic, assign) NSInteger num;
@property (nonatomic, strong) NSIndexPath *indexPath;
@end

@implementation DZTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self setupUI];
    }
    
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    [self.nameLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.contentView);
        make.left.mas_equalTo(20);
    }];
    
    [self.numLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self.contentView);
        make.size.mas_equalTo(CGSizeMake(50, 30));
    }];
    
    [self.btn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(-20);
        make.centerY.equalTo(self.contentView);
        make.size.mas_equalTo(CGSizeMake(40, 25));
    }];
}

- (void)loadUIByModel:(DZModel *)model indexPath:(NSIndexPath *)indexPath delegate:(id<DZPresentDelegate>)delegaet {
    self.num = model.num.integerValue;
    self.nameLab.text = model.name;
    self.numLab.text = model.num;
    self.indexPath = indexPath;
    self.delegate = delegaet;
}

#pragma mark -
- (void)setupUI {
    [self.contentView addSubview:self.nameLab];
    [self.contentView addSubview:self.numLab];
    [self.contentView addSubview:self.btn];
}

#pragma mark - action
- (void)onTapBtn:(UIButton *)btn {
    self.num ++;
    self.numLab.text = [NSString stringWithFormat:@"%ld", self.num];
    
    if (self.delegate && [self.delegate respondsToSelector:@selector(didClickNum:indexPath:)]) {
        [self.delegate didClickNum:self.numLab.text indexPath:self.indexPath];
    }
}

#pragma mark - lazy load
- (UILabel *)nameLab {
    if (_nameLab == nil) {
        _nameLab = [[UILabel alloc] init];
        _nameLab.text = @"name";
        _nameLab.textAlignment = NSTextAlignmentCenter;
        _nameLab.font = [UIFont systemFontOfSize:20];
        _nameLab.textColor = [UIColor orangeColor];
    }
    return _nameLab;
}

- (UILabel *)numLab{
    if (_numLab == nil) {
        _numLab = [[UILabel alloc] init];
        _numLab.text = @"0";
        _numLab.textAlignment = NSTextAlignmentCenter;
        _numLab.font = [UIFont systemFontOfSize:20];
        _numLab.textColor = [UIColor redColor];
    }
    return _numLab;
}

- (UIButton *)btn {
    if (_btn == nil) {
        _btn = [UIButton buttonWithType:UIButtonTypeCustom];
        _btn.backgroundColor = [UIColor blueColor];
        [_btn setTitle:@"add" forState:UIControlStateNormal];
        [_btn addTarget:self action:@selector(onTapBtn:) forControlEvents:UIControlEventTouchUpInside];
    }
    
    return _btn;
}

@end
