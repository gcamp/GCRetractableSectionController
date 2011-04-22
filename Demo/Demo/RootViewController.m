//
//  RootViewController.m
//  Demo
//
//  Created by Guillaume Campagna on 11-04-21.
//  Copyright 2011 LittleKiwi. All rights reserved.
//

#import "RootViewController.h"
#import "GCSimpleSectionController.h"
#import "GCArraySectionController.h"
#import "GCCustomSectionController.h"
#import "GCEmptySectionController.h"

@interface RootViewController ()

@property (nonatomic, retain) NSArray* retractableControllers;

@end

@implementation RootViewController

@synthesize retractableControllers;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = NSLocalizedString(@"Demo",);
    
    GCSimpleSectionController* simpleController = [[GCSimpleSectionController alloc] initWithViewController:self];
    GCArraySectionController* arrayController = [[GCArraySectionController alloc]
                                                 initWithArray:[NSArray arrayWithObjects:@"This", @"content", @"is", @"in", @"an", @"array", nil] 
                                                 viewController:self];
    arrayController.title = NSLocalizedString(@"Content of an array",);
    GCCustomSectionController* customController = [[GCCustomSectionController alloc] initWithViewController:self];
    GCEmptySectionController* emptyController = [[GCEmptySectionController alloc] initWithViewController:self];
    self.retractableControllers = [NSArray arrayWithObjects:simpleController, arrayController, customController, emptyController, nil];
    [simpleController release];
    [arrayController release];
    [customController release];
    [emptyController release];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 4;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    GCRetractableSectionController* sectionController = [self.retractableControllers objectAtIndex:section];
    return sectionController.numberOfRow;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    GCRetractableSectionController* sectionController = [self.retractableControllers objectAtIndex:indexPath.section];
    return [sectionController cellForRow:indexPath.row];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    GCRetractableSectionController* sectionController = [self.retractableControllers objectAtIndex:indexPath.section];
    return [sectionController didSelectCellAtRow:indexPath.row];
}

- (void)dealloc
{
    self.retractableControllers = nil;
    
    [super dealloc];
}

@end
