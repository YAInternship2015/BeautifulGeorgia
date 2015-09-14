//
//  NDCollectionViewCell.m
//  BeautifulGeorgia
//
//  Created by Nadiia Dovbysh on 8/23/15.
//  Copyright (c) 2015 Hope. All rights reserved.
//

#import "NDCollectionViewCell.h"
#import "NDNamedImage.h"

@interface NDCollectionViewCell ()

@property (nonatomic, weak) IBOutlet UIImageView *imgView;

@end

@implementation NDCollectionViewCell

- (void)fillWithNamedImage:(NDNamedImage *)model {
    self.imgView.image = [UIImage imageWithData:model.image];
}

@end
