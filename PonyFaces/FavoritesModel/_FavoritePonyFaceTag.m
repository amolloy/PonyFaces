// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to FavoritePonyFaceTag.m instead.

#import "_FavoritePonyFaceTag.h"

const struct FavoritePonyFaceTagAttributes FavoritePonyFaceTagAttributes = {
	.name = @"name",
};

const struct FavoritePonyFaceTagRelationships FavoritePonyFaceTagRelationships = {
	.ponyFaces = @"ponyFaces",
};

@implementation FavoritePonyFaceTagID
@end

@implementation _FavoritePonyFaceTag

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"FavoritePonyFaceTag" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"FavoritePonyFaceTag";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"FavoritePonyFaceTag" inManagedObjectContext:moc_];
}

- (FavoritePonyFaceTagID*)objectID {
	return (FavoritePonyFaceTagID*)[super objectID];
}

+ (NSSet*)keyPathsForValuesAffectingValueForKey:(NSString*)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];

	return keyPaths;
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

