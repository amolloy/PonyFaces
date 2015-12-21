//
//  PonyCategory.h
//  PonyFaces
//
//  Created by Andrew Molloy on 12/21/15.
//  Copyright © 2015 Andy Molloy. All rights reserved.
//

#import <Foundation/Foundation.h>

@class PonyFace;

@interface PonyFaceCategory : NSObject
@property (nonatomic, assign, readonly) NSInteger categoryID;
@property (nonatomic, copy, readonly) NSString* name;
@property (nonatomic, copy, readonly) NSArray<PonyFace*>* faces;

- (instancetype)initWithID:(NSInteger)categoryID
					  name:(NSString*)name;
+ (instancetype)ponyFaceCategoryWithID:(NSInteger)categoryID
								  name:(NSString*)name;

- (void)addPonyFaceWithID:(NSInteger)ponyID
					 tags:(NSArray*)tags
			 thumbnailURL:(NSURL*)thumbnailURL
				 imageURL:(NSURL*)imageURL
					 link:(NSURL*)link
				  enabled:(BOOL)enabled;
@end
