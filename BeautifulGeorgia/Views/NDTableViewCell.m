//
//  NDTableViewCell.m
//  BeautifulGeorgia
//
//  Created by Nadiia Dovbysh on 8/21/15.
//  Copyright (c) 2015 Hope. All rights reserved.
//

#import "NDTableViewCell.h"
#import "NDNamedImageModel.h"

@implementation NDTableViewCell

- (void)awakeFromNib {
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

- (void)fill:(NDNamedImageModel *)model {
    self.imgView.image = model.image;
    self.titleLabel.text = model.name;
}

@end
