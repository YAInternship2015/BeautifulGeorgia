//
//  NDTableViewController.m
//  TestYalantis1
//
//  Created by Nadiia Dovbysh on 8/1/15.
//  Copyright (c) 2015 Hope. All rights reserved.
//

#import "NDTableViewController.h"
#import "NDNamedImage.h"
#import "NDHeaderView.h"

#define kImageViewTag   100
#define kLabelTag       101
#define ROWS_NUM       10

@interface NDTableViewController ()

@property (strong, nonatomic) NSArray *images;

@end

@implementation NDTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self loadHeaderNib];

#warning Как я уже писал в замечаниях к заданию, Вы должны реализовать отдельный класс-датасорс, который будет хранить все модели NDNamedImage. Этим не должен заниматься вью контроллер, это не его ответственность. Этот класс-датасорс внутри себя хранит массив объектов NDNamedImage, но в *.h он его не показывает. В его *.h файле есть только необходимый вью контроллеру интерфейс, которого достаточно для отображения данных в таблице

    self.images = [NSArray arrayWithObjects:
                   [NDNamedImage imageWithName:[UIImage imageNamed:@"1"] withName:@"Borjomi"],
                   [NDNamedImage imageWithName:[UIImage imageNamed:@"2"] withName:@"Mountain roads"],
                   [NDNamedImage imageWithName:[UIImage imageNamed:@"3"] withName:@"Wild nature"],
                   [NDNamedImage imageWithName:[UIImage imageNamed:@"4"] withName:@"Mountain village"],
                   [NDNamedImage imageWithName:[UIImage imageNamed:@"5"] withName:@"Wild wood"],
                   [NDNamedImage imageWithName:[UIImage imageNamed:@"6"] withName:@"Mountains"],
                   [NDNamedImage imageWithName:[UIImage imageNamed:@"7"] withName:@"Mtirala national park"],
                   [NDNamedImage imageWithName:[UIImage imageNamed:@"8"] withName:@"Mountain sky"],
                   [NDNamedImage imageWithName:[UIImage imageNamed:@"9"] withName:@"Sunshine"],
                   [NDNamedImage imageWithName:[UIImage imageNamed:@"10"] withName:@"Waterfall"], nil];
}

- (void) loadHeaderNib {
    NSString *headerName = NSStringFromClass([NDHeaderView class]);
    UINib* headerNib = [UINib nibWithNibName:headerName bundle:nil];
    [self.tableView registerNib:headerNib forHeaderFooterViewReuseIdentifier:headerName];
}

#warning пустой метод - удаляем
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}

#pragma mark - UITableViewDataSource

#warning зачем здесь подставлять константу, если в Вашей реализации можно спросить у массива, сколько у него элементов? А в реализации с датасорсом эту информацию можно будет получить у него
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return ROWS_NUM;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    NDNamedImage *namedImage = [self.images objectAtIndex:indexPath.row];
    
#warning Следовало сделать отдельный класс-ячейку, наследника UITableViewCell, которая в себе бы инкапсулировала заполнение моделью NDNamedImage. Тогда вся логика тэгов (которая является дурным тоном) не будет нужна
    UIImageView *imageView = (UIImageView *)[cell viewWithTag:kImageViewTag];
    imageView.image = namedImage.image;
    
    UILabel *label = (UILabel *)[cell viewWithTag:kLabelTag];
    label.text = namedImage.name;
    
    return cell;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    NDHeaderView *headerView = [tableView dequeueReusableHeaderFooterViewWithIdentifier: NSStringFromClass([NDHeaderView class])];
    return headerView;
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [self.tableView deselectRowAtIndexPath:indexPath animated:NO];
}

#pragma mark - TransitionCoordinator

- (void)viewWillTransitionToSize:(CGSize)size withTransitionCoordinator:(id<UIViewControllerTransitionCoordinator>)coordinator
{
    [coordinator animateAlongsideTransition:^(id<UIViewControllerTransitionCoordinatorContext> context)
     {
         [[UIApplication sharedApplication] setStatusBarHidden:NO withAnimation:UIStatusBarAnimationNone];
     } completion:^(id<UIViewControllerTransitionCoordinatorContext> context)
     {
     }];
}

@end
