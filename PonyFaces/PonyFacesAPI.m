//
//  PonyFacesAPI.m
//  PonyFaces
//
//  Created by Andrew Molloy on 12/21/15.
//  Copyright © 2015 Andy Molloy. All rights reserved.
//

#import "PonyFacesAPI.h"
#import "PonyFaceCategory.h"
#import "PonyFace.h"

@implementation PonyFacesAPI

+ (NSURL*)baseURL
{
	static NSURL* sBaseURL = nil;
	static dispatch_once_t onceToken;
	dispatch_once(&onceToken, ^{
		sBaseURL = [NSURL URLWithString:@"http://ponyfac.es/api.json"];
	});
	return sBaseURL;
}

+ (void)performSearchForTag:(NSString*)tag completion:(void(^)(NSArray<PonyFaceCategory*>* results, NSError* error))completion
{
	NSString* query = [NSString stringWithFormat:@"tag:%@", tag];
	NSURL* requestURL = [[self baseURL] URLByAppendingPathComponent:query];
	NSMutableURLRequest* request = [NSMutableURLRequest requestWithURL:requestURL];
	[request setValue:@"text/json" forHTTPHeaderField:@"Accept"];
	[request setValue:@"text/json" forHTTPHeaderField:@"Content-Type"];

	[[[NSURLSession sharedSession] dataTaskWithRequest:request completionHandler:^(NSData* data, NSURLResponse* response, NSError* error) {
		NSArray* results = nil;
		if (!error)
		{
			NSDictionary* responseDict = [NSJSONSerialization JSONObjectWithData:data
																		 options:(NSJSONReadingOptions)0
																		   error:&error];
			if (responseDict)
			{
				results = [self ponyCategoriesFromJSONFacesArray:responseDict[@"faces"]
														   error:&error];
			}
		}

		completion(results, error);
	}] resume];
}

+ (NSArray*)ponyCategoriesFromJSONFacesArray:(NSArray*)faces error:(NSError**)error
{
	NSError* outError = nil;

	NSMutableDictionary<NSNumber*, PonyFaceCategory*>* categories = [NSMutableDictionary dictionary];

	for (NSDictionary* faceInfo in faces)
	{
		NSDictionary* categoryInfo = faceInfo[@"category"];
		if (!categoryInfo || !categoryInfo[@"id"] || !categoryInfo[@"name"])
		{
			outError = [NSError errorWithDomain:@"com.amolloy.ponyfaces"
										   code:kInvalidCategoryID
									   userInfo:@{NSLocalizedDescriptionKey: @"Face without category or category invalid"}];
			break;
		}

		NSString* categoryIDStr = categoryInfo[@"id"];
		NSNumber* categoryID = @(categoryIDStr.integerValue);
		NSString* categoryName = categoryInfo[@"name"];
		PonyFaceCategory* category = categories[categoryID];
		if (!category)
		{
			category = [PonyFaceCategory ponyFaceCategoryWithID:categoryID.integerValue
														   name:categoryName];
			categories[categoryID] = category;
		}

		NSNumber* enabled = faceInfo[@"enabled"];
		NSString* ponyIDStr = faceInfo[@"id"];
		NSNumber* ponyID = @(ponyIDStr.integerValue);
		NSURL* imageURL = [NSURL URLWithString:faceInfo[@"image"]];
		NSURL* link = [NSURL URLWithString:faceInfo[@"link"]];
		NSArray* tags = faceInfo[@"tags"];
		NSURL* thumbnailURL = [NSURL URLWithString:faceInfo[@"thumbnail"]];

		if (!enabled ||
			!ponyID ||
			!imageURL ||
			!link ||
			!tags ||
			!thumbnailURL)
		{
			outError = [NSError errorWithDomain:@"com.amolloy.ponyfaces"
										   code:kInvalidPonyFace
									   userInfo:@{NSLocalizedDescriptionKey: @"Invalid pony face"}];
			break;
		}

		[category addPonyFaceWithID:ponyID.integerValue
							   tags:tags
					   thumbnailURL:thumbnailURL
						   imageURL:imageURL
							   link:link
							enabled:enabled.boolValue];
	}

	if (error)
	{
		*error = outError;
	}

	return [categories allValues];
}

@end
