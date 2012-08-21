//
//  UViewController.m
//  uBarcodeScanner
//
//  Created by kovtash on 21.08.12.
//  Copyright (c) 2012 unact. All rights reserved.
//

#import "UBarcodeViewController.h"

@interface UBarcodeViewController ()
@property (nonatomic,assign) BOOL iskeyboardHidden;
@property (nonatomic,strong) UITextField *barcodeField;
@property (nonatomic,strong) UIView *barcodeFieldContainer;
@end

#define BARCODE_INPUT_HEIGHT 50.0

@implementation UBarcodeViewController

- (UIView *) barcodeFieldContainer{
    if (_barcodeFieldContainer == nil){
        _barcodeFieldContainer = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width , BARCODE_INPUT_HEIGHT)];
        [self.view addSubview:self.barcodeFieldContainer];
        self.barcodeFieldContainer.backgroundColor = [UIColor colorWithRed:0.5 green:0.5 blue:0.5 alpha:0.5];
        [self.barcodeFieldContainer setHidden:YES];
    }
    
    return _barcodeFieldContainer;
}

- (UITextField *) barcodeField{
    
    if (_barcodeField == nil) {
        _barcodeField = [[UITextField alloc] init];
        [self.barcodeFieldContainer addSubview:self.barcodeField];
        
        self.barcodeField.delegate = self;
        
        CGFloat textHeight = self.barcodeField.superview.bounds.size.height * 0.8;
        
        self.barcodeField.bounds = CGRectMake(0, 0, self.barcodeField.superview.bounds.size.width , textHeight);
        self.barcodeField.center = self.barcodeField.superview.center;
        self.barcodeField.font = [UIFont systemFontOfSize:textHeight * 0.8];
        self.barcodeField.minimumFontSize = textHeight * 0.4;
        self.barcodeField.adjustsFontSizeToFitWidth = YES;
        self.barcodeField.textAlignment = UITextAlignmentCenter;
        self.barcodeField.placeholder = @"enter barcode";
        
        self.barcodeField.autocapitalizationType = UITextAutocapitalizationTypeNone;
        self.barcodeField.keyboardType = UIKeyboardTypeASCIICapable;
        self.barcodeField.autocorrectionType = UITextAutocorrectionTypeNo;
        self.barcodeField.spellCheckingType = UITextSpellCheckingTypeNo;
        self.barcodeField.enablesReturnKeyAutomatically = YES;
        self.barcodeField.returnKeyType =  UIReturnKeyDone;
    }
    
    return _barcodeField;
}

- (void) setIskeyboardHidden:(BOOL)iskeyboardHidden{
    _iskeyboardHidden = iskeyboardHidden;
    [self inputMethodChanged];
}

- (void)keyboardWillAppear:(NSNotification *) notification{
    self.iskeyboardHidden = NO;
}

- (void)keyboardWillDisappear:(NSNotification *) notification{
    self.iskeyboardHidden = YES;
}

- (void) inputMethodChanged{
    
    if (self.iskeyboardHidden) {
        [self.barcodeFieldContainer setHidden:YES];
    }
    else {
        [self.barcodeFieldContainer setHidden:NO];
    }
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    
    [self processBarCode:textField.text];
    textField.text = @"";
    return YES;
}

- (BOOL)textFieldShouldEndEditing:(UITextField *)textField{
    return NO;
}

- (void) processBarCode:(NSString *) barCode{
    NSLog(@"Barcode scanned: %@", barCode);
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillAppear:) name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillDisappear:) name:UIKeyboardWillHideNotification object:nil];
    
    [self.barcodeField becomeFirstResponder];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{    
    return NO;
}

@end
