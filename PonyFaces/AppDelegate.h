//
//  AppDelegate.h
//  PonyFaces
//
//  Created by Andrew Molloy on 12/21/15.
//  Copyright © 2015 Andy Molloy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

- (UIFontDescriptor*)ponyFacesFontDescriptor;
- (UIColor*)ponyFacesMainColor;
- (void)setNetworkActivityIndicatorVisible:(BOOL)visible;
@end

