//
//  TPAppDelegate.h
//  Stash
//
//  Created by Taylor Potter on 4/30/14.
//  Copyright (c) 2014 potter.io. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TPIdeaController.h"
//#import <HockeySDK/HockeySDK.h>


@interface TPAppDelegate : UIResponder <UIApplicationDelegate>
@property (nonatomic, strong) TPIdeaController *ideaController;

@property (strong, nonatomic) UIWindow *window;

@end
