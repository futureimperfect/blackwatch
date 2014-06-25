//
//  BWViewController.h
//  BlackWatch
//
//  Created by James Barclay on 6/13/14.
//  Copyright (c) 2014 The Linde Group, Inc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AudioToolbox/AudioToolbox.h>

@interface BWViewController : UIViewController <UIPickerViewDataSource, UIPickerViewDelegate>
{
    NSMutableArray *adjective;
    NSMutableArray *noun;
    SystemSoundID soundFileObject;
}

//@property (strong, nonatomic) IBOutlet UILabel *adjectiveLabel;
//@property (strong, nonatomic) IBOutlet UILabel *nounLabel;
@property (strong, nonatomic) IBOutlet UIPickerView *pickerView;

- (IBAction)toPick:(id)sender;
- (void)action;

@end
