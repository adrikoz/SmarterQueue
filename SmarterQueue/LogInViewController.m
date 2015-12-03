//
//  LogInViewController.m
//  SmarterQueue
//
//  Created by Rod Matveev on 01/12/2015.
//  Copyright © 2015 SmarterQueue. All rights reserved.
//

#import "LogInViewController.h"
#import "InstagramKit.h"

@interface LogInViewController ()

@end

@implementation LogInViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)moveToTutorial{
    //NSLog(@"%f",self.view.frame.size.width);
    self.leftMarginOfBackgroundView.constant = -self.view.bounds.size.width -16;
    self.rightMarginOfBackgroundView.constant = self.view.bounds.size.width -16;
    [UIView animateWithDuration:0.5
                     animations:^{
                         [self.view layoutIfNeeded];
                     }];
}

-(IBAction)LogInTapped:(id)sender{
    //Check log in
    /*[self.view bringSubviewToFront:self.logInWebView];
    NSURL *authURL = [[InstagramEngine sharedEngine] authorizationURL];
    [self.logInWebView loadRequest:[NSURLRequest requestWithURL:authURL]];*/
    //Finish checking log in
    [self moveToTutorial];
}

- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType
{
    NSError *error;
    if ([[InstagramEngine sharedEngine] receivedValidAccessTokenFromURL:request.URL error:&error])
    {
        [self authenticationSuccess];
    }
    return YES;
}

- (void)authenticationSuccess
{
    NSLog(@"Successfully logged in!");
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
