//
//  DEMOFirstViewController.m
//  RESideMenuExample
//
//  Created by Roman Efimov on 10/10/13.
//  Copyright (c) 2013 Roman Efimov. All rights reserved.
//

#import "SQFirstViewController.h"
#import "LogInViewController.h"
#import "SQPhotoReadyViewController.h"

@interface SQFirstViewController (){
    BOOL isFirstTime;
}

@end

@implementation SQFirstViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    UIImageView *iv = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 50, 30)];
    iv.contentMode = UIViewContentModeScaleAspectFit;
    iv.image = [UIImage imageNamed:@"logo"];
    self.navigationItem.titleView = iv;
    UIImage *menu = [[UIImage imageNamed:@"menu"] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
    
    CGRect frame = CGRectMake(0, 0, 20, 20);
    
    //init a normal UIButton using that image
    UIButton* menuButton = [[UIButton alloc] initWithFrame:frame];
    [menuButton setBackgroundImage:menu forState:UIControlStateNormal];
    menuButton.tintColor = [UIColor darkGrayColor];
    //[button setShowsTouchWhenHighlighted:YES];
    
    //set the button to handle clicks - this one calls a method called 'downloadClicked'
    [menuButton addTarget:self action:@selector(presentLeftMenuViewController:) forControlEvents:UIControlEventTouchDown];
    
    //finally, create your UIBarButtonItem using that button
    UIBarButtonItem* menuBar = [[UIBarButtonItem alloc] initWithCustomView:menuButton];
    menuBar.tintColor = [UIColor darkGrayColor];
    
    UIButton* spaceButton = [[UIButton alloc] initWithFrame:frame];
    //[button setShowsTouchWhenHighlighted:YES];
    
    //set the button to handle clicks - this one calls a method called 'downloadClicked'
    
    //finally, create your UIBarButtonItem using that button
    UIBarButtonItem* spaceBar = [[UIBarButtonItem alloc] initWithCustomView:spaceButton];
    spaceBar.tintColor = [UIColor darkGrayColor];
    self.navigationItem.rightBarButtonItem = spaceBar;
    self.navigationItem.leftBarButtonItem = menuBar;
    /*self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Left"
                                                                             style:UIBarButtonItemStylePlain
                                                                            target:self
                                                                            action:@selector(presentLeftMenuViewController:)];*/
    
    /*UIImageView *imageView = [[UIImageView alloc] initWithFrame:self.view.bounds];
    imageView.contentMode = UIViewContentModeScaleAspectFill;
    imageView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    imageView.image = [UIImage imageNamed:@"Balloon"];
    [self.view addSubview:imageView];*/
    
    //Check if first open//
    isFirstTime = YES;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    /*NSLog(@"DEMOFirstViewController will appear");
    if(isFirstTime == YES){
        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
        LogInViewController *LogInVc = [storyboard instantiateViewControllerWithIdentifier:@"LogInViewController"];
        [self presentViewController:LogInVc animated:YES completion:nil];
    }*/
    /*NSLog(@"DEMOFirstViewController will appear");
    if(isFirstTime == YES){
        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
        SQPhotoReadyViewController *LogInVc = [storyboard instantiateViewControllerWithIdentifier:@"SQPhotoReadyViewController"];
        [self presentViewController:LogInVc animated:YES completion:nil];
    }*/
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    NSLog(@"DEMOFirstViewController will disappear");
}

@end
