//
//  GCSimpleSectionController.m
//  Demo
//
//  Created by Guillaume Campagna on 11-04-21.
//  Copyright 2011 LittleKiwi. All rights reserved.
//

#import "GCSimpleSectionController.h"

@interface GCSimpleSectionController ()

@property (nonatomic, readonly) NSArray* colors;

@end

@implementation GCSimpleSectionController

@synthesize colors;

#pragma mark -
#pragma mark Subclass

- (NSString *)title {
    return NSLocalizedString(@"Simple exemple",);
}

- (NSString *)titleContentForRow:(NSUInteger)row {
    return [self.colors objectAtIndex:row];
}

- (NSUInteger)contentNumberOfRow {
    return [self.colors count];
}

- (void)didSelectContentCellAtRow:(NSUInteger)row {
    //Reaction to the selection
    UIAlertView* alert = [[UIAlertView alloc] initWithTitle:NSLocalizedString(@"WOO!",) 
                                                    message:NSLocalizedString(@"You just tapped me... Let that not happend again. :P",) 
                                                   delegate:nil cancelButtonTitle:NSLocalizedString(@"Sorry...",) otherButtonTitles: nil];
    [alert show];
    [alert release];
    
    [self.tableView deselectRowAtIndexPath:[self.tableView indexPathForSelectedRow] animated:YES];
}

#pragma mark -
#pragma mark Getters

- (NSArray *)colors {
    if (colors == nil) {
        colors = [[NSArray alloc] initWithObjects:@"Blue", @"Green", @"Red", @"Yellow", nil];
    }
    return colors;
}

- (void)dealloc {
    [colors release];
    
    [super dealloc];
}

@end
