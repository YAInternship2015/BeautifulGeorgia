//
//  NDNamedImageModel+NDModelRepresentation.h
//  BeautifulGeorgia
//
//  Created by Nadiia Dovbysh on 9/8/15.
//  Copyright (c) 2015 Hope. All rights reserved.
//

#import "NDNamedImageModel.h"

@interface NDNamedImageModel (NDModelRepresentation)

+ (NSDictionary *)dictionaryRepresentation:(NDNamedImageModel *)model;

@end
