//
//  DZViewController.m
//  DZCommonDataSource
//
//  Created by 176840964 on 12/06/2020.
//  Copyright (c) 2020 176840964. All rights reserved.
//

#import "DZViewController.h"
#import "DZPresent.h"
#import "DZTableViewCell.h"
#import <DZDataSource.h>
#import "DZModel.h"

@interface DZViewController ()
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) DZPresent *present;
@property (nonatomic, strong) DZDataSource *dataSource;
@end

@implementation DZViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    //数据提供层
    self.present = [[DZPresent alloc] init];
    self.present.vc = self;
    
    //数据代理层
    __weak typeof(self) weakSelf = self;
    self.dataSource = [[DZDataSource alloc] initWithIdentifier:NSStringFromClass([DZTableViewCell class]) configureBlock:^(DZTableViewCell *cell, DZModel *model, NSIndexPath * _Nonnull indexPath) {
        
        __strong typeof(self) strongSelf = weakSelf;
        [cell loadUIByModel:model indexPath:indexPath delegate:strongSelf.present];
    }];
    [self.dataSource addDataArray:self.present.dataArray];
    
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.tableView];
    self.tableView.dataSource = self.dataSource;
    
}

- (void)reloadUI {
    [self.dataSource addDataArray:self.present.dataArray];
    [self.tableView reloadData];
}

#pragma mark - lazyLoad
- (UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
        _tableView.tableFooterView = [UIView new];
        _tableView.backgroundColor = [UIColor whiteColor];
        [_tableView registerClass:[DZTableViewCell class] forCellReuseIdentifier:NSStringFromClass([DZTableViewCell class])];
    }
    return _tableView;
}

@end
