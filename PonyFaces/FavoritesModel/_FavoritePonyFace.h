// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to FavoritePonyFace.h instead.

@import CoreData;

extern const struct FavoritePonyFaceAttributes {
	__unsafe_unretained NSString *imageURL;
	__unsafe_unretained NSString *link;
	__unsafe_unretained NSString *ponyID;
	__unsafe_unretained NSString *thumbnailURL;
} FavoritePonyFaceAttributes;

extern const struct FavoritePonyFaceRelationships {
	__unsafe_unretained NSString *category;
	__unsafe_unretained NSString *tags;
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

@property (nonatomic, strong) NSString* imageURL;

//- (BOOL)validateImageURL:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSString* link;

//- (BOOL)validateLink:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSNumber* ponyID;

@property (atomic) int64_t ponyIDValue;
- (int64_t)ponyIDValue;
- (void)setPonyIDValue:(int64_t)value_;

//- (BOOL)validatePonyID:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSString* thumbnailURL;

//- (BOOL)validateThumbnailURL:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) FavoritePonyFaceCategory *category;

//- (BOOL)validateCategory:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSSet *tags;

- (NSMutableSet*)tagsSet;

@end

@interface _FavoritePonyFace (TagsCoreDataGeneratedAccessors)
- (void)addTags:(NSSet*)value_;
- (void)removeTags:(NSSet*)value_;
- (void)addTagsObject:(FavoritePonyFaceTag*)value_;
- (void)removeTagsObject:(FavoritePonyFaceTag*)value_;

@end

@interface _FavoritePonyFace (CoreDataGeneratedPrimitiveAccessors)

- (NSString*)primitiveImageURL;
- (void)setPrimitiveImageURL:(NSString*)value;

- (NSString*)primitiveLink;
- (void)setPrimitiveLink:(NSString*)value;

- (NSNumber*)primitivePonyID;
- (void)setPrimitivePonyID:(NSNumber*)value;

- (int64_t)primitivePonyIDValue;
- (void)setPrimitivePonyIDValue:(int64_t)value_;

- (NSString*)primitiveThumbnailURL;
- (void)setPrimitiveThumbnailURL:(NSString*)value;

- (FavoritePonyFaceCategory*)primitiveCategory;
- (void)setPrimitiveCategory:(FavoritePonyFaceCategory*)value;

- (NSMutableSet*)primitiveTags;
- (void)setPrimitiveTags:(NSMutableSet*)value;

@end
