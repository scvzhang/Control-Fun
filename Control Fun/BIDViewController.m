//
//  BIDViewController.m
//  Control Fun
//
//  Created by 张 俊 on 14-1-4.
//  Copyright (c) 2014年 zhangjun. All rights reserved.
//

#import "BIDViewController.h"

@interface BIDViewController ()

@end

@implementation BIDViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.sliderLabel.text = @"50";
    UIImage *buttonImageNormal = [UIImage imageNamed:@"whiteButton.pnp"];
    UIImage *stretchableButtonImageNormal = [buttonImageNormal stretchableImageWithLeftCapWidth:12 topCapHeight:0];
    [_doSomethingButton setBackgroundImage:stretchableButtonImageNormal forState:UIControlStateNormal];
    
    UIImage *buttonImagePress = [UIImage imageNamed:@"blueButton.pnp"];
    UIImage *stretchableButtonImagePressed = [buttonImagePress stretchableImageWithLeftCapWidth:12 topCapHeight:0];
    [_doSomethingButton setBackgroundImage:stretchableButtonImagePressed forState:UIControlStateHighlighted];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)textFieldDoneEditing:(id)sender{
    [sender resignFirstResponder];
}

-(IBAction)backgroundTap:(id)sender{
    [_nameField resignFirstResponder];
    [_numberField resignFirstResponder];
}

- (IBAction)sliderChanged:(id)sender {
    UISlider *slider = sender;
    int progressAsInt = roundf(slider.value);
    _sliderLabel.text = [NSString stringWithFormat:@"%d", progressAsInt];
}

- (IBAction)switchChanged:(id)sender {
    UISwitch *whichSwitch = (UISwitch *)sender;
    BOOL setting = whichSwitch.isOn;
    [_leftSwitch setOn:setting animated:YES];
    [_rightSwitch setOn:setting animated:YES];
}

- (IBAction)toggleControls:(id)sender {
    if ([sender selectedSegmentIndex] == 0) {
        _leftSwitch.hidden = NO;
        _rightSwitch.hidden = NO;
        _doSomethingButton.hidden = YES;
    }else{
        _leftSwitch.hidden = YES;
        _rightSwitch.hidden = YES;
        _doSomethingButton.hidden = NO;
    }
}

- (IBAction)buttonPress:(id)sender {
    UIActionSheet *actionSheet = [[UIActionSheet alloc]
                                  initWithTitle:@"Are you sure?"
                                  delegate:self
                                  cancelButtonTitle:@"No Way!"
                                  destructiveButtonTitle:@"Yes, I'm Sure!"
                                  otherButtonTitles: nil];
    [actionSheet showInView:self.view];
}

- (void)actionSheet:(UIActionSheet *)actionSheet didDismissWithButtonIndex:(NSInteger)buttonIndex{
    if (buttonIndex != [actionSheet cancelButtonIndex]) {
        NSString *msg = nil;
        if (_nameField.text.length > 0) {
            msg = [[NSString alloc] initWithFormat:@"You can breathe easy, %@, every thing went OK.", _nameField.text];
        }else{
            msg = @"You can breathe easy, every thing went OK.";
        }
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Something was down." message:msg delegate:self cancelButtonTitle:@"Phew!" otherButtonTitles:nil];
        [alert show];
    }
}


@end
