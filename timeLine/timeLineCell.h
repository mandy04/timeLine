//
//  timeLineCell.h
//  timeLine
//
//  Created by llbt on 16/3/3.
//  Copyright © 2016年 llbt. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UITapImageView.h"
#import "TimeLineModel.h"


@interface timeLineCell : UITableViewCell
@property (nonatomic,strong)UITapImageView *userIV;//头像
@property (nonatomic,strong)UILabel *titleLabel,*timeLabel;

@property (nonatomic, assign) BOOL top, bottom;
@property (nonatomic,strong)TimeLineModel *model;

+ (CGFloat)cellForheight;
- (void)configWithProAct:(TimeLineModel *)model isTop:(BOOL)top isBottom:(BOOL)bottom;
@end
