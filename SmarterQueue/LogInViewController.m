//
//  LogInViewController.m
//  SmarterQueue
//
//  Created by Rod Matveev on 01/12/2015.
//  Copyright © 2015 SmarterQueue. All rights reserved.
//

#import "LogInViewController.h"

@interface LogInViewController ()

@end

@implementation LogInViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //self.logInWebView.delegate = self;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)moveToTutorial{
    self.leftMarginOfBackgroundView.constant = -self.view.bounds.size.width -16;
    self.rightMarginOfBackgroundView.constant = self.view.bounds.size.width -16;
    [UIView animateWithDuration:0.5
                     animations:^{
                         [self.view layoutIfNeeded];
                     }];
}

-(IBAction)LogInTapped:(id)sender{
    //Check log in
    //[self.view bringSubviewToFront:self.logInWebView];
    //self.logInWebView.alpha = 1;
    //NSString *scopeStr = @"scope=basic";
    //NSString *url = [NSString stringWithFormat:@"https://www.instagram.com/oauth/authorize/?client_id=%@&%@&redirect_uri=%@&response_type=code",INSTAGRAM_CLIENT_ID, scopeStr, INSTAGRAM_CALLBACK_BASE];*/
    //NSString *url = [NSString stringWithFormat:@"http://dev.smarterqueue.com/instagram_login"];
    //[self.logInWebView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:url]]];
    [self performSelector:@selector(checkInstagramAuth) withObject:nil afterDelay:2];
}

-(void) didAuthWithToken:(NSString*)token
{
    if(!token)
    {
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Error"
                                                            message:@"Failed to request token."
                                                           delegate:nil
                                                  cancelButtonTitle:@"OK"
                                                  otherButtonTitles:nil];
        [alertView show];
        return;
    }
    
    //As a test, we'll request a list of popular Instagram photos.
    NSString *instagramBase = @"https://api.instagram.com/v1";
    NSString *popularURLString = [NSString stringWithFormat:@"%@/media/popular?access_token=%@", instagramBase, token];
}

-(void) checkInstagramAuth
{
    InstagramAuthController *instagramAuthController = [InstagramAuthController new];
    instagramAuthController.authDelegate = self;
    
    instagramAuthController.modalPresentationStyle = UIModalPresentationFormSheet;
    instagramAuthController.modalTransitionStyle = UIModalTransitionStyleCoverVertical;
    
    [self presentViewController:instagramAuthController animated:YES completion:^{ } ];
    
    __weak InstagramAuthController *weakAuthController = instagramAuthController;
    
    instagramAuthController.completionBlock = ^(void) {
        [weakAuthController dismissViewControllerAnimated:YES completion:nil];
    };
    NSLog(@"Check instagram auth");
}


@end
