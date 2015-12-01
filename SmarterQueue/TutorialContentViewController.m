//
//  TutorialContentViewController.m
//  SmarterQueue
//
//  Created by Rod Matveev on 01/12/2015.
//  Copyright © 2015 SmarterQueue. All rights reserved.
//

#import "TutorialContentViewController.h"

@interface TutorialContentViewController ()

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

@end
