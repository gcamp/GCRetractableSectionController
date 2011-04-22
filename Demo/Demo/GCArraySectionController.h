//
//  GCArraySectionController.h
//  Demo
//
//  Created by Guillaume Campagna on 11-04-21.
//  Copyright 2011 LittleKiwi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GCRetractableSectionController.h"

@interface GCArraySectionController : GCRetractableSectionController 

@property (nonatomic, copy, readwrite) NSString* title;

- (id)initWithArray:(NSArray*) array viewController:(UIViewController *)givenViewController;

@end
