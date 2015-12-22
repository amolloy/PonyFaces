//
//  FavoritePonyFacesManager.m
//  PonyFaces
//
//  Created by Andrew Molloy on 12/21/15.
//  Copyright © 2015 Andy Molloy. All rights reserved.
//

#import "FavoritePonyFacesManager.h"
#import "PonyFace.h"
#import "PonyFaceCategory.h"
#import "FavoritePonyFace.h"
#import "FavoritePonyFaceCategory.h"
#import "FavoritePonyFaceTag.h"
#import <MagicalRecord/MagicalRecord.h>

@implementation FavoritePonyFacesManager

- (void)setupCoreDataStack
{
	[MagicalRecord setupCoreDataStackWithAutoMigratingSqliteStoreNamed:@"PonyFacesFavorites"];
}

- (void)cleanUp
{
	[MagicalRecord cleanUp];
}

- (void)addFavoritePonyFace:(id<PonyFaceModel>)ponyFace
	   managedObjectContext:(NSManagedObjectContext*)moc
{
	FavoritePonyFace* favoritePonyFace = [FavoritePonyFace MR_createEntityInContext:moc];
	favoritePonyFace.ponyID = ponyFace.ponyID;
	favoritePonyFace.category = [self findOrCreateCategoryForPonyFace:ponyFace
															inContext:moc];
	favoritePonyFace.thumbnailURLStr = [ponyFace.thumbnailURL absoluteString];
	favoritePonyFace.imageURLStr = [ponyFace.imageURL absoluteString];
	favoritePonyFace.linkStr = [ponyFace.link absoluteString];

	for (NSString* tag in ponyFace.tags)
	{
		FavoritePonyFaceTag* favoriteTag = [FavoritePonyFaceTag MR_findFirstOrCreateByAttribute:@"name"
																					  withValue:tag
																					  inContext:moc];
		[favoritePonyFace addTagObjectsObject:favoriteTag];
	}
}

- (FavoritePonyFaceCategory*)findOrCreateCategoryForPonyFace:(PonyFace*)ponyFace
												   inContext:(NSManagedObjectContext*)moc
{
	PonyFaceCategory* ponyFaceCategory = ponyFace.category;
	FavoritePonyFaceCategory* category = [FavoritePonyFaceCategory MR_findFirstByAttribute:@"categoryID"
																				 withValue:@(ponyFaceCategory.categoryID)
																				 inContext:moc];
	if (!category)
	{
		category = [FavoritePonyFaceCategory MR_createEntityInContext:moc];
		category.categoryID = @(ponyFaceCategory.categoryID);
		category.name = ponyFaceCategory.name;
	}

	return category;
}

- (BOOL)isPonyFaceAFavorite:(id<PonyFaceModel>)ponyFace managedObjectContext:(NSManagedObjectContext*)moc
{
	return [FavoritePonyFace MR_countOfEntitiesWithPredicate:[NSPredicate predicateWithFormat:@"ponyID=%@", ponyFace.ponyID]
												   inContext:moc] != 0;
}

- (void)deleteFavoritePonyFace:(id<PonyFaceModel>)ponyFace managedObjectContext:(NSManagedObjectContext*)moc
{
	[FavoritePonyFace MR_deleteAllMatchingPredicate:[NSPredicate predicateWithFormat:@"ponyID=%@", ponyFace.ponyID]
										  inContext:moc];
}

#pragma mark - Singleton

static FavoritePonyFacesManager* SINGLETON = nil;

static bool isFirstAccess = YES;

#pragma mark - Public Method

+ (id)sharedManager
{
	static dispatch_once_t onceToken;
	dispatch_once(&onceToken, ^{
		isFirstAccess = NO;
		SINGLETON = [[super allocWithZone:NULL] init];
	});

	return SINGLETON;
}

+ (id) allocWithZone:(NSZone*)zone
{
	return [self sharedManager];
}

+ (id)copyWithZone:(struct _NSZone*)zone
{
	return [self sharedManager];
}

+ (id)mutableCopyWithZone:(struct _NSZone*)zone
{
	return [self sharedManager];
}

- (id)copy
{
	return [[FavoritePonyFacesManager alloc] init];
}

- (id)mutableCopy
{
	return [[FavoritePonyFacesManager alloc] init];
}

- (id)init
{
	if(SINGLETON)
	{
		return SINGLETON;
	}
	if (isFirstAccess)
	{
		[self doesNotRecognizeSelector:_cmd];
	}
	self = [super init];
	if (self)
	{
	}
	return self;
}

@end
