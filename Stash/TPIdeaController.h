//
//  TPIdeaController.h
//  Stash
//
//  Created by Taylor Potter on 5/1/14.
//  Copyright (c) 2014 potter.io. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TPIdea.h"

@interface TPIdeaController : NSObject
@property (strong, nonatomic) NSMutableArray *ideas;
@property (strong, nonatomic) TPIdea *pendingIdea;
@property (strong, nonatomic) TPIdea *mySelectedIdea;

-(instancetype)initWithArchive;

- (void)saveIdeas;

@end
