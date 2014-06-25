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
    adjectives = [[NSMutableArray alloc] init];
    nouns = [[NSMutableArray alloc] init];
    nounChoices = [NSArray arrayWithObjects:@"Computer", @"Mouse", @"iPhone", @"Wi-Fi Card", @"Keyboard", @"Remote", @"Software", @"Server", @"Router", @"Switch", @"Cable", nil];
    adjectiveChoices = [[NSArray alloc] initWithObjects:@"Broken", @"Busted", @"Hosed", @"Fubar", @"Corrupted", @"Fried", @"Cracked", @"Smashed", @"Disjointed", @"Irregular", @"Defeated", nil];

    for (NSInteger i=0; i<100; i++) {
//        [adjectives setObject:[NSNumber numberWithInt:arc4random()%10] atIndexedSubscript:i];
        [adjectives setObject:[adjectiveChoices objectAtIndex:[[NSNumber numberWithInt:arc4random()%11] integerValue]] atIndexedSubscript:i];
//        [nouns setObject:[NSNumber numberWithInt:arc4random()%10] atIndexedSubscript:i];
        [nouns setObject:[nounChoices objectAtIndex:[[NSNumber numberWithInt:arc4random()%11] integerValue]] atIndexedSubscript:i];
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

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    if (component == 0) {
        NSLog(@"adjective: %@", [adjectives objectAtIndex:row]);
        return [adjectives objectAtIndex:row];
    } else {
        NSLog(@"noun: %@", [nouns objectAtIndex:row]);
        return [nouns objectAtIndex:row];
    }
}

//- (UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view
//{
//    UIImageView *slotImage = [[UIImageView alloc] init];
//
//    if (component == 0) {
//        [slotImage setImage:[UIImage imageNamed:[NSString stringWithFormat:@"slot%02d.png", [[nouns objectAtIndex:row] integerValue]]]];
//        NSLog(@"filename component 0: %@", [NSString stringWithFormat:@"slot%02d.png", [[nouns objectAtIndex:row] integerValue]]);
//    } else {
//        [slotImage setImage:[UIImage imageNamed:[NSString stringWithFormat:@"slot%02d.png", [[adjectives objectAtIndex:row] integerValue]]]];
//        NSLog(@"filename component 1: %@", [NSString stringWithFormat:@"slot%02d.png", [[adjectives objectAtIndex:row] integerValue]]);
//    }
//    if (component == 1) {
//        [slotImage setImage:[UIImage imageNamed:[NSString stringWithFormat:@"slot%02d.png", [[nouns objectAtIndex:row] integerValue]]]];
//        NSLog(@"filename component 0: %@", [NSString stringWithFormat:@"slot%02d.png", [[nouns objectAtIndex:row] integerValue]]);
//    }
//
//    return slotImage;
//}

- (void)action
{
    NSURL *soundURL = [[NSBundle mainBundle] URLForResource:@"fail-trombone-03" withExtension:@"wav"];
    AudioServicesCreateSystemSoundID((__bridge CFURLRef)soundURL, &soundFileObject);
    AudioServicesPlaySystemSound(soundFileObject);

    [_pickerView selectRow:arc4random()%94+3 inComponent:0 animated:YES];
    [_pickerView selectRow:arc4random()%94+3 inComponent:1 animated:YES];

    if ([adjectives objectAtIndex:[_pickerView selectedRowInComponent:0]] == [nouns objectAtIndex:[_pickerView selectedRowInComponent:1]]) {
        NSLog(@"Bingo!");
    }
}

@end
