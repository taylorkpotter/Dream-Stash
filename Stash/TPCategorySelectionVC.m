//
//  TPCategorySelectionVC.m
//  Stash
//
//  Created by Taylor Potter on 5/1/14.
//  Copyright (c) 2014 potter.io. All rights reserved.
//

#import "TPCategorySelectionVC.h"
//#import ""
#import "TPAppDelegate.h"
#import "TPIdea.h"

@interface TPCategorySelectionVC ()
@property (weak, nonatomic) TPAppDelegate *appDelegate;
@property (weak, nonatomic) IBOutlet UILabel *categoryTitle;

@property (nonatomic) BOOL buttonsDisabled;

@end

@implementation TPCategorySelectionVC


-(void)viewDidLoad
{
  [super viewDidLoad];
  
  self.appDelegate = [[UIApplication sharedApplication] delegate];
  self.ideaController = self.appDelegate.ideaController;
  
  self.categoryTitle.layer.borderColor = [[UIColor whiteColor] CGColor];
  self.categoryTitle.layer.borderWidth= 2.0f;
  
  
  [[NSNotificationCenter defaultCenter] addObserver:self
                                           selector:@selector(prepareForOnScreen)
                                               name:@"PrepareCategorySelect"
                                             object:nil];

  
  
}

-(void)prepareForOnScreen
{
  self.buttonsDisabled = NO;
}

- (IBAction)BacktoHome:(id)sender {
  if (!self.buttonsDisabled)
  {
    self.buttonsDisabled = YES;
   [[NSNotificationCenter defaultCenter] postNotificationName:@"moveLeft" object:nil];
    [[NSNotificationCenter defaultCenter] postNotificationName:@"refreshHome" object:nil];
  }
}

- (IBAction)categorySelected:(id)sender
{
  if (self.ideaController.pendingIdea) {
    UIButton *button = (UIButton *)sender;
    self.ideaController.pendingIdea.categoryIcon = button.imageView.image;
    [[NSNotificationCenter defaultCenter] postNotificationName:@"moveRight" object:nil];
    [[NSNotificationCenter defaultCenter] postNotificationName:@"categorySelected" object:nil];
    [[NSNotificationCenter defaultCenter] postNotificationName:@"refreshHome" object:nil];

  } else {

  TPIdea *idea = [TPIdea new];
  UIButton *button = (UIButton *)sender;
  idea.categoryIcon = button.imageView.image;
  self.ideaController.pendingIdea = idea;  
  [[NSNotificationCenter defaultCenter] postNotificationName:@"moveRight" object:nil];
  [[NSNotificationCenter defaultCenter] postNotificationName:@"categorySelected" object:nil];
    [[NSNotificationCenter defaultCenter] postNotificationName:@"refreshHome" object:nil];
  }
}



@end


