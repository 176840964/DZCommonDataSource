//
//  DZTableViewCell.h
//  DZCommonDataSource_Example
//
//  Created by 张晓龙 on 2020/12/6.
//  Copyright © 2020 176840964. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DZModel.h"
#import "DZPresent.h"

NS_ASSUME_NONNULL_BEGIN

@interface DZTableViewCell : UITableViewCell
@property (nonatomic, weak) id<DZPresentDelegate> delegate;

- (void)loadUIByModel:(DZModel *)model indexPath:(NSIndexPath *)indexPath delegate:(id<DZPresentDelegate>)delegaet;
@end

NS_ASSUME_NONNULL_END
