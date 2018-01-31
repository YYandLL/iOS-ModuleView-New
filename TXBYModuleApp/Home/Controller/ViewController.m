//
//  ViewController.m
//  TXBYModuleApp
//
//  Created by YandL on 16/10/20.
//  Copyright © 2016年 YandL. All rights reserved.
//

#import "ViewController.h"
#import "TXBYAlertView.h"
#import "TXBYScrollView.h"
#import "HomeItem.h"
#import "HomeMetroView.h"

#import "TestViewController.h"

@interface ViewController ()<TXBYScrollViewDelegate>
/**
 *  headerView
 */
@property (nonatomic, weak) UIView *headerView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.tableFooterView = [UIView new];
    [self setupNav];
    [self setUpHeaderView];
}

/**
 *  添加导航栏按钮
 */
- (void)setupNav {
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"试试" style:UIBarButtonItemStylePlain target:self action:@selector(confirm)];
}


- (void)setUpHeaderView {
    UIView *view = [[UIView alloc] init];
    self.headerView = view;
    view.backgroundColor = [UIColor colorWithRed:239/255.0 green:239/255.0 blue:239/255.0 alpha:1.0];
    //头文件的高度
    view.frame = CGRectMake(0, 0, TXBYApplicationW, TXBYApplicationW / 2.1);
    //添加itemView
    [self setupMetroView];
    
    self.tableView.tableHeaderView = view;
    
}

/**
 *  点击事件
 */
- (void)confirm {
    [[TXBYAlertView alertWithTitle:@"我是首页" message:@"你想要干嘛" buttonTitles:@"不干嘛", nil] showWithClickBlock:^(NSInteger index) {
        NSLog(@"%ld", index);
    }];
}

/**
 *  设置视图item
 */
- (void)setupMetroView {
    NSArray *metroArr = [HomeSection mj_objectArrayWithFilename:self.fileName];
    HomeMetroView *metroView = [HomeMetroView metroViewWith:metroArr click:^(NSIndexPath *indexPath) {
        NSString *str;
        if (indexPath.section == -1) {
            str = [NSString stringWithFormat:@"你点击了第%ld个item", indexPath.row];
        } else {
            str = [NSString stringWithFormat:@"你点击了第%ld个item的第%ld张图片", indexPath.section, indexPath.row];
        }
        [[TXBYAlertView alertWithTitle:@"温馨提示" message:str buttonTitles:@"好的", nil] showWithClickBlock:^(NSInteger index) {
            NSLog(@"%ld", index);
//            TestViewController *VC = [[TestViewController alloc] init];
//            [self.navigationController pushViewController:VC animated:YES];
        }];
    }];
    self.headerView.txby_height = metroView.metroHeight;
    [self.headerView addSubview:metroView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 0;
}

@end
