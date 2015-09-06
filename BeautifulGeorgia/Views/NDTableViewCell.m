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

- (void)fillWithNamedImage:(NDNamedImageModel *)model {
    self.imgView.image = model.image;
    self.titleLabel.text = model.name;
}

@end
