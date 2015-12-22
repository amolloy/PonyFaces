#import "FavoritePonyFace.h"
#import "FavoritePonyFaceCategory.h"
#import "FavoritePonyFaceTag.h"

@interface FavoritePonyFace ()
@end

@implementation FavoritePonyFace

- (NSString*)categoryName
{
	return self.category.name;
}

- (NSURL*)thumbnailURL
{
	return [NSURL URLWithString:self.thumbnailURLStr];
}

- (NSURL*)imageURL
{
	return [NSURL URLWithString:self.imageURLStr];
}

- (NSURL*)link
{
	return [NSURL URLWithString:self.linkStr];
}

- (NSArray<NSString*>*)tags
{
	NSMutableArray<NSString*>* tags = [NSMutableArray arrayWithCapacity:self.tagObjects.count];

	for (FavoritePonyFaceTag* tag in self.tagObjects)
	{
		[tags addObject:tag.name];
	}

	return tags.copy;
}

@end
