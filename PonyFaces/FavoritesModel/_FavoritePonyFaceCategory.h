// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to FavoritePonyFaceCategory.h instead.

@import CoreData;

extern const struct FavoritePonyFaceCategoryAttributes {
	__unsafe_unretained NSString *categoryID;
	__unsafe_unretained NSString *name;
} FavoritePonyFaceCategoryAttributes;

extern const struct FavoritePonyFaceCategoryRelationships {
	__unsafe_unretained NSString *ponyFaces;
} FavoritePonyFaceCategoryRelationships;

@class FavoritePonyFace;

@interface FavoritePonyFaceCategoryID : NSManagedObjectID {}
@end

@interface _FavoritePonyFaceCategory : NSManagedObject {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
@property (nonatomic, readonly, strong) FavoritePonyFaceCategoryID* objectID;

@property (nonatomic, strong) NSNumber* categoryID;

@property (atomic) int64_t categoryIDValue;
- (int64_t)categoryIDValue;
- (void)setCategoryIDValue:(int64_t)value_;

//- (BOOL)validateCategoryID:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSString* name;

//- (BOOL)validateName:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSSet *ponyFaces;

- (NSMutableSet*)ponyFacesSet;

@end

@interface _FavoritePonyFaceCategory (PonyFacesCoreDataGeneratedAccessors)
- (void)addPonyFaces:(NSSet*)value_;
- (void)removePonyFaces:(NSSet*)value_;
- (void)addPonyFacesObject:(FavoritePonyFace*)value_;
- (void)removePonyFacesObject:(FavoritePonyFace*)value_;

@end

@interface _FavoritePonyFaceCategory (CoreDataGeneratedPrimitiveAccessors)

- (NSNumber*)primitiveCategoryID;
- (void)setPrimitiveCategoryID:(NSNumber*)value;

- (int64_t)primitiveCategoryIDValue;
- (void)setPrimitiveCategoryIDValue:(int64_t)value_;

- (NSString*)primitiveName;
- (void)setPrimitiveName:(NSString*)value;

- (NSMutableSet*)primitivePonyFaces;
- (void)setPrimitivePonyFaces:(NSMutableSet*)value;

@end
