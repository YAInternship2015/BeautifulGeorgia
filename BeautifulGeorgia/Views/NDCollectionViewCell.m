//
//  NDCollectionViewCell.m
//  BeautifulGeorgia
//
//  Created by Nadiia Dovbysh on 8/23/15.
//  Copyright (c) 2015 Hope. All rights reserved.
//

#import "NDCollectionViewCell.h"
#import "NDNamedImageModel.h"

@interface NDCollectionViewCell ()

@property (weak, nonatomic) IBOutlet UIImageView *imgView;

@end

@implementation NDCollectionViewCell

- (void)fill:(NDNamedImageModel *)model {
    self.imgView.image = model.image;
}

@end
