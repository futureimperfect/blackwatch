//
//  BWViewController.h
//  BlackWatch
//
//  Created by James Barclay on 6/13/14.
//  Copyright (c) 2014 Everything is Gray. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AudioToolbox/AudioToolbox.h>
#import <MessageUI/MessageUI.h>

@interface BWViewController : UIViewController <UIPickerViewDataSource, UIPickerViewDelegate, MFMailComposeViewControllerDelegate>
{
    NSMutableArray *adjectives;
    NSMutableArray *nouns;
    NSArray *adjectiveChoices;
    NSArray *nounChoices;
    SystemSoundID soundFileObject;
    MFMailComposeViewController *email;
}

//@property (strong, nonatomic) IBOutlet UILabel *adjectiveLabel;
//@property (strong, nonatomic) IBOutlet UILabel *nounLabel;
@property (strong, nonatomic) IBOutlet UIPickerView *pickerView;
@property (nonatomic, retain) MFMailComposeViewController *email;

- (IBAction)toPick:(id)sender;
- (IBAction)emailExcuse:(id)sender;
- (void)action;

@end
