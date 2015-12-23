//
//  PonyFaceFavoritesDataSource.m
//  PonyFaces
//
//  Created by Andrew Molloy on 12/22/15.
//  Copyright © 2015 Andy Molloy. All rights reserved.
//

#import "PonyFaceFavoritesDataSource.h"
#import "FavoritePonyFace.h"
#import <MagicalRecord/MagicalRecord.h>

@interface PonyFaceFavoritesDataSource () <NSFetchedResultsControllerDelegate>
@property (nonatomic, strong) NSFetchedResultsController* fetchedResultsController;
@property (nonatomic, strong) UITableView* tableView;
@end

@implementation PonyFaceFavoritesDataSource

- (instancetype)initWithTableView:(UITableView*)tableView
{
	self = [super init];
	if (self)
	{
		self.fetchedResultsController = [FavoritePonyFace MR_fetchAllGroupedBy:@"category.name"
																 withPredicate:nil
																	  sortedBy:@"category.name,ponyID"
																	 ascending:YES];
		self.fetchedResultsController.delegate = self;

		self.tableView = tableView;
	}
	return self;
}

- (NSInteger)numberOfCategories
{
	return (NSInteger)self.fetchedResultsController.sections.count;
}

- (NSInteger)numberOfPonyFacesInCategoryAtIndex:(NSInteger)index
{
	id<NSFetchedResultsSectionInfo> section = self.fetchedResultsController.sections[(NSUInteger)index];
	return (NSInteger)section.numberOfObjects;
}

- (NSString*)titleForCategoryAtIndex:(NSInteger)index
{
	id<NSFetchedResultsSectionInfo> section = self.fetchedResultsController.sections[(NSUInteger)index];
	return section.name;
}

- (id<PonyFaceModel>)ponyFaceForCategoryIndex:(NSInteger)index row:(NSInteger)row
{
	return [self.fetchedResultsController objectAtIndexPath:[NSIndexPath indexPathForRow:row inSection:index]];
}

- (NSString*)navigationItemTitle
{
	return NSLocalizedString(@"Favorites", @"Title for the favorites list");
}

#pragma mark Fetched Results Controller Delegate

- (void)controllerWillChangeContent:(NSFetchedResultsController*)controller
{
	[self.tableView beginUpdates];
}

- (void)controller:(NSFetchedResultsController*)controller
  didChangeSection:(id<NSFetchedResultsSectionInfo>)sectionInfo
		   atIndex:(NSUInteger)sectionIndex
	 forChangeType:(NSFetchedResultsChangeType)type
{
	switch(type)
	{
		case NSFetchedResultsChangeInsert:
			[self.tableView insertSections:[NSIndexSet indexSetWithIndex:sectionIndex]
						  withRowAnimation:UITableViewRowAnimationFade];
			break;

		case NSFetchedResultsChangeDelete:
			[self.tableView deleteSections:[NSIndexSet indexSetWithIndex:sectionIndex]
						  withRowAnimation:UITableViewRowAnimationFade];
			break;
		default:
			break;
	}
}

- (void)controller:(NSFetchedResultsController*)controller
   didChangeObject:(id)anObject
	   atIndexPath:(NSIndexPath*)indexPath
	 forChangeType:(NSFetchedResultsChangeType)type
	  newIndexPath:(NSIndexPath*)newIndexPath
{
	UITableView* tableView = self.tableView;

	switch(type)
	{
		case NSFetchedResultsChangeInsert:
			[tableView insertRowsAtIndexPaths:[NSArray arrayWithObject:newIndexPath]
							 withRowAnimation:UITableViewRowAnimationFade];
			break;

		case NSFetchedResultsChangeDelete:
			[tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath]
							 withRowAnimation:UITableViewRowAnimationFade];
			break;

		case NSFetchedResultsChangeUpdate:
			// Do nothing
			break;

		case NSFetchedResultsChangeMove:
			[tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath]
							 withRowAnimation:UITableViewRowAnimationFade];
			[tableView insertRowsAtIndexPaths:[NSArray arrayWithObject:newIndexPath]
							 withRowAnimation:UITableViewRowAnimationFade];
			break;
	}
}

- (void)controllerDidChangeContent:(NSFetchedResultsController*)controller
{
	[self.tableView endUpdates];
}

@end
