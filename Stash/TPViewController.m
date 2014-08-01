//
//  TPViewController.m
//  Stash
//
//  Created by Taylor Potter on 4/30/14.
//  Copyright (c) 2014 potter.io. All rights reserved.
//

#import "TPViewController.h"

@interface TPViewController () <UIScrollViewDelegate>

@property (nonatomic, weak) IBOutlet SWParallaxScrollView *scrollView;

@end

@implementation TPViewController

- (void)viewDidLoad
{
  [super viewDidLoad];
    
  UIImage *back = [UIImage imageNamed:@"forrest"];

  CGSize tileSize = back.size;
  CGRect tileFrame = CGRectMake(0, 0, back.size.width, tileSize.height);
  
  NSLog(@" %f", back.size.width);
  NSLog(@" %f", back.size.height);

  
  UIImageView *bgTile = [[UIImageView alloc] initWithImage:back];
  bgTile.frame = tileFrame;
  
  
  [_scrollView addSubview:bgTile onLayer: -1.105];

  
  _scrollView.contentSize = CGSizeMake( 5 * self.view.bounds.size.width, tileSize.height );

  

  [[NSNotificationCenter defaultCenter] postNotificationName:@"UpdateBrowseScreen" object:nil];

  [[NSNotificationCenter defaultCenter] addObserver:self
                                           selector:@selector(scrollRight)
                                               name:@"moveRight"
                                             object:nil];
  
  [[NSNotificationCenter defaultCenter] addObserver:self
                                           selector:@selector(scrollLeft)
                                               name:@"moveLeft"
                                             object:nil];
 
  [[NSNotificationCenter defaultCenter] addObserver:self
                                           selector:@selector(scrolltoHome)
                                               name:@"mainView"
                                             object:nil];

  [[NSNotificationCenter defaultCenter] addObserver:self
                                           selector:@selector(scrollToAddIdea)
                                               name:@"moveToAddIdea"
                                             object:nil];
  
  [[NSNotificationCenter defaultCenter] addObserver:self
                                           selector:@selector(scrollToAddIdea)
                                               name:@"moveToDetailIdea"
                                             object:nil];
  
}

- (void)viewWillAppear:(BOOL)animated
{
  
  [super viewWillAppear:animated];

  [self scrolltoHome];
}


- (void)scrolltoHome
{
  CGFloat width = CGRectGetWidth(self.view.frame);
  CGFloat height = CGRectGetHeight(self.view.frame);
  
  [_scrollView scrollRectToVisible:CGRectMake(width *2, 0, width, height) animated:YES];

}

- (void)scrollToAddIdea
{
  CGFloat width = CGRectGetWidth(self.view.frame);
  CGFloat height = CGRectGetHeight(self.view.frame);
  
  [_scrollView scrollRectToVisible:CGRectMake(width *4, 0, width, height) animated:YES];
  
  
}

-(void)scrollToIdeaDetail
{
  CGFloat width = CGRectGetWidth(self.view.frame);
  CGFloat height = CGRectGetHeight(self.view.frame);
  
  [_scrollView scrollRectToVisible:CGRectMake(0, 0, width, height) animated:YES];
  
}
- (void)scrollRight
{
   NSLog(@" %@",NSStringFromCGRect(_scrollView.bounds));
  
  CGFloat width = CGRectGetWidth(self.view.frame);
  CGFloat height = CGRectGetHeight(self.view.frame);
  
  CGFloat x = _scrollView.bounds.origin.x + 320;
  
  [_scrollView scrollRectToVisible:CGRectMake(x, 0, width, height) animated:YES];
  
}

- (void)scrollLeft
{
  CGFloat width = CGRectGetWidth(self.view.frame);
  CGFloat height = CGRectGetHeight(self.view.frame);
  
  CGFloat x = _scrollView.bounds.origin.x - 320;
  
  [_scrollView scrollRectToVisible:CGRectMake(x, 0, width, height) animated:YES];
  
}
@end
