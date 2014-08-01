//
//  TPIdeaDetailVC.m
//  Stash
//
//  Created by Taylor Potter on 5/1/14.
//  Copyright (c) 2014 potter.io. All rights reserved.
//

#import "TPIdeaDetailVC.h"
#import "TPAppDelegate.h"
#import <QuartzCore/QuartzCore.h>


@interface TPIdeaDetailVC () <UITextFieldDelegate, UITextViewDelegate>


@property (weak, nonatomic) TPAppDelegate *appDelegate;
@property (weak, nonatomic) IBOutlet UITextField *appName;
@property (weak, nonatomic) IBOutlet UIImageView *appIcon;
@property (weak, nonatomic) IBOutlet UITextView *appDescription;
@property (weak, nonatomic) IBOutlet UIButton *editButton;

@property (weak, nonatomic) IBOutlet UIView *blueView;
@property (nonatomic) BOOL buttonsDisabled;
@property (nonatomic) BOOL isEditing;
@property (weak, nonatomic) IBOutlet UIButton *backButton;
@property (weak, nonatomic) IBOutlet UIImageView *backButtonArrow;



@end

@implementation TPIdeaDetailVC



-(void)viewDidLoad
{
  [super viewDidLoad];
  
  
  self.appDelegate = [[UIApplication sharedApplication] delegate];
  self.ideaController = self.appDelegate.ideaController;
  
  self.appDescription.contentInset = UIEdgeInsetsMake(4,25,0,0);
  


  
  
  [[NSNotificationCenter defaultCenter] addObserver:self
                                           selector:@selector(prepareForOnScreen)
                                               name:@"MyIdeaSelected"
                                             object:nil];
  
}
- (IBAction)backButton:(id)sender {
  if (!self.buttonsDisabled) {
    self.buttonsDisabled = YES;
  
  [[NSNotificationCenter defaultCenter] postNotificationName:@"moveRight" object:nil];
  [[NSNotificationCenter defaultCenter] postNotificationName:@"PrepareBrowseScreen" object:nil];
    }
  
}


-(void)prepareForOnScreen
{
  self.buttonsDisabled = NO;
  self.appName.text = self.ideaController.mySelectedIdea.workingTitle;
  self.appIcon.image = self.ideaController.mySelectedIdea.categoryIcon;
  self.appDescription.text = self.ideaController.mySelectedIdea.appDescription;
  
  NSLog(@"%@", self.appDescription.text);

}

- (IBAction)editIdea:(id)sender {
  
  if (!self.isEditing) {
    self.isEditing = YES;
    self.appDescription.layer.borderColor = [[UIColor orangeColor] CGColor];
    [self.appDescription setBackgroundColor:[UIColor colorWithRed:0.840 green:0.570 blue:0.200 alpha:0.500]];
    [self.appName setBackgroundColor:[UIColor colorWithRed:0.840 green:0.570 blue:0.200 alpha:0.500]];

    self.appDescription.layer.borderWidth= 2.0f;
    _appName.layer.borderWidth = 2.0f;
    _appName.layer.borderColor = [[UIColor colorWithRed:0.84 green:0.57 blue:0.2 alpha:1] CGColor];
    [self.backButton setEnabled:NO];
    [self.backButtonArrow setBackgroundColor:[UIColor clearColor]];
    
    
    
    
    
    
    [self.editButton setTitle:@"d o n e" forState:UIControlStateNormal];
  }
  else
  {
    self.isEditing = NO;
    [self.backButton setEnabled:YES];
    [self.editButton setTitle:@"e d i t" forState:UIControlStateNormal];
    self.appDescription.layer.borderColor = [[UIColor clearColor] CGColor];
    [self.appDescription setBackgroundColor:[UIColor clearColor]];
    [self.appName setBackgroundColor:[UIColor clearColor]];



    self.appDescription.layer.borderWidth= 2.0f;
    _appName.layer.borderWidth = 2.0f;
    _appName.layer.borderColor = [[UIColor clearColor] CGColor];
    

  
    
    self.ideaController.mySelectedIdea.workingTitle = self.appName.text;
    self.ideaController.mySelectedIdea.appDescription = self.appDescription.text;
    
    [self.ideaController saveIdeas];
    
  
  
  }

}
#pragma mark - Keyboard Handler

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
  [self.appName resignFirstResponder];
  [self.appDescription resignFirstResponder];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
  [textField resignFirstResponder];
  return NO;
}
- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text {
  
  if([text isEqualToString:@"\n"]) {
    [textView resignFirstResponder];
    return NO;
  }
  
  return YES;
}



@end
