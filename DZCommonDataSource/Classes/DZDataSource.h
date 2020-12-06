//
//  DZDataSource.h
//  DZCommonDataSource
//
//  Created by 张晓龙 on 2020/12/6.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

typedef void (^CellConfigureBefore)(id cell, id model, NSIndexPath * indexPath);

@interface DZDataSource : NSObject <UITableViewDataSource, UICollectionViewDataSource>

//data
@property (nonatomic, strong) NSMutableArray<id> *dataArray;
//sb
@property (nonatomic, strong) IBInspectable NSString *cellIdentifier;
//block
@property (nonatomic, copy) CellConfigureBefore cellConfigureBefore;

- (id)initWithIdentifier:(NSString *)identifier configureBlock:(CellConfigureBefore)before;

- (void)addDataArray:(NSArray *)datas;
- (id)modelsAtIndexPath:(NSIndexPath *)indexPath;

@end

NS_ASSUME_NONNULL_END
