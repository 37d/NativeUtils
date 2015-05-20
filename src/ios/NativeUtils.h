#import <Cordova/CDV.h>

@interface NativeUtils: CDVPlugin
- (void)checkGPSState:(CDVInvokedUrlCommand*)command;
@end