//
//  TPIdeaController.m
//  Stash
//
//  Created by Taylor Potter on 5/1/14.
//  Copyright (c) 2014 potter.io. All rights reserved.
//

#import "TPIdeaController.h"

@implementation TPIdeaController

-(instancetype)initWithArchive
{
  self = [super init];
  
  if (self) {
    NSString *ideasPath = [[TPIdeaController applicationDocumentsDirectory] stringByAppendingPathComponent:@"Ideas.plist"];

    self.ideas = [NSKeyedUnarchiver unarchiveObjectWithFile:ideasPath];

    if (!self.ideas)
    {
      self.ideas = [NSMutableArray new];
    }
    
    
  }
  return self;
}



+ (NSString *)applicationDocumentsDirectory
{
  return [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject];
}

- (void)saveIdeas

{

  NSString *ideasPath = [[TPIdeaController applicationDocumentsDirectory] stringByAppendingPathComponent:@"Ideas.plist"];
  
  [NSKeyedArchiver archiveRootObject:self.ideas toFile:ideasPath];

}

@end
