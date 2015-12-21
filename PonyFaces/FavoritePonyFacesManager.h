//
//  FavoritePonyFacesManager.h
//  PonyFaces
//
//  Created by Andrew Molloy on 12/21/15.
//  Copyright © 2015 Andy Molloy. All rights reserved.
//

#import <Foundation/Foundation.h>

@class PonyFace;

@interface FavoritePonyFacesManager : NSObject

+ (id)sharedManager;

- (void)setupCoreDataStack;
- (void)cleanUp;

- (void)addFavoritePonyFace:(PonyFace*)ponyFace;
- (BOOL)isPonyFaceAFavorite:(PonyFace*)ponyFace;

@end
