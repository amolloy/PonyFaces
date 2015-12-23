//
//  PonyFaceSearchResultsDataSource.m
//  PonyFaces
//
//  Created by Andrew Molloy on 12/21/15.
//  Copyright © 2015 Andy Molloy. All rights reserved.
//

#import "PonyFaceSearchResultsDataSource.h"
#import "PonyFaceModel.h"
#import "PonyFace.h"
#import "PonyFaceCategory.h"

@interface PonyFaceSearchResultsDataSource ()
@property (copy, nonatomic) NSArray<PonyFaceCategory*>* searchResults;
@end

@implementation PonyFaceSearchResultsDataSource

- (id)initWithSearchResults:(NSArray<PonyFaceCategory*>*)searchResults
{
	self = [super init];
	if (self)
	{
		self.searchResults = [searchResults sortedArrayUsingComparator:^NSComparisonResult(PonyFaceCategory* c1, PonyFaceCategory* c2) {
			return [c1.name caseInsensitiveCompare:c2.name];
		}];
	}
	return self;
}

- (NSInteger)numberOfCategories
{
	return (NSInteger)self.searchResults.count;
}

- (NSInteger)numberOfPonyFacesInCategoryAtIndex:(NSInteger)index
{
	return (NSInteger)self.searchResults[(NSUInteger)index].faces.count;
}

- (NSString*)titleForCategoryAtIndex:(NSInteger)index
{
	return self.searchResults[(NSUInteger)index].name;
}

- (id<PonyFaceModel>)ponyFaceForCategoryIndex:(NSInteger)index row:(NSInteger)row
{
	NSArray<PonyFace*>* ponyFaces = [self.searchResults[(NSUInteger)index].faces sortedArrayUsingComparator:^NSComparisonResult(PonyFace* p1, PonyFace* p2) {
		return [p1.ponyID compare:p2.ponyID];
	}];

	return ponyFaces[(NSUInteger)row];
}

- (NSString*)navigationItemTitle
{
	return NSLocalizedString(@"Search Results", @"Title for the search results screen.");
}

@end
