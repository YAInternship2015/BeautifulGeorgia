//
//  NDCollectionViewController.m
//  BeautifulGeorgia
//
//  Created by Nadiia Dovbysh on 8/23/15.
//  Copyright (c) 2015 Hope. All rights reserved.
//

//controllers
#import "NDCollectionViewController.h"

//models
#import "NDNamedImageModel.h"

//sources
#import "NDDataSource.h"

//views
#import "NDCollectionViewCell.h"

@interface NDCollectionViewController ()

@property (strong, nonatomic) NSArray *images;
@property (weak, nonatomic) IBOutlet UICollectionViewFlowLayout *collectionViewFlowLayout;
@end

@implementation NDCollectionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.images = [NDDataSource getNamedImages];
}


#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {

}

#pragma mark <UICollectionViewDataSource>

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return [self.images count];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    NDCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"imageCell" forIndexPath:indexPath];
    NDNamedImageModel *model = [self.images objectAtIndex:indexPath.row];
    [cell fill:model];
    return cell;
}

#pragma mark - UICollectionViewDelegateFlowLayout

- (CGSize)collectionView:(UICollectionView*)collectionView
                  layout:(UICollectionViewLayout *)collectionViewLayout
  sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    CGFloat sectionInset = self.collectionViewFlowLayout.sectionInset.right + self.collectionViewFlowLayout.sectionInset.left;
    CGFloat minSpacingInset = self.collectionViewFlowLayout.minimumLineSpacing;
    
    NSInteger itemsInRowFactor = 0;

    UIInterfaceOrientation orientation = [[UIApplication sharedApplication] statusBarOrientation];
    if ((orientation == UIInterfaceOrientationPortrait ||
        orientation == UIInterfaceOrientationPortraitUpsideDown) &&
        [[UIDevice currentDevice]userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        itemsInRowFactor = 1;
    } else if ((orientation == UIInterfaceOrientationLandscapeLeft ||
               orientation == UIInterfaceOrientationLandscapeRight) &&
               [[UIDevice currentDevice]userInterfaceIdiom] == UIUserInterfaceIdiomPad) {
        itemsInRowFactor = 3;
    } else {
        itemsInRowFactor = 2;
    }
    
    CGFloat side = [self calculateSide:collectionView sectionInset:sectionInset minSpacingInset:minSpacingInset itemsInRowFactor:itemsInRowFactor];

    return CGSizeMake(side/(2 * itemsInRowFactor), side/(3 * itemsInRowFactor));;
}

- (CGFloat)calculateSide:(UICollectionView *)collectionView
            sectionInset:(CGFloat)sectionInset
         minSpacingInset:(CGFloat)minSpacingInset
        itemsInRowFactor:(NSInteger)itemsInRowFactor {
    return (collectionView.bounds.size.width - sectionInset - 2 * minSpacingInset * itemsInRowFactor);
}


#pragma mark - TransitionCoordinator

- (void)viewWillTransitionToSize:(CGSize)size withTransitionCoordinator:(id<UIViewControllerTransitionCoordinator>)coordinator
{
    [coordinator animateAlongsideTransition:^(id<UIViewControllerTransitionCoordinatorContext> context)
     {
         [self.collectionView performBatchUpdates:nil completion:nil];
     } completion:nil];
}

#pragma mark <UICollectionViewDelegate>

/*
// Uncomment this method to specify if the specified item should be highlighted during tracking
- (BOOL)collectionView:(UICollectionView *)collectionView shouldHighlightItemAtIndexPath:(NSIndexPath *)indexPath {
	return YES;
}
*/

/*
// Uncomment this method to specify if the specified item should be selected
- (BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}
*/

/*
// Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
- (BOOL)collectionView:(UICollectionView *)collectionView shouldShowMenuForItemAtIndexPath:(NSIndexPath *)indexPath {
	return NO;
}

- (BOOL)collectionView:(UICollectionView *)collectionView canPerformAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	return NO;
}

- (void)collectionView:(UICollectionView *)collectionView performAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	
}
*/

@end
