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
    
    //Finish checking log in
    [self moveToTutorial];
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
