//
//  DemoAppDelegate.h
//  Demo
//
//  Created by Guillaume Campagna on 11-04-21.
//  Copyright 2011 LittleKiwi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DemoAppDelegate : NSObject <UIApplicationDelegate>

@property (nonatomic, retain) IBOutlet UIWindow *window;

@property (nonatomic, retain) IBOutlet UINavigationController *navigationController;

@end
