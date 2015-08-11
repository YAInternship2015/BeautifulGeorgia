//
//  NDNamedImage.h
//  TestYalantis1
//
//  Created by Nadiia Dovbysh on 8/1/15.
//  Copyright (c) 2015 Hope. All rights reserved.
//

#import <Foundation/Foundation.h>

@class UIImage;

@interface NDNamedImage : NSObject

#warning Здесь в *.h файле Вы показали readwrite свойства, то есть извне любой класс сможет изменить модель, что не есть хорошо. В *.h файле стоит показывать эти свойства с доступом readonly, чтобы их нельзя было менять извне
@property (strong, nonatomic) NSString *name;
@property (strong, nonatomic) UIImage *image;

#warning есть проблемы с форматированием кода, неправильно расставлены отступы, почитайте еще раз гайдлайны
+ (id) imageWithName: (UIImage*)image withName:(NSString *)name;

@end