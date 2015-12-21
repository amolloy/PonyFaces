//
//  SearchTagsViewController.m
//  PonyFaces
//
//  Created by Andrew Molloy on 12/21/15.
//  Copyright © 2015 Andy Molloy. All rights reserved.
//

#import "SearchTagsViewController.h"
#import "PonyFacesAPI.h"
#import "PonyFacesTableViewController.h"
#import "PonyFaceSearchResultsDataSource.h"

static NSString* const ShowSearchResultsSegue = @"ShowSearchResults";

@interface SearchTagsViewController () <UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField* searchTextField;
@property (weak, nonatomic) IBOutlet UIButton* searchButton;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView* activityIndicator;
@property (strong, nonatomic) PonyFaceSearchResultsDataSource* searchResults;
@end

@implementation SearchTagsViewController

- (void)viewWillAppear:(BOOL)animated
{
	[super viewWillAppear:animated];

	self.searchTextField.enabled = YES;
	self.searchResults = nil;
	[self.activityIndicator stopAnimating];
	self.searchButton.enabled = (self.searchTextField.text.length != 0);
}

- (IBAction)search:(id)sender
{
	self.searchTextField.enabled = NO;
	self.searchButton.enabled = NO;
	[self.activityIndicator startAnimating];

	NSString* query = self.searchTextField.text;

	__weak typeof(self) wself = self;
	[PonyFacesAPI performSearchForTag:query
						   completion:^(NSArray* results, NSError* error) {
							   __strong typeof(self) sself = wself;
							   sself.searchResults = [[PonyFaceSearchResultsDataSource alloc] initWithSearchResults:results];
							   dispatch_async(dispatch_get_main_queue(), ^{
								   [self.activityIndicator stopAnimating];
								   
								   if (error)
								   {
									   UIAlertController* controller = [UIAlertController alertControllerWithTitle:@"Error"
																										   message:error.localizedDescription
																									preferredStyle:UIAlertControllerStyleAlert];
									   [controller addAction:[UIAlertAction actionWithTitle:@"Ok"
																					  style:UIAlertActionStyleDefault
																					handler:nil]];
									   [sself presentViewController:controller
														   animated:YES
														 completion:nil];

									   sself.searchTextField.enabled = YES;
								   }
								   else
								   {
									   [self performSegueWithIdentifier:ShowSearchResultsSegue
																 sender:self];
								   }
							   });
						   }];
}

- (void)prepareForSegue:(UIStoryboardSegue*)segue sender:(id)sender
{
	if ([segue.destinationViewController respondsToSelector:@selector(setPonyFacesDataSource:)])
	{
		[segue.destinationViewController setPonyFacesDataSource:self.searchResults];
	}
}

#pragma mark Text field delegate

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
	NSString* newString = [textField.text stringByReplacingCharactersInRange:range withString:string];
	self.searchButton.enabled = newString.length != 0;
	return YES;
}

@end
