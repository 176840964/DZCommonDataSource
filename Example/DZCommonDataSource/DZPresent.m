//
//  DZPresent.m
//  DZCommonDataSource_Example
//
//  Created by 张晓龙 on 2020/12/6.
//  Copyright © 2020 176840964. All rights reserved.
//

#import "DZPresent.h"
#import "DZModel.h"
#import "DZViewController.h"

@implementation DZPresent

- (instancetype)init {
    if (self = [super init]) {
        [self loadData];
        self.delegate = self;
    }
    return self;
}


- (void)loadData{
    
    NSArray *temArray =
    @[
      @{@"name":@"Hello",@"imageUrl":@"http://Hello",@"num":@"99"},
      @{@"name":@"DZ",@"imageUrl":@"http://DZ",@"num":@"99"},
      @{@"name":@"Dragonet",@"imageUrl":@"http://Dragonet",@"num":@"99"},
      @{@"name":@"!!!",@"imageUrl":@"http://!!!",@"num":@"59"},
      @{@"name":@"Hello",@"imageUrl":@"http://Hello",@"num":@"99"},
      @{@"name":@"DZ",@"imageUrl":@"http://DZ",@"num":@"99"},
      @{@"name":@"Dragonet",@"imageUrl":@"http://Dragonet",@"num":@"99"},
      @{@"name":@"!!!",@"imageUrl":@"http://!!!",@"num":@"59"},
      @{@"name":@"Hello",@"imageUrl":@"http://Hello",@"num":@"99"},
      @{@"name":@"DZ",@"imageUrl":@"http://DZ",@"num":@"99"},
      @{@"name":@"Dragonet",@"imageUrl":@"http://Dragonet",@"num":@"99"},
      @{@"name":@"!!!",@"imageUrl":@"http://!!!",@"num":@"59"},
    ];

    for (int i = 0; i < temArray.count; i++) {
        DZModel *model = [[DZModel alloc] init];
        [model setValuesForKeysWithDictionary:temArray[i]];
        [self.dataArray addObject:model];
    }
}

#pragma mark - DZPresentDelegate
- (void)didClickNum:(NSString *)numStr indexPath:(NSIndexPath *)indexPath {
    if (indexPath.row < self.dataArray.count) {
        DZModel *m = self.dataArray[indexPath.row];
        m.num = numStr;
        
        if (numStr.integerValue > 101) {
            [self.dataArray removeAllObjects];
            DZModel *model = [[DZModel alloc] init];
            model.name = @"zxl";
            model.num = @"1";
            model.imageUrl = @"";
            [self.dataArray addObject:model];
            
            if (self.delegate && [self.delegate respondsToSelector:@selector(presentVCReloadUI)]) {
                [self.delegate presentVCReloadUI];
            }
        }
    }
}

- (void)presentVCReloadUI {
    DZViewController *vc = (DZViewController*)self.vc;
    [vc reloadUI];
}

#pragma mark - lazy
- (NSMutableArray *)dataArray{
    if (!_dataArray) {
        _dataArray = [NSMutableArray arrayWithCapacity:10];
    }
    return _dataArray;
}

@end
