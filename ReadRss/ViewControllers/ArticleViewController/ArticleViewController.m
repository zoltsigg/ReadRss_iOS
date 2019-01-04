//
//  ArticleViewController.m
//  ReadRss
//
//  Created by cheng on 2018/11/2.
//  Copyright © 2018 cheng. All rights reserved.
//

#import "ArticleViewController.h"
#import <Masonry/Masonry.h>
#import "NetworkClient.h"
#import "ArticleModel.h"
#import "ArticleTableCell.h"
#import "DetailViewController.h"
#import "RDRouter.h"

@interface ArticleViewController ()

@end

@implementation ArticleViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setTitleBar];
    [self createUI];
//    [self loadData];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
- (void) setTitleBar {
    [self setLeftBtnIcon:[UIImage imageNamed:@"hamburger"]];
}

- (void) onLeftClick {
    [self openLeftSide];
}

-(void) showData:(RssInfoModel *) model {
    self.model = model;
    [self setTitle:self.model.title];
    [self.view makeToastActivity:CSToastPositionCenter];
    [[NetworkClient sharedInstance] getArticleList:self.model.rid.integerValue callback:^(BOOL isSuccess, NSArray<ArticleModel *> *data) {
        [self.view hideToastActivity];
        if(isSuccess) {
            self.articleList = data;
            [self.articleTableView reloadData];
        } else {
        
        }
    }];
    
}

-(void) createUI {
    
    [self.contentView addSubview:self.articleTableView];
    [self.articleTableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.height.equalTo(self.contentView);
    }];
    
}

- (UITableView *) articleTableView {
    if(!_articleTableView) {
        _articleTableView = [[UITableView alloc] init];
        _articleTableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
        _articleTableView.backgroundColor = [UIColor whiteColor];
        _articleTableView.estimatedRowHeight = 50;
        _articleTableView.rowHeight = UITableViewAutomaticDimension;
        _articleTableView.delegate = self;
        _articleTableView.dataSource = self;
    }
    return _articleTableView;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSUInteger rowNo = indexPath.row;
    ArticleModel *model = self.articleList[rowNo];
    ArticleTableCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ArticleTableCell"];
    if(cell == nil) {
        cell = [[ArticleTableCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"ArticleTableCell"];
    }
    [cell refreshUI:model];
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"index:%ld", [indexPath row]);
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    
    WEAK_SELF
    [RDRouter openURL:ROUTER_ARTICLE_DETAIL withUserInfo:@{@"fromVC":weakSelf, @"articleModel":self.articleList[[indexPath row]]} completion:nil];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.articleList.count;
}

@end
