//
//  DetailViewController.m
//  ReadRss
//
//  Created by cheng on 2018/11/18.
//  Copyright © 2018 cheng. All rights reserved.
//

#import "DetailViewController.h"
#import <Masonry/Masonry.h>

@interface DetailViewController ()

@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setTitleBar];
    [self createUI];
    [self showDetail];
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
    [self setLeftBtnIcon:[UIImage imageNamed:@"ic_navbar_back"]];
    [self setTitle:@"文章"];
}

- (void) onLeftClick {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void) createUI {
    [self.contentView addSubview:self.webView];
    [self.webView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(self.contentView.mas_width);
        make.height.equalTo(self.contentView.mas_height);
    }];
}

- (void) showDetail {
    NSString *tempt = @"<html>"
                        "<head>"
                            "<link rel=\"stylesheet\" href=\"http://i.gtimg.cn/vipstyle/frozenui/2.0.0/css/frozen.css\">"
                        "</head>"
                        "<body>%@</body>"
                    "</html>";
    NSString *html = [NSString stringWithFormat:tempt,self.article.content];
    NSLog(@"html: %@", html);
    [self.webView loadHTMLString:html baseURL:nil];
}


- (UIWebView *)webView {
    if (!_webView) {
        _webView = [[UIWebView alloc] init];
        _webView.backgroundColor = [UIColor whiteColor];
    }
    return _webView;
}
@end
