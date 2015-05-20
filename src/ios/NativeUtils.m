//
//  NativeUtils.m
//
//
//  Created by Paul Michael Wisdom on 5/20/15.
//
//

#import "NativeUtils.h"


@implementation NativeUtils

BOOL showPrompt;

- (void)pluginInitialize {
    showPrompt = NO;
}

- (void)checkGPSState:(CDVInvokedUrlCommand*)command
{
    CDVPluginResult* pluginResult = nil;
    
    //get command options
    NSLog(@"GETTING GPS STATE");
    showPrompt = [[command argumentAtIndex:0] boolValue];
    
    if([CLLocationManager locationServicesEnabled] &&
       [CLLocationManager authorizationStatus] != kCLAuthorizationStatusDenied) {
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK];
        
        if(showPrompt) {
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"GPS Disabled!"
                                                            message:@"Please Enable Your GPS To Continue"
                                                           delegate:self
                                                  cancelButtonTitle:@"Settings"
                                                  otherButtonTitles:nil];
            
            [alert show];
        }
    } else {
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR];
    }
    
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    [alertView dismissWithClickedButtonIndex:buttonIndex animated:YES];
    [[UIApplication sharedApplication] openURL: [NSURL URLWithString: UIApplicationOpenSettingsURLString]];
}

@end