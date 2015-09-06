//
//  NDTableViewController.m
//  TestYalantis1
//
//  Created by Nadiia Dovbysh on 8/1/15.
//  Copyright (c) 2015 Hope. All rights reserved.
//

#import "NDTableViewController.h"
#import "NDNamedImageModel.h"
#import "NDTableViewCell.h"
#import "NDDataSource.h"
#import "UIViewController+NDErrorDisplaying.h"

@interface NDTableViewController () <NDDataSourceDelegate>

@property (nonatomic, strong) NDDataSource *dataSource;

@end

@implementation NDTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.dataSource = [[NDDataSource alloc] initWithDelegate:self];
}

#pragma mark - NDDataSourceDelegate

- (void)dataWasChanged {
    [self.tableView reloadData];
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.dataSource numberOfObjects];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NDTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"imageCell" forIndexPath:indexPath];
    NDNamedImageModel *model = [self.dataSource objectAtIndex:indexPath.row];
    [cell fillWithNamedImage:model];
    return cell;
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
