//
//  GCArraySectionController.m
//  Demo
//
//  Created by Guillaume Campagna on 11-04-21.
//  Copyright 2011 LittleKiwi. All rights reserved.
//

#import "GCArraySectionController.h"

@interface GCArraySectionController ()

@property (nonatomic, retain) NSArray* content;

@end

@implementation GCArraySectionController

@synthesize content, title;

- (id)initWithArray:(NSArray *)array viewController:(UIViewController *)givenViewController {
    if ((self = [super initWithViewController:givenViewController])) {
        self.content = array;
    }
    return self;
}

#pragma mark -
#pragma mark Subclass

- (NSUInteger)contentNumberOfRow {
    return [self.content count];
}

- (NSString *)titleContentForRow:(NSUInteger)row {
    return [self.content objectAtIndex:row];
}

- (void)didSelectContentCellAtRow:(NSUInteger)row {
    [self.tableView deselectRowAtIndexPath:[self.tableView indexPathForSelectedRow]
                                  animated:YES];
}

- (void)dealloc {
    self.content = nil;
    self.title = nil;
    
    [super dealloc];
}

@end
