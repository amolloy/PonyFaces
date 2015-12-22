// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to FavoritePonyFace.h instead.

@import CoreData;

extern const struct FavoritePonyFaceAttributes {
	__unsafe_unretained NSString *imageURLStr;
	__unsafe_unretained NSString *linkStr;
	__unsafe_unretained NSString *ponyID;
	__unsafe_unretained NSString *thumbnailURLStr;
} FavoritePonyFaceAttributes;

extern const struct FavoritePonyFaceRelationships {
	__unsafe_unretained NSString *category;
	__unsafe_unretained NSString *tagObjects;
} FavoritePonyFaceRelationships;

@class FavoritePonyFaceCategory;
@class FavoritePonyFaceTag;

@interface FavoritePonyFaceID : NSManagedObjectID {}
@end

@interface _FavoritePonyFace : NSManagedObject {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
@property (nonatomic, readonly, strong) FavoritePonyFaceID* objectID;

@property (nonatomic, strong) NSString* imageURLStr;

//- (BOOL)validateImageURLStr:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSString* linkStr;

//- (BOOL)validateLinkStr:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSNumber* ponyID;

@property (atomic) int64_t ponyIDValue;
- (int64_t)ponyIDValue;
- (void)setPonyIDValue:(int64_t)value_;

//- (BOOL)validatePonyID:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSString* thumbnailURLStr;

//- (BOOL)validateThumbnailURLStr:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) FavoritePonyFaceCategory *category;

//- (BOOL)validateCategory:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSSet *tagObjects;

- (NSMutableSet*)tagObjectsSet;

@end

@interface _FavoritePonyFace (TagObjectsCoreDataGeneratedAccessors)
- (void)addTagObjects:(NSSet*)value_;
- (void)removeTagObjects:(NSSet*)value_;
- (void)addTagObjectsObject:(FavoritePonyFaceTag*)value_;
- (void)removeTagObjectsObject:(FavoritePonyFaceTag*)value_;

@end

@interface _FavoritePonyFace (CoreDataGeneratedPrimitiveAccessors)

- (NSString*)primitiveImageURLStr;
- (void)setPrimitiveImageURLStr:(NSString*)value;

- (NSString*)primitiveLinkStr;
- (void)setPrimitiveLinkStr:(NSString*)value;

- (NSNumber*)primitivePonyID;
- (void)setPrimitivePonyID:(NSNumber*)value;

- (int64_t)primitivePonyIDValue;
- (void)setPrimitivePonyIDValue:(int64_t)value_;

- (NSString*)primitiveThumbnailURLStr;
- (void)setPrimitiveThumbnailURLStr:(NSString*)value;

- (FavoritePonyFaceCategory*)primitiveCategory;
- (void)setPrimitiveCategory:(FavoritePonyFaceCategory*)value;

- (NSMutableSet*)primitiveTagObjects;
- (void)setPrimitiveTagObjects:(NSMutableSet*)value;

@end
