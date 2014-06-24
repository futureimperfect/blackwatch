//
//  BWViewController.h
//  BlackWatch
//
//  Created by James Barclay on 6/13/14.
//  Copyright (c) 2014 The Linde Group, Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BWViewController : UIViewController <UIPickerViewDataSource, UIPickerViewDelegate>
{
    NSArray *adjective;
    NSArray *noun;
}

@property (strong, nonatomic) IBOutlet UILabel *adjectiveLabel;
@property (strong, nonatomic) IBOutlet UILabel *nounLabel;
@property (strong, nonatomic) IBOutlet UIPickerView *pickerView;

- (IBAction)toPick:(id)sender;

@end
