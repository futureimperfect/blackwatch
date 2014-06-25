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

//    adjective = [NSArray arrayWithObjects:@"Broken", @"Busted", @"Hosed", @"Fubar", nil];
//    noun = [NSArray arrayWithObjects:@"Computer", @"Mouse", @"iPhone", @"SCSI Controller", nil];
    adjective = [[NSMutableArray alloc] init];
    noun = [[NSMutableArray alloc] init];

    for (NSInteger i=0; i<100; i++) {
        [adjective setObject:[NSNumber numberWithInt:arc4random()%10] atIndexedSubscript:i];
        [noun setObject:[NSNumber numberWithInt:arc4random()%10] atIndexedSubscript:i];
    }

    [self action];
}

- (void)viewDidUnload
{
    [super viewDidUnload];

    // Dispose of the sound file object
    AudioServicesDisposeSystemSoundID(soundFileObject);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)toPick:(id)sender
{
    /*
    _adjectiveLabel.text = [adjective objectAtIndex:[_pickerView selectedRowInComponent:0]];
    _nounLabel.text = [noun objectAtIndex:[_pickerView selectedRowInComponent:1]];
    */

    [self action];
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 2;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
//    if (component == 0) {
//        return [adjective count];
//    } else {
//        return [noun count];
//    }
    return 100;
}

/*
- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    if (component == 0) {
        return [adjective objectAtIndex:row];
    } else {
        return [noun objectAtIndex:row];
    }
}
*/

- (UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view
{
    UIImageView *slotImage = [[UIImageView alloc] init];

    if (component == 0) {
        [slotImage setImage:[UIImage imageNamed:[NSString stringWithFormat:@"slot%02d.png", [[noun objectAtIndex:row] integerValue]]]];
        NSLog(@"filename component 0: %@", [NSString stringWithFormat:@"slot%02d.png", [[noun objectAtIndex:row] integerValue]]);
    } else {
        [slotImage setImage:[UIImage imageNamed:[NSString stringWithFormat:@"slot%02d.png", [[adjective objectAtIndex:row] integerValue]]]];
        NSLog(@"filename component 1: %@", [NSString stringWithFormat:@"slot%02d.png", [[noun objectAtIndex:row] integerValue]]);
    }

    return slotImage;
}

- (void)action
{
    NSURL *soundURL = [[NSBundle mainBundle] URLForResource:@"fail-trombone-03" withExtension:@"wav"];
    AudioServicesCreateSystemSoundID((__bridge CFURLRef)soundURL, &soundFileObject);
    AudioServicesPlaySystemSound(soundFileObject);

    [_pickerView selectRow:arc4random()%94+3 inComponent:0 animated:YES];
    [_pickerView selectRow:arc4random()%94+3 inComponent:1 animated:YES];

    if ([adjective objectAtIndex:[_pickerView selectedRowInComponent:0]] == [noun objectAtIndex:[_pickerView selectedRowInComponent:1]]) {
        NSLog(@"Bingo!");
    }
}

@end
