//
//  DZDataSource.m
//  DZCommonDataSource
//
//  Created by 张晓龙 on 2020/12/6.
//

#import "DZDataSource.h"

@implementation DZDataSource

- (id)initWithIdentifier:(NSString *)identifier configureBlock:(CellConfigureBefore)before {
    if (self = [super init]) {
        _cellIdentifier = identifier;
        _cellConfigureBefore = [before copy];
    }
    
    return self;
}

- (void)addDataArray:(NSArray *)datas{
    if(!datas) return;
    
    if (self.dataArray.count > 0) {
        [self.dataArray removeAllObjects];
    }

    [self.dataArray addObjectsFromArray:datas];
    
}

- (id)modelsAtIndexPath:(NSIndexPath *)indexPath {
    return self.dataArray.count > indexPath.row ? self.dataArray[indexPath.row] : nil;
}

#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return !self.dataArray  ? 0: self.dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:self.cellIdentifier forIndexPath:indexPath];
    id model = [self modelsAtIndexPath:indexPath];
    if(self.cellConfigureBefore) {
        self.cellConfigureBefore(cell, model,indexPath);
    }
    
    return cell;
}


#pragma mark - UICollectionViewDataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return !self.dataArray  ? 0: self.dataArray.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:self.cellIdentifier forIndexPath:indexPath];
    id model = [self modelsAtIndexPath:indexPath];
    
    if(self.cellConfigureBefore) {
        self.cellConfigureBefore(cell, model,indexPath);
    }

    return cell;
}


#pragma mark - lazyLoad
- (NSMutableArray *)dataArray{
    if (!_dataArray) {
        _dataArray = [NSMutableArray arrayWithCapacity:5];
    }
    return _dataArray;
}

@end
