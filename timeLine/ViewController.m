//
//  ViewController.m
//  timeLine
//
//  Created by llbt on 16/3/3.
//  Copyright © 2016年 llbt. All rights reserved.
//

#import "ViewController.h"
#import "timeLineCell.h"
#import "ViewController1.h"
#define kTimeCell  @"TimeLineCell"

#import "TimeLineModel.h"


@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>
{
    NSArray *titles;
    NSArray *icons;
    NSArray *times;
   
}

@property (nonatomic,strong) UITableView *myTableView;
@property (nonatomic,strong) NSMutableArray *listArray;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self createUI];
    [self makeFakeData];
    
}


- (void)makeFakeData {
    
    self.listArray = [NSMutableArray arrayWithCapacity:0];
    titles = @[@"第1次登录",@"第2次登录",@"第3次登录",@"第4次登录",@"第5次登录",@"第6次登录",@"第7次登录",@"第8次登录",@"第9次登录",@"第10次登录",];
    icons = @[@"1.png",@"1.png",@"1.png",@"1.png",@"1.png",@"1.png",@"1.png",@"1.png",@"1.png",@"1.png"];
    times = @[@"2014-10-11",@"2015-10-11",@"2016-1-11",@"2016-10-11",@"2017-10-11",@"2018-10-11",@"2019-10-11",@"2020-10-11",@"2021-10-11",@"2022-10-11"];
   
    NSMutableArray *tmp = [NSMutableArray arrayWithCapacity:0];

    for (int i = 0; i<10; i++) {
        
        TimeLineModel *model = [[TimeLineModel alloc]init];
        model.title = titles[i];
        model.icon = icons[i];
        model.time = times[i];
        
        [tmp addObject:model];
        //倒序
//        [tmp insertObject:model atIndex:0];

    }
    _listArray = tmp;
}


- (void)createUI {
    
    _myTableView = ({
     
        UITableView *tableView = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
        tableView.delegate = self;
        tableView.dataSource = self;
        tableView.backgroundColor = [UIColor clearColor];
        [tableView registerClass:[timeLineCell class] forCellReuseIdentifier:kTimeCell];
        [tableView setSeparatorColor:[UIColor clearColor]];
        [self.view addSubview:tableView];
        tableView;
    });
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _listArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    timeLineCell *cell = [tableView dequeueReusableCellWithIdentifier:kTimeCell forIndexPath:indexPath];
 
    
    UILabel *ll = (UILabel *)[cell.contentView viewWithTag:11];//否则显示不出来text
    UILabel *lll = (UILabel *)[cell.contentView viewWithTag:111];//否则显示不出来text

    TimeLineModel *ml = _listArray[indexPath.row];
    ll.text = ml.title;
    lll.text = ml.time;
    
    
    NSUInteger row = indexPath.row ;
    BOOL isTop, isBottom;
    isTop = (row == (_listArray.count));//设置时间轴
    isBottom = (row == 0);
    [cell configWithProAct:ml isTop:isTop isBottom:isBottom];

    
    //头像点击事件
    [cell.userIV addTapBlock:^(id obj) {
        ViewController1 *vv = [[ViewController1 alloc]init];
        [self.navigationController pushViewController:vv animated:YES];
    }];
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return [timeLineCell cellForheight];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
