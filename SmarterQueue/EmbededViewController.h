//
//  EmbededViewController.h
//  SmarterQueue
//
//  Created by Rod Matveev on 01/12/2015.
//  Copyright © 2015 SmarterQueue. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TutorialContentViewController.h"

@interface EmbededViewController : UIViewController <UIPageViewControllerDataSource,UIPageViewControllerDelegate>

@property (strong, nonatomic) UIPageViewController *pageViewController;
@property (strong, nonatomic) NSArray *pageTitles;
@property (strong, nonatomic) NSArray *pageDescriptions;
@property (strong, nonatomic) NSArray *pageImages;
@property (strong, nonatomic) IBOutlet UIPageControl *pageControl;

@end
