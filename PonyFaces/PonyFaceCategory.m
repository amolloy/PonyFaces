//
//  PonyCategory.m
//  PonyFaces
//
//  Created by Andrew Molloy on 12/21/15.
//  Copyright © 2015 Andy Molloy. All rights reserved.
//

#import "PonyFaceCategory.h"
#import "PonyFace.h"

@interface PonyFaceCategory ()
@property (nonatomic, assign, readwrite) NSInteger categoryID;
@property (nonatomic, copy, readwrite) NSString* name;
@property (nonatomic, copy, readwrite) NSArray<PonyFace*>* faces;
@end

@implementation PonyFaceCategory

- (instancetype)initWithID:(NSInteger)categoryID
					  name:(NSString*)name
{
	self = [super init];
	if (self)
	{
		self.categoryID = categoryID;
		self.name = name;
		self.faces = [NSArray array];
	}
	return self;
}

+ (instancetype)ponyFaceCategoryWithID:(NSInteger)categoryID
								  name:(NSString*)name
{
	return [[self alloc] initWithID:categoryID name:name];
}

- (void)addPonyFaceWithID:(NSInteger)ponyID
					 tags:(NSArray*)tags
			 thumbnailURL:(NSURL*)thumbnailURL
				 imageURL:(NSURL*)imageURL
					 link:(NSURL*)link
				  enabled:(BOOL)enabled
{
	PonyFace* ponyFace = [PonyFace ponyFaceWithID:ponyID
										 category:self
											 tags:tags
									 thumbnailURL:thumbnailURL
										 imageURL:imageURL
											 link:link
										  enabled:enabled];

	self.faces = [self.faces arrayByAddingObject:ponyFace];
}

@end
