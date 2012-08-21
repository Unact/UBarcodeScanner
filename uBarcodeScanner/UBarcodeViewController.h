//
//  UViewController.h
//  uBarcodeScanner
//
//  Created by kovtash on 21.08.12.
//  Copyright (c) 2012 unact. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UBarcodeViewController : UIViewController <UITextFieldDelegate>
- (void) processBarCode:(NSString *) barCode;
@end
