//
//  PonyFacesTableViewController.m
//  PonyFaces
//
//  Created by Andrew Molloy on 12/21/15.
//  Copyright © 2015 Andy Molloy. All rights reserved.
//

#import "PonyFacesTableViewController.h"
#import "PonyFaceTableViewCell.h"
#import "PonyFace.h"
#import "PonyFaceModel.h"
#import <FXReachability/FXReachability.h>
#import <PINRemoteImage/PINRemoteImageManager.h>

@interface PonyFacesTableViewController ()
@end

@implementation PonyFacesTableViewController

- (void)viewWillAppear:(BOOL)animated
{
	[super viewWillAppear:animated];

	if ([FXReachability sharedInstance].status == FXReachabilityStatusReachableViaWiFi)
	{
		NSMutableArray<NSURL*>* prefetchURLS = [NSMutableArray array];

		NSInteger numCategories = [self.ponyFacesDataSource numberOfCategories];
		for (NSInteger categoryIndex = 0; categoryIndex < numCategories; ++categoryIndex)
		{
			NSInteger numRows = [self.ponyFacesDataSource numberOfPonyFacesInCategoryAtIndex:categoryIndex];

			for (NSInteger rowIndex = 0; rowIndex < numRows; ++rowIndex)
			{
				id<PonyFaceModel> ponyFace = [self.ponyFacesDataSource ponyFaceForCategoryIndex:categoryIndex
																							row:rowIndex];
				[prefetchURLS addObject:ponyFace.thumbnailURL];
			}
		}

		[[PINRemoteImageManager sharedImageManager] prefetchImagesWithURLs:prefetchURLS];
	}
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
	return [self.ponyFacesDataSource numberOfCategories];
}

- (NSInteger)tableView:(UITableView*)tableView numberOfRowsInSection:(NSInteger)section
{
	return [self.ponyFacesDataSource numberOfPonyFacesInCategoryAtIndex:section];
}

- (NSString*)tableView:(UITableView*)tableView titleForHeaderInSection:(NSInteger)section
{
	return [self.ponyFacesDataSource titleForCategoryAtIndex:section];
}

- (UITableViewCell*)tableView:(UITableView*)tableView cellForRowAtIndexPath:(NSIndexPath*)indexPath
{
	PonyFaceTableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:@"PonyFaceTableViewCell"
																  forIndexPath:indexPath];
	cell.ponyFace = [self.ponyFacesDataSource ponyFaceForCategoryIndex:indexPath.section
																   row:indexPath.row];
	return cell;
}

- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath
{
	return 155;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
	if ([segue.destinationViewController respondsToSelector:@selector(setPonyFace:)])
	{
		PonyFaceTableViewCell* cell = [self.tableView cellForRowAtIndexPath:self.tableView.indexPathForSelectedRow];
		[segue.destinationViewController setPonyFace:cell.ponyFace];
	}
}

#pragma mark - PonyFaceFavoritesDataSourceDelegate

- (void)ponyFaceAtIndexPath:(NSIndexPath *)indexPath wasUpdatedTo:(id<PonyFaceModel>)ponyFace
{
	PonyFaceTableViewCell* cell = [self.tableView cellForRowAtIndexPath:indexPath];
	cell.ponyFace = ponyFace;
}

@end

