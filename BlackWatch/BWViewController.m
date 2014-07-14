//
//  BWViewController.m
//  BlackWatch
//
//  Created by James Barclay on 6/13/14.
//  Copyright (c) 2014 Everything is Gray. All rights reserved.
//

#import "BWViewController.h"

@interface BWViewController ()

@end

@implementation BWViewController

@synthesize email;

- (void)viewDidLoad
{
    [super viewDidLoad];

	// Do any additional setup after loading the view, typically from a nib.
    [self setupChoices];
    [self action];
}

- (void)setupChoices
{
    //    adjective = [NSArray arrayWithObjects:@"Broken", @"Busted", @"Hosed", @"Fubar", nil];
    //    noun = [NSArray arrayWithObjects:@"Computer", @"Mouse", @"iPhone", @"SCSI Controller", nil];
    adjectives = [[NSMutableArray alloc] init];
    nouns = [[NSMutableArray alloc] init];
    nounChoices = [NSArray arrayWithObjects:@"Computer", @"Mouse", @"iPhone", @"Wi-Fi Card", @"Keyboard", @"Remote", @"Software", @"Server", @"Router", @"Switch", @"Cable", @"LCD", @"Hard Drive", nil];
    adjectiveChoices = [[NSArray alloc] initWithObjects:@"Broken", @"Busted", @"Hosed", @"Fubar", @"Corrupted", @"Fried", @"Cracked", @"Smashed", @"Disjointed", @"Irregular", @"Defeated", @"Sprained", @"Bruised", nil];

    for (NSInteger i=0; i<100; i++) {
        //        [adjectives setObject:[NSNumber numberWithInt:arc4random()%10] atIndexedSubscript:i];
        [adjectives setObject:[adjectiveChoices objectAtIndex:[[NSNumber numberWithInt:arc4random()%13] integerValue]] atIndexedSubscript:i];
        //        [nouns setObject:[NSNumber numberWithInt:arc4random()%10] atIndexedSubscript:i];
        [nouns setObject:[nounChoices objectAtIndex:[[NSNumber numberWithInt:arc4random()%13] integerValue]] atIndexedSubscript:i];
    }
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

- (IBAction)emailExcuse:(id)sender {
    NSString *currentAdjective = [adjectives objectAtIndex:[_pickerView selectedRowInComponent:0]];
    NSString *currentNoun = [nouns objectAtIndex:[_pickerView selectedRowInComponent:1]];
    NSString *subject = [NSString stringWithFormat:@"Your %@ is %@", currentNoun, currentAdjective];
    NSString *message = [NSString stringWithFormat:@"I'm sorry but your %@ is %@. There's nothing more we can do, so you might as well buy a new one or stop using technology altogether.", currentNoun, currentAdjective];
    [self sendEmail:subject message:message];
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

/*
 Email methods
 */
- (void)mailComposeController:(MFMailComposeViewController *)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError *)error
{
    // Should check to see the result
    [email dismissViewControllerAnimated:YES completion:nil];
}

- (void)sendEmail:(NSString *)subject message:(NSString *)message
{
    // Initialize the view controller and set the delegate
    email = [[MFMailComposeViewController alloc] init];
    email.mailComposeDelegate = self;

    // Set the subject and message
    [email setSubject:subject];
    [email setMessageBody:message isHTML:NO];

    // Present the view controller
    [self presentViewController:email animated:YES completion:nil];
}

@end
