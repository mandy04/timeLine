//
//  timeLineCell.m
//  timeLine
//
//  Created by llbt on 16/3/3.
//  Copyright © 2016年 llbt. All rights reserved.
//

#import "timeLineCell.h"
#define kPadingLeftWidth  15.0f
#define kPadingUpHeight  10.0f

#define kPadingRightWidth kPadingLeftWidth
#define kIconHeight 33.0
#define kTimeLineCell_LeftPading 85
#define kTimeLineCell_TimeIconWidth 13.0
#define kTimeLineCell_TimeIconHeight 33.0

#define kTimeLineCell_TimeLineWidth 2.0
#define kScreen_Width [UIScreen mainScreen].bounds.size.width
#define kTimeLineCell_TimeContent (kScreen_Width-kPadingLeftWidth-kPadingRightWidth)

#define kCellheight 60

@interface timeLineCell()
@property (nonatomic,strong)UIImageView *timeIconView, *timeLineView;
@end

@implementation timeLineCell

- (void)configWithProAct:(TimeLineModel *)model isTop:(BOOL)top isBottom:(BOOL)bottom{
    self.model = model;
    _top = top;
    _bottom = bottom;
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        self.backgroundColor = [UIColor clearColor];
        if (!_userIV) {
            CGRect frame = CGRectMake(kPadingLeftWidth, kPadingUpHeight, kIconHeight, kIconHeight);
            _userIV = [[UITapImageView alloc]initWithFrame:frame];
            [self.contentView addSubview:_userIV];
        }
        
        CGFloat imgRightX = CGRectGetMaxX(_userIV.frame); //就是 x+width
        CGFloat timeLineCenterX = imgRightX + (kTimeLineCell_LeftPading - imgRightX)/2;
        
        if (!_timeLineView) {
            CGRect frame = CGRectMake(timeLineCenterX - kTimeLineCell_TimeLineWidth/2, 0, kTimeLineCell_TimeLineWidth, 1);
            _timeLineView = [[UIImageView alloc]initWithFrame:frame];
            [self.contentView addSubview:_timeLineView];
        }
        
        if (!_timeIconView) {
            CGRect frame = CGRectMake(timeLineCenterX - kTimeLineCell_TimeIconWidth/2, 10+(kTimeLineCell_TimeIconHeight- kTimeLineCell_TimeIconWidth)/2 , kTimeLineCell_TimeIconWidth, kTimeLineCell_TimeIconWidth);
            
            _timeIconView = [[UIImageView alloc]initWithFrame:frame];
            [self.contentView addSubview:_timeIconView];
        }
        
        if (!_titleLabel) {
            _titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(kTimeLineCell_LeftPading, kPadingUpHeight, kTimeLineCell_TimeContent, 20)];
            _titleLabel.tag = 11;
            _titleLabel.textColor = [UIColor blackColor];
            _titleLabel.font = [UIFont systemFontOfSize:14.0f];
            [self.contentView addSubview:_titleLabel];
        }
        
        if (!_timeLabel) {
            _timeLabel = [[UILabel alloc]initWithFrame:CGRectMake(kTimeLineCell_LeftPading, kPadingUpHeight+20, kTimeLineCell_TimeContent, 20)];
            _timeLabel.tag = 111;
            _timeLabel.textColor = [UIColor blackColor];
            _timeLabel.font = [UIFont systemFontOfSize:14.0f];
            [self.contentView addSubview:_timeLabel];
        }
    }
    
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    //    时间轴Line
    CGRect frame = _timeLineView.frame;
    
    if (_bottom) {
        frame.origin.y = 10+kTimeLineCell_TimeIconHeight/2;
        if (_top) {
            frame.size.height = 0;
        }else{
            frame.size.height = kCellheight -frame.origin.y;
        }
    }else{
        frame.origin.y = 0;
        if (_top) {
            frame.size.height = 10+kTimeLineCell_TimeIconHeight/2;
        }else{
            frame.size.height = kCellheight;
        }
    }
    _timeLineView.frame = frame;
    [_timeLineView setImage:[UIImage imageNamed:@"timeline_line_unread"]];
    //    时间轴Icon
    [_timeIconView setImage:[UIImage imageNamed: @"timeline_icon_unread"]];
}
- (void)awakeFromNib {
    // Initialization code
}

+ (CGFloat)cellForheight {
    return kCellheight;
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
