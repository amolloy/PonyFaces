// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to FavoritePonyFaceCategory.m instead.

#import "_FavoritePonyFaceCategory.h"

const struct FavoritePonyFaceCategoryAttributes FavoritePonyFaceCategoryAttributes = {
	.categoryID = @"categoryID",
	.name = @"name",
};

const struct FavoritePonyFaceCategoryRelationships FavoritePonyFaceCategoryRelationships = {
	.ponyFaces = @"ponyFaces",
};

@implementation FavoritePonyFaceCategoryID
@end

@implementation _FavoritePonyFaceCategory

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"FavoritePonyFaceCategory" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"FavoritePonyFaceCategory";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"FavoritePonyFaceCategory" inManagedObjectContext:moc_];
}

- (FavoritePonyFaceCategoryID*)objectID {
	return (FavoritePonyFaceCategoryID*)[super objectID];
}

+ (NSSet*)keyPathsForValuesAffectingValueForKey:(NSString*)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];

	if ([key isEqualToString:@"categoryIDValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"categoryID"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}

	return keyPaths;
}

@dynamic categoryID;

- (int64_t)categoryIDValue {
	NSNumber *result = [self categoryID];
	return [result longLongValue];
}

- (void)setCategoryIDValue:(int64_t)value_ {
	[self setCategoryID:@(value_)];
}

- (int64_t)primitiveCategoryIDValue {
	NSNumber *result = [self primitiveCategoryID];
	return [result longLongValue];
}

- (void)setPrimitiveCategoryIDValue:(int64_t)value_ {
	[self setPrimitiveCategoryID:@(value_)];
}

@dynamic name;

@dynamic ponyFaces;

- (NSMutableSet*)ponyFacesSet {
	[self willAccessValueForKey:@"ponyFaces"];

	NSMutableSet *result = (NSMutableSet*)[self mutableSetValueForKey:@"ponyFaces"];

	[self didAccessValueForKey:@"ponyFaces"];
	return result;
}

@end

