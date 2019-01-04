//
//  RssInfoTableCell.m
//  ReadRss
//
//  Created by cheng on 2018/11/2.
//  Copyright © 2018 cheng. All rights reserved.
//

#import "RssInfoTableCell.h"
#import <Masonry/Masonry.h>
#import <PPBadgeView.h>

#define BadgeRadius 25*kScale

@implementation RssInfoTableCell

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

    
    [self.contentView addSubview:self.titleLabel];
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(@(20*kScale));
        make.top.equalTo(self.contentView.mas_top).offset(16*kScale);
        make.left.equalTo(self.contentView.mas_left).offset(16*kScale);
        make.right.equalTo(self.contentView.mas_right).offset(-48*kScale);
    }];
    
    [self.contentView addSubview:self.descLabel];
    [self.descLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(@(18*kScale));
        make.top.equalTo(self.titleLabel.mas_bottom).offset(8*kScale);
        make.left.equalTo(self.contentView.mas_left).offset(16*kScale);
        make.right.equalTo(self.contentView.mas_right).offset(-48*kScale);
        make.bottom.equalTo(self.contentView.mas_bottom).offset(-16*kScale);
    }];
}

- (void) refreshUI: (RssInfoModel *) model {
    self.titleLabel.text = model.title;
    self.descLabel.text = model.desc;
    [self.contentView pp_setBadgeLabelAttributes:^(PPBadgeLabel *badgeLabel) {
        badgeLabel.backgroundColor = RGBACOLOR(163,166,175,1.0);
        badgeLabel.font =  [UIFont systemFontOfSize:13*kScale];
        badgeLabel.textColor = [UIColor whiteColor];
        badgeLabel.text = @"10";
    }];
    [self.contentView pp_moveBadgeWithX:20 Y:self.contentView.frame.size.height/2 + 15];
}


- (UILabel *) titleLabel {
    if(!_titleLabel) {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.textColor = RGBACOLOR(51, 51, 51, 1.0);
        _titleLabel.font = [UIFont boldSystemFontOfSize:16*kScale];
    }
    return _titleLabel;
}

- (UILabel *) descLabel {
    if(!_descLabel) {
        _descLabel = [[UILabel alloc] init];
        _descLabel.textColor = RGBACOLOR(163,166,175,1.0);
        _descLabel.numberOfLines = 0;
        _descLabel.font = [UIFont boldSystemFontOfSize:14*kScale];
    }
    return _descLabel;
}

//- (UIView *)badgeView {
//    if(!_badgeView) {
//        _badgeView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, BadgeRadius, BadgeRadius)];
//        _badgeView.backgroundColor = RGBACOLOR(197, 202, 214, 1.0);
//        _badgeView.layer.cornerRadius = BadgeRadius/2;
//    }
//    return _badgeView;
//}
//
//-(UILabel *)badgeLabel {
//    if(!_badgeLabel) {
//        _badgeLabel = [[UILabel alloc] init];
//        _badgeLabel.adjustsFontSizeToFitWidth = YES;
//        _badgeLabel.textAlignment = NSTextAlignmentCenter;
//        _badgeLabel.font = [UIFont systemFontOfSize:11*kScale];
//        _badgeLabel.textColor = RGBACOLOR(50, 50, 50, 1.0);
//    }
//    return _badgeLabel;
//}
@end
