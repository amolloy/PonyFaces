//
//  FavoritePonyFacesManager.m
//  PonyFaces
//
//  Created by Andrew Molloy on 12/21/15.
//  Copyright © 2015 Andy Molloy. All rights reserved.
//

#import "FavoritePonyFacesManager.h"
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
