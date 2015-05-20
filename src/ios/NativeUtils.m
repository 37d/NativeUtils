//
//  NativeUtils.m
//  
//
//  Created by Paul Michael Wisdom on 5/20/15.
//
//

#import "NativeUtils.h"
#import <CoreLocation/CoreLocation.h>

@implementation NativeUtils

BOOL showPrompt;

- (void)pluginInitialize {
    showPrompt = NO;
}

- (void)checkGPSState:(CDVInvokedUrlCommand*)command
{
    CDVPluginResult* pluginResult = nil;
    
    //get command options
    
    showPrompt = [[command argumentAtIndex:0] boolValue];
    
    if([CLLocationManager locationServicesEnabled] &&
       [CLLocationManager authorizationStatus] != kCLAuthorizationStatusDenied) {
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK];
        
        if(showPrompt) {
            UIAlertController *alertController = [UIAlertController alertControllerWithTitle:NSLocalizedString( @"GPS DISABLED", @"" ) message:NSLocalizedString( @"To Continue Please Enable Your GPS", @"" ) preferredStyle:UIAlertControllerStyleAlert];
            
            UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:NSLocalizedString( @"Cancel", @"" ) style:UIAlertActionStyleCancel handler:nil];
            UIAlertAction *settingsAction = [UIAlertAction actionWithTitle:NSLocalizedString( @"Settings", @"" ) style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
                [[UIApplication sharedApplication] openURL:[NSURL URLWithString:
                                                            UIApplicationOpenSettingsURLString]];
            }];
            
            [alertController addAction:cancelAction];
            [alertController addAction:settingsAction];
            
            [self presentViewController:alertController animated:YES completion:nil];
        }
    } else {
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR];
    }
    
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

@end