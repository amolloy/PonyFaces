//
//  PonyFacesAPI.h
//  PonyFaces
//
//  Created by Andrew Molloy on 12/21/15.
//  Copyright © 2015 Andy Molloy. All rights reserved.
//

#import <Foundation/Foundation.h>

@class PonyFaceCategory;

typedef NS_ENUM(NSInteger, PonyFacesAPIErrorCodes)
{
	kInvalidCategoryID = 1,
	kInvalidPonyFace = 2,
};

@interface PonyFacesAPI : NSObject
+ (void)performSearchForTag:(NSString*)tag completion:(void(^)(NSArray<PonyFaceCategory*>* results, NSError* error))completion;
@end
