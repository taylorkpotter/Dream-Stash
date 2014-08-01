//
//  TPHomeVC.m
//  Stash
//
//  Created by Taylor Potter on 5/1/14.
//  Copyright (c) 2014 potter.io. All rights reserved.
//

#import "TPViewController.h"
#import "TPHomeVC.h"


@interface TPHomeVC () <UIScrollViewDelegate>

@property (weak, nonatomic) IBOutlet SWParallaxScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UIButton *addButton;
@property (weak, nonatomic) IBOutlet UIButton *browseButton;

@property (nonatomic) BOOL addButtonDisabled;

@end

@implementation TPHomeVC


-(void)viewDidLoad
{
  [super viewDidLoad];
  
   self.scrollView.delegate = self;
  
  [[NSNotificationCenter defaultCenter] addObserver:self
                                           selector:@selector(refreshInterface)
                                               name:@"refreshHome"
                                             object:nil];

}




-(void)refreshInterface
{
  self.addButtonDisabled = NO;
}
  

- (IBAction)addNewIdea:(id)sender
{
  
  if ([sender tag] == 1)
  {
    
    if (!self.addButtonDisabled)
    {
      
    self.addButtonDisabled = YES;
      
    [[NSNotificationCenter defaultCenter] postNotificationName:@"moveRight" object:nil];
    [[NSNotificationCenter defaultCenter] postNotificationName:@"PrepareCategorySelect" object:nil];
    [[NSNotificationCenter defaultCenter] postNotificationName:@"clearNewIdeaTextFields" object:nil];
      
    }
    
  } else if ([sender tag] == 2)
  {
    
    if (!self.addButtonDisabled)
    {
    
      self.addButtonDisabled = YES;
    [[NSNotificationCenter defaultCenter] postNotificationName:@"moveLeft" object:nil];
    [[NSNotificationCenter defaultCenter] postNotificationName:@"PrepareBrowseScreen" object:nil];

    }
  }

}


@end
