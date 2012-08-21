//
//  MyViewController.m
//  uBarcodeScanner
//
//  Created by kovtash on 21.08.12.
//  Copyright (c) 2012 unact. All rights reserved.
//

#import "MyViewController.h"

@interface MyViewController ()
@property (strong, nonatomic) IBOutlet UITextField *barcodeValue;

@end

@implementation MyViewController
@synthesize barcodeValue;

- (void) processBarCode:(NSString *) barCode{
    self.barcodeValue.text = barCode;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)viewDidUnload
{
    [self setBarcodeValue:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
