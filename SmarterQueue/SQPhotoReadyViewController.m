//
//  SQPhotoReadyViewController.m
//  SmarterQueue
//
//  Created by Adrian  Kozhevnikov on 02/12/2015.
//  Copyright © 2015 SmarterQueue. All rights reserved.
//

#import "SQPhotoReadyViewController.h"

@interface SQPhotoReadyViewController ()

@end

@implementation SQPhotoReadyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.textView scrollRangeToVisible:NSMakeRange(0, 1)];
    
    [UIPasteboard generalPasteboard].string = self.textView.text;
    
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
    [menuButton addTarget:self action:@selector(hideViewController) forControlEvents:UIControlEventTouchDown];
    
    //finally, create your UIBarButtonItem using that button
    UIBarButtonItem* menuBar = [[UIBarButtonItem alloc] initWithCustomView:menuButton];
    menuBar.tintColor = [UIColor darkGrayColor];
    
    UIButton* spaceButton = [[UIButton alloc] initWithFrame:frame];
    //[button setShowsTouchWhenHighlighted:YES];
    
    //set the button to handle clicks - this one calls a method called 'downloadClicked'
    
    //finally, create your UIBarButtonItem using that button
    UIBarButtonItem* spaceBar = [[UIBarButtonItem alloc] initWithCustomView:spaceButton];
    spaceBar.tintColor = [UIColor darkGrayColor];
    self.navigationItem.rightBarButtonItem = menuBar;
    self.navigationItem.leftBarButtonItem = spaceBar;

    // Do any additional setup after loading the view.
}

- (void)viewDidLayoutSubviews {
    [self.textView setContentOffset:CGPointZero animated:NO];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)hideViewController
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)postButtonPressed:(id)sender {
    if([[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:@"instagram://app"]]){
        UIApplication *ourApplication = [UIApplication sharedApplication];
        NSString *urlStr = @"instagram://app";
        NSURL *ourURL = [NSURL URLWithString:urlStr];
        [ourApplication openURL:ourURL];
    }
}
@end
