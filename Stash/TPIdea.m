//
//  TPIdea.m
//  Stash
//
//  Created by Taylor Potter on 5/1/14.
//  Copyright (c) 2014 potter.io. All rights reserved.
//

#import "TPIdea.h"

@implementation TPIdea

-(instancetype)initWithCoder:(NSCoder *)aDecoder
{
  self = [super init];
  
  if (!self)
  {
    return nil;
  }
    self.categoryIcon = [UIImage imageWithData:self.imageData];

    self.imageData = [aDecoder decodeObjectForKey:@"imageData"];
    self.workingTitle = [aDecoder decodeObjectForKey:@"workingTitle"];
    self.appDescription = [aDecoder decodeObjectForKey:@"appDescription"];
    self.categoryIcon = [aDecoder decodeObjectForKey:@"categoryIcon"];
    return self;
}

-(void)encodeWithCoder:(NSCoder *)aCoder
{
  self.imageData = UIImagePNGRepresentation(self.categoryIcon);
  
  [aCoder encodeObject:self.workingTitle forKey:@"workingTitle"];
  [aCoder encodeObject:self.imageData forKey:@"imageData"];
  [aCoder encodeObject:self.categoryIcon forKey:@"categoryIcon"];
  [aCoder encodeObject:self.appDescription forKey:@"appDescription"];
}





@end
