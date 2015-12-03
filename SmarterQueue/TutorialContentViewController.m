//
//  TutorialContentViewController.m
//  SmarterQueue
//
//  Created by Rod Matveev on 01/12/2015.
//  Copyright © 2015 SmarterQueue. All rights reserved.
//

#import "TutorialContentViewController.h"

@interface TutorialContentViewController (){
    NSTimer *tokenTimer;
}

@end

@implementation TutorialContentViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //self.tutorialImg.image = [UIImage imageNamed:self.imageFile];
    self.headerLabel.text = self.headerText;
    self.descriptionLabel.text = self.descriptionText;
    if([self.headerLabel.text isEqualToString:@"Finished!"]){
        self.finalView.alpha = 1;
        [self.view bringSubviewToFront:self.finalView];
    }else{
        self.finalView.alpha = 0;
        [self.view sendSubviewToBack:self.finalView];
    }
    self.enableNotifButton.layer.borderColor = [UIColor darkGrayColor].CGColor;
    self.enableNotifButton.layer.borderWidth = 1.5f;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)enablePushNotifs:(id)sender{
    if ([[UIApplication sharedApplication]respondsToSelector:@selector(isRegisteredForRemoteNotifications)])
    {
        [[UIApplication sharedApplication] registerUserNotificationSettings:[UIUserNotificationSettings settingsForTypes:(UIUserNotificationTypeSound | UIUserNotificationTypeAlert | UIUserNotificationTypeBadge) categories:nil]];
        
        [[UIApplication sharedApplication] registerForRemoteNotifications];
    }
    else
    {
        [[UIApplication sharedApplication] registerForRemoteNotificationTypes:
         (UIUserNotificationTypeBadge | UIUserNotificationTypeSound | UIUserNotificationTypeAlert)];
    }
    tokenTimer = [NSTimer scheduledTimerWithTimeInterval:1.5
                                                  target:self
                                                selector:@selector(checkForToken)
                                                userInfo:nil
                                                 repeats:YES];
}

-(void)checkForToken{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    if([defaults objectForKey:@"apns_device_token"] != nil){
        NSLog(@"Got token");
        [tokenTimer invalidate];
        //Register mobile device for Instagram push notifications
        
        //When request completes...
        [self.presentingViewController dismissViewControllerAnimated:YES completion:nil];
        NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
        NSString* firstTime = @"No";
        [defaults setObject:firstTime forKey:@"firstTime"];
        [defaults synchronize];
    }
}

@end
