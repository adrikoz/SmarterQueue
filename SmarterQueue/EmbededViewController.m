//
//  EmbededViewController.m
//  SmarterQueue
//
//  Created by Rod Matveev on 01/12/2015.
//  Copyright © 2015 SmarterQueue. All rights reserved.
//

#import "EmbededViewController.h"

@interface EmbededViewController ()

@end

@implementation EmbededViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _pageTitles = @[@"Connect accounts", @"Schedule posts", @"Receive notifications", @"Receive photo & caption",@"Finished!"];
    _pageImages = @[@"profile pic.png", @"profile pic.png", @"profile pic.png", @"profile pic.png",@"_"];
    _pageDescriptions = @[@"Lorem ipsum dolor sit amet, consectetur adipiscing elit. In commodo sem at scelerisque sodales.", @"Lorem ipsum dolor sit amet, consectetur adipiscing elit. In commodo sem at scelerisque sodales.", @"Lorem ipsum dolor sit amet, consectetur adipiscing elit. In commodo sem at scelerisque sodales.", @"Lorem ipsum dolor sit amet, consectetur adipiscing elit. In commodo sem at scelerisque sodales.",@"Lorem ipsum dolor sit amet, consectetur adipiscing elit. In commodo sem at scelerisque sodales."];
    
    self.pageViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"PageViewController"];
    self.pageViewController.dataSource = self;
    
    TutorialContentViewController *startingViewController = [self viewControllerAtIndex:0];
    NSArray *viewControllers = @[startingViewController];
    [self.pageViewController setViewControllers:viewControllers direction:UIPageViewControllerNavigationDirectionForward animated:NO completion:nil];

    [self addChildViewController:_pageViewController];
    [self.view addSubview:_pageViewController.view];
    [self.view addSubview:self.pageControl];
    [self.pageViewController didMoveToParentViewController:self];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark - Page View Controller Data Source

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController
{
    NSUInteger index = ((TutorialContentViewController*) viewController).pageIndex;
    self.pageControl.currentPage = index;
    if ((index == 0) || (index == NSNotFound)) {
        return nil;
    }
    
    index--;
    //self.pageControl.currentPage = index;
    return [self viewControllerAtIndex:index];
    
}

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController
{
    NSUInteger index = ((TutorialContentViewController*) viewController).pageIndex;
    self.pageControl.currentPage = index;
    if (index == NSNotFound) {
        return nil;
    }
    
    index++;
    if (index == [self.pageTitles count]) {
        return nil;
    }
    return [self viewControllerAtIndex:index];
}

- (TutorialContentViewController *)viewControllerAtIndex:(NSUInteger)index
{
    if (([self.pageTitles count] == 0) || (index >= [self.pageTitles count])) {
        return nil;
    }
    TutorialContentViewController *pageContentViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"TutorialContentViewController"];
    pageContentViewController.imageFile = self.pageImages[index];
    pageContentViewController.headerText = self.pageTitles[index];
    pageContentViewController.descriptionText = self.pageDescriptions[index];
    //NSLog(@"index: %lu",(unsigned long)index);
    pageContentViewController.pageIndex = index;
    
    return pageContentViewController;
}
@end
