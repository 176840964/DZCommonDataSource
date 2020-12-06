//
//  DZPresent.h
//  DZCommonDataSource_Example
//
//  Created by 张晓龙 on 2020/12/6.
//  Copyright © 2020 176840964. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN


@protocol DZPresentDelegate <NSObject>

@optional
- (void)didClickNum:(NSString *)numStr indexPath:(NSIndexPath *)indexPath;
- (void)presentVCReloadUI;

@end

@interface DZPresent : NSObject <DZPresentDelegate>
@property (nonatomic, strong) NSMutableArray *dataArray;
@property (nonatomic, weak) id<DZPresentDelegate> delegate;
@property (nonatomic, weak) UIViewController *vc;
@end

NS_ASSUME_NONNULL_END
