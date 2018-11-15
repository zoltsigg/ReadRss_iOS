//
//  ArticleTableCell.m
//  ReadRss
//
//  Created by cheng on 2018/11/12.
//  Copyright © 2018 cheng. All rights reserved.
//

#import "ArticleTableCell.h"
#import <Masonry/Masonry.h>

@implementation ArticleTableCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(instancetype) initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if(self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self createUI];
    }
    return self;
}


- (void) createUI {
    [self.contentView addSubview:self.titleLabel];
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.contentView.mas_top).offset(16*kScale);
        make.left.equalTo(self.contentView.mas_left).offset(16*kScale);
        make.right.equalTo(self.contentView.mas_right).offset(-16*kScale);
    }];
    
    [self.contentView addSubview:self.timeLabel];
    [self.timeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(@(18*kScale));
        make.top.equalTo(self.titleLabel.mas_bottom).offset(8*kScale);
        make.left.equalTo(self.contentView.mas_left).offset(16*kScale);
        make.right.equalTo(self.contentView.mas_right).offset(-16*kScale);
        make.bottom.equalTo(self.contentView.mas_bottom).offset(-16*kScale);
    }];
}


- (UILabel *)titleLabel {
    if(!_titleLabel) {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.textColor = RGBACOLOR(51, 51, 51, 1.0);
        _titleLabel.numberOfLines = 0;
        _titleLabel.font = [UIFont boldSystemFontOfSize:18*kScale];
    }
    return _titleLabel;
}

- (UILabel *) timeLabel {
    if(!_timeLabel) {
        _timeLabel = [[UILabel alloc] init];
        _timeLabel.textColor = RGBACOLOR(163,166,175,1.0);
        _timeLabel.font = [UIFont systemFontOfSize:12*kScale];
    }
    return _timeLabel;
}


- (void) refreshUI: (ArticleModel *) model {
    self.titleLabel.text = model.title;
}
@end
