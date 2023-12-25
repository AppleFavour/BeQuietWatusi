#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

// CC BY-ND 3.0 
// Free to distribution WITHOUT ANY MODIFICATON
// Created by Turann_ on 25/12/2023
// Copyright © 2023 AppleFavour. All rights reserved.
// Thanks to DPixelStore this project based off DPixelStore.dylib reversed code

%hook UIViewController
- (void)presentViewController:(UIViewController *)viewControllerToPresent animated:(BOOL)animated completion:(void (^)(void))completion {
    if ([viewControllerToPresent isKindOfClass:[UIAlertController class]]) {
        UIAlertController *alertController = (UIAlertController *)viewControllerToPresent;
        NSLog(@"Hello World! \nAlert detected:\nTitle: %@\nMessage: %@\nAppleFavour © 2024 by Turann_", alertController.title, alertController.message);
        NSString *title = alertController.title;
        NSString *message = alertController.message;
        if ([title isEqualToString:@"Watusi"] && [message containsString:@"unofficial"]) {
            NSLog(@"Hello World! \nDetected and dismissed Watusi alert!\nAppleFavour © 2024 by Turann_");
            return;
        }
    }
    %orig(viewControllerToPresent, animated, completion); /* My implementation with override. */
}

%end

%hook UILabel
-(void)setText:(NSString *)arg1 {
    if ([arg1 isEqualToString:@"Help & Support"]) { arg1 = @"© AppleFavour"; }
    %orig; /* Original Implementation */}
%end