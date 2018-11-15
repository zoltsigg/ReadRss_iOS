//
//  SideTableViewCell.m
//  ReadRss
//
//  Created by cheng on 2018/11/15.
//  Copyright © 2018 cheng. All rights reserved.
//

#import "SideTableViewCell.h"
#import <Masonry/Masonry.h>

@implementation SideTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if(self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self createUI];
    }
    return self;
}

- (void) createUI {
    [self.contentView addSubview:self.icon];
    [self.icon mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.height.mas_equalTo(@(32));
        make.left.equalTo(self.contentView.mas_left).offset(16*kScale);
        make.top.equalTo(self.contentView.mas_top).offset(8*kScale);
        make.bottom.equalTo(self.contentView.mas_bottom).offset(-8*kScale);
    }];
    
    [self.contentView addSubview:self.navLabel];
    [self.navLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.icon.mas_right).offset(8*kScale);
        make.top.equalTo(self.contentView.mas_top).offset(8*kScale);
        make.bottom.equalTo(self.contentView.mas_bottom).offset(-8*kScale);
    }];
}

- (void) refreshUI: (NSDictionary *)dict {
    [self.icon setImage:[UIImage imageNamed:dict[@"icon"]]];
    self.navLabel.text = dict[@"title"];
}

- (UIImageView *)icon {
    if(!_icon) {
        _icon = [[UIImageView alloc] init];
    }
    return _icon;
}

- (UILabel *)navLabel {
    if(!_navLabel) {
        _navLabel = [[UILabel alloc] init];
        _navLabel.textColor = RGBACOLOR(21, 21, 21, 1.0);
    }
    return _navLabel;
}

@end
