//
//  PonyFace.h
//  PonyFaces
//
//  Created by Andrew Molloy on 12/21/15.
//  Copyright © 2015 Andy Molloy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PonyFaceModel.h"

@class PonyFaceCategory;

@interface PonyFace : NSObject <PonyFaceModel>
@property (nonatomic, assign, readonly) NSNumber* ponyID;
@property (nonatomic, weak, readonly) PonyFaceCategory* category;
@property (nonatomic, copy, readonly) NSArray<NSString*>* tags;
@property (nonatomic, strong, readonly) NSURL* thumbnailURL;
@property (nonatomic, strong, readonly) NSURL* imageURL;
@property (nonatomic, strong, readonly) NSURL* link;
@property (nonatomic, assign, readonly) BOOL enabled;

+ (instancetype)ponyFaceWithID:(NSInteger)ponyID
					  category:(PonyFaceCategory*)category
						  tags:(NSArray<NSString*>*)tags
				  thumbnailURL:(NSURL*)thumbnailURL
					  imageURL:(NSURL*)imageURL
						  link:(NSURL*)link
					   enabled:(BOOL)enabled;
- (instancetype)initWithID:(NSInteger)ponyID
				  category:(PonyFaceCategory*)category
					  tags:(NSArray<NSString*>*)tags
			  thumbnailURL:(NSURL*)thumbnailURL
				  imageURL:(NSURL*)imageURL
					  link:(NSURL*)link
				   enabled:(BOOL)enabled;
@end
