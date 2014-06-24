//
//  BWViewController.m
//  BlackWatch
//
//  Created by James Barclay on 6/13/14.
//  Copyright (c) 2014 The Linde Group, Inc. All rights reserved.
//

#import "BWViewController.h"

@interface BWViewController ()

@end

@implementation BWViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.

    adjective = [NSArray arrayWithObjects:@"Broken", @"Busted", @"Hosed", @"Fubar", nil];
    noun = [NSArray arrayWithObjects:@"Computer", @"Mouse", @"iPhone", @"SCSI Controller", nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)toPick:(id)sender
{
    _adjectiveLabel.text = [adjective objectAtIndex:[_pickerView selectedRowInComponent:0]];
    _nounLabel.text = [noun objectAtIndex:[_pickerView selectedRowInComponent:1]];
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 2;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    if (component == 0) {
        return [adjective count];
    } else {
        return [noun count];
    }
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    if (component == 0) {
        return [adjective objectAtIndex:row];
    } else {
        return [noun objectAtIndex:row];
    }
}

@end
