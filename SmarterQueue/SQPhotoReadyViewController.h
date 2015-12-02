//
//  SQPhotoReadyViewController.h
//  SmarterQueue
//
//  Created by Adrian  Kozhevnikov on 02/12/2015.
//  Copyright © 2015 SmarterQueue. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SQPhotoReadyViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextView *textView;
@property (weak, nonatomic) IBOutlet UIButton *postButton;
- (IBAction)postButtonPressed:(id)sender;

@end
