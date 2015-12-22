//
//  PonyFace.m
//  PonyFaces
//
//  Created by Andrew Molloy on 12/21/15.
//  Copyright © 2015 Andy Molloy. All rights reserved.
//

#import "PonyFace.h"
#import "PonyFaceCategory.h"

@interface PonyFace ()
@property (nonatomic, assign, readwrite) NSNumber* ponyID;
@property (nonatomic, weak, readwrite) PonyFaceCategory* category;
@property (nonatomic, copy, readwrite) NSArray* tags;
@property (nonatomic, strong, readwrite) NSURL* thumbnailURL;
@property (nonatomic, strong, readwrite) NSURL* imageURL;
@property (nonatomic, strong, readwrite) NSURL* link;
@property (nonatomic, assign, readwrite) BOOL enabled;
@end

@implementation PonyFace

- (instancetype)initWithID:(NSInteger)ponyID
				  category:(PonyFaceCategory*)category
					  tags:(NSArray<NSString*>*)tags
			  thumbnailURL:(NSURL*)thumbnailURL
				  imageURL:(NSURL*)imageURL
					  link:(NSURL*)link
				   enabled:(BOOL)enabled
{
	self = [super init];
	if (self)
	{
		self.ponyID = @(ponyID);
		self.category = category;
		self.tags = tags;
		self.thumbnailURL = thumbnailURL;
		self.imageURL = imageURL;
		self.link = link;
		self.enabled = enabled;
	}
	return self;
}

+ (instancetype)ponyFaceWithID:(NSInteger)ponyID
					  category:(PonyFaceCategory*)category
						  tags:(NSArray<NSString*>*)tags
				  thumbnailURL:(NSURL*)thumbnailURL
					  imageURL:(NSURL*)imageURL
						  link:(NSURL*)link
					   enabled:(BOOL)enabled
{
	return [[self alloc] initWithID:ponyID
						   category:category
							   tags:tags
					   thumbnailURL:thumbnailURL
						   imageURL:imageURL
							   link:link
							enabled:enabled];
}

- (NSString*)categoryName
{
	return self.category.name;
}

@end
