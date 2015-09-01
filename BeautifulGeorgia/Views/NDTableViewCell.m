//
//  NDTableViewCell.m
//  BeautifulGeorgia
//
//  Created by Nadiia Dovbysh on 8/21/15.
//  Copyright (c) 2015 Hope. All rights reserved.
//

#import "NDTableViewCell.h"
#import "NDNamedImageModel.h"

@interface NDTableViewCell ()

@property (nonatomic, weak) IBOutlet UIImageView *imgView;
@property (nonatomic, weak) IBOutlet UILabel *titleLabel;

@end

@implementation NDTableViewCell

#warning этот и следующий методы можно удалить, Вы в них ничего не изменили по сравнению с реализацией по умолчанию
- (void)awakeFromNib {
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

- (void)fillWithNamedImage:(NDNamedImageModel *)model {
    self.imgView.image = model.image;
    self.titleLabel.text = model.name;
}

@end
