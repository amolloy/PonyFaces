//
//  PonyFaceModel.h
//  PonyFaces
//
//  Created by Andrew Molloy on 12/22/15.
//  Copyright © 2015 Andy Molloy. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol PonyFaceModel <NSObject>

- (NSNumber*)ponyID;
- (NSString*)categoryName;
- (NSURL*)thumbnailURL;
- (NSURL*)imageURL;
- (NSURL*)link;
- (NSArray<NSString*>*)tags;

@end
