//
//  NDDataSource.h
//  BeautifulGeorgia
//
//  Created by Nadiia Dovbysh on 8/21/15.
//  Copyright (c) 2015 Hope. All rights reserved.
//

#import <Foundation/Foundation.h>

@class NDNamedImageModel;

#warning имена нотификаций лучше вынести в отдельный файл, вроде NDNotifications.h. И также можно объявить константу одной строкой без необходимость иметь *.h и *.m файлы:
// static NSString *const NDDataSourceFileContentDidChangeNotification = @"NDDataSourceFileContentDidChangeNotification";
extern NSString *const NDDataSourceFileContentDidChangeNotification;

@protocol NDDataSourceDelegate <NSObject>
#warning тут не хватает пустой строки. И после метода тоже
- (void)dataWasChanged;
@end

@interface NDDataSource : NSObject

- (instancetype)initWithDelegate:(id)delegate;

#warning показывая в *.h файле массив, Вы раскрываете внутренний способ хранения данных в датасорсе. Вью контроллеру для отображенияданных в принципе не нужен массив, ему достаточно знать, сколько элементов есть всего, и какой элемент назодится под каким индексом. Это и есть тот интерфейс, который должен предоставлться датасорсом. Так что вместо геттера массива нужноо реализовать два метода вроде numberOfObjects и objectAtIndex:
- (NSArray *)namedImages;
#warning в названии метода не стоит писать "ToPlist", датасорс может сохранять данные куда угодно, и вью контроллеру необязательно знать, куда именно
- (void)saveNamedImageToPlist:(NDNamedImageModel *)model error:(NSError **)error;

@end
