//
//  TPIdea.h
//  Stash
//
//  Created by Taylor Potter on 5/1/14.
//  Copyright (c) 2014 potter.io. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TPIdea : NSObject <NSCoding>

@property (strong, nonatomic) NSString *workingTitle;
@property (strong, nonatomic) UIImage *categoryIcon;
@property (strong, nonatomic) NSString *appDescription;
@property (strong, nonatomic) NSData *imageData;

@end
