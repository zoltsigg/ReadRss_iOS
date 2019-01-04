//
//  SideTableViewCell.m
//  ReadRss
//
//  Created by cheng on 2018/11/15.
//  Copyright © 2018 cheng. All rights reserved.
//

#import "SideTableViewCell.h"
#import <Masonry/Masonry.h>
#import <PPBadgeView.h>

#define BadgeRadius 25*kScale

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
    CGRect frame = self.contentView.frame;
    frame.size.width = 2*ScreenWidth/3;
    self.contentView.frame = frame;
    
    [self.contentView addSubview:self.navLabel];
    [self.navLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(@(24*kScale));
        make.left.equalTo(self.contentView.mas_left).offset(40*kScale);
        make.right.equalTo(self.contentView.mas_right).offset(-8*kScale);
        make.top.equalTo(self.contentView.mas_top).offset(8*kScale);
        make.bottom.equalTo(self.contentView.mas_bottom).offset(-8*kScale);
    }];

}

- (void) refreshUI: (RssInfoModel *) model {
    self.navLabel.text = model.title;
    
    [self.contentView pp_setBadgeLabelAttributes:^(PPBadgeLabel *badgeLabel) {
        badgeLabel.backgroundColor = RGBACOLOR(163,166,175,1.0);
        badgeLabel.font =  [UIFont systemFontOfSize:13*kScale];
        badgeLabel.textColor = [UIColor whiteColor];
        badgeLabel.text = @"10";
    }];
    [self.contentView pp_moveBadgeWithX:0 Y:self.contentView.frame.size.height/2];
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
        _navLabel.font = GLOBAL_LIGHT_FONT_SIZE(17);
    }
    return _navLabel;
}

@end
