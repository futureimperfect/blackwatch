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

    DataArray = [NSArray arrayWithObjects:@"Broken", @"Busted", @"Hosed", nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)toPick:(id)sender
{
    _labelShow.text = [DataArray objectAtIndex:[_pickerView selectedRowInComponent:0]];
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return [DataArray count];
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    return [DataArray objectAtIndex:row];
}

@end
