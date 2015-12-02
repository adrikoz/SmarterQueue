//
//  TutorialContentViewController.h
//  SmarterQueue
//
//  Created by Rod Matveev on 01/12/2015.
//  Copyright © 2015 SmarterQueue. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TutorialContentViewController : UIViewController

@property (weak,nonatomic) IBOutlet UIImageView *tutorialImg;
@property (weak,nonatomic) IBOutlet UILabel *headerLabel;
@property (weak,nonatomic) IBOutlet UILabel *descriptionLabel;
@property (weak,nonatomic) IBOutlet UIView *finalView;
@property (weak,nonatomic) IBOutlet UIButton *enableNotifButton;
@property NSUInteger pageIndex;
@property NSString *headerText;
@property NSString *descriptionText;
@property NSString *imageFile;

@end
