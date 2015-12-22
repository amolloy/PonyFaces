// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to FavoritePonyFace.m instead.

#import "_FavoritePonyFace.h"

const struct FavoritePonyFaceAttributes FavoritePonyFaceAttributes = {
	.imageURLStr = @"imageURLStr",
	.linkStr = @"linkStr",
	.ponyID = @"ponyID",
	.thumbnailURLStr = @"thumbnailURLStr",
};

const struct FavoritePonyFaceRelationships FavoritePonyFaceRelationships = {
	.category = @"category",
	.tagObjects = @"tagObjects",
};

@implementation FavoritePonyFaceID
@end

@implementation _FavoritePonyFace

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"FavoritePonyFace" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"FavoritePonyFace";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"FavoritePonyFace" inManagedObjectContext:moc_];
}

- (FavoritePonyFaceID*)objectID {
	return (FavoritePonyFaceID*)[super objectID];
}

+ (NSSet*)keyPathsForValuesAffectingValueForKey:(NSString*)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];

	if ([key isEqualToString:@"ponyIDValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"ponyID"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}

	return keyPaths;
}

@dynamic imageURLStr;

@dynamic linkStr;

@dynamic ponyID;

- (int64_t)ponyIDValue {
	NSNumber *result = [self ponyID];
	return [result longLongValue];
}

- (void)setPonyIDValue:(int64_t)value_ {
	[self setPonyID:@(value_)];
}

- (int64_t)primitivePonyIDValue {
	NSNumber *result = [self primitivePonyID];
	return [result longLongValue];
}

- (void)setPrimitivePonyIDValue:(int64_t)value_ {
	[self setPrimitivePonyID:@(value_)];
}

@dynamic thumbnailURLStr;

@dynamic category;

@dynamic tagObjects;

- (NSMutableSet*)tagObjectsSet {
	[self willAccessValueForKey:@"tagObjects"];

	NSMutableSet *result = (NSMutableSet*)[self mutableSetValueForKey:@"tagObjects"];

	[self didAccessValueForKey:@"tagObjects"];
	return result;
}

@end

