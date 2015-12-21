// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to FavoritePonyFaceTag.h instead.

@import CoreData;

extern const struct FavoritePonyFaceTagAttributes {
	__unsafe_unretained NSString *name;
} FavoritePonyFaceTagAttributes;

extern const struct FavoritePonyFaceTagRelationships {
	__unsafe_unretained NSString *ponyFaces;
} FavoritePonyFaceTagRelationships;

@class FavoritePonyFace;

@interface FavoritePonyFaceTagID : NSManagedObjectID {}
@end

@interface _FavoritePonyFaceTag : NSManagedObject {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
@property (nonatomic, readonly, strong) FavoritePonyFaceTagID* objectID;

@property (nonatomic, strong) NSString* name;

//- (BOOL)validateName:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSSet *ponyFaces;

- (NSMutableSet*)ponyFacesSet;

@end

@interface _FavoritePonyFaceTag (PonyFacesCoreDataGeneratedAccessors)
- (void)addPonyFaces:(NSSet*)value_;
- (void)removePonyFaces:(NSSet*)value_;
- (void)addPonyFacesObject:(FavoritePonyFace*)value_;
- (void)removePonyFacesObject:(FavoritePonyFace*)value_;

@end

@interface _FavoritePonyFaceTag (CoreDataGeneratedPrimitiveAccessors)

- (NSString*)primitiveName;
- (void)setPrimitiveName:(NSString*)value;

- (NSMutableSet*)primitivePonyFaces;
- (void)setPrimitivePonyFaces:(NSMutableSet*)value;

@end
