//
//  AppDelegate.m
//  LoggingTest
//

#import "AppDelegate.h"
#import "ViewController.h"

#import "ARCSafe_MemMgmt.h"

// Using the Objective-C logger.
#import <KSLogger/KSLoggerObjC.h>


@implementation AppDelegate

@synthesize window = _window;
@synthesize viewController = _viewController;

- (void)dealloc
{
    as_release(_window);
    as_release(_viewController);
    as_superdealloc();
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Define KSLogger_Level to one of (TRACE,DEBUG,INFO,WARN,ERROR) in the
    // "Preprocessor Macros" build setting to set the minimum log level.
    // By default, only INFO and above will display.
    KSLOG_ERROR(@"Error message for app %@", application);
    KSLOG_WARN(@"Warning message");
    KSLOG_INFO(@"Info message");
    KSLOG_DEBUG(@"Debug message");
    KSLOG_TRACE(@"Trace message");
    
    KSLOGBASIC_ERROR(@"Basic error message");
    KSLOGBASIC_WARN(@"Basic warning message");
    KSLOGBASIC_INFO(@"Basic info message");
    KSLOGBASIC_DEBUG(@"Basic debug message");
    KSLOGBASIC_TRACE(@"Basic trace message");
    
    
#pragma unused(launchOptions)
    self.window = as_autorelease([[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]]);
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        self.viewController = as_autorelease([[ViewController alloc] initWithNibName:@"ViewController_iPhone" bundle:nil]);
    } else {
        self.viewController = as_autorelease([[ViewController alloc] initWithNibName:@"ViewController_iPad" bundle:nil]);
    }
    self.window.rootViewController = self.viewController;
    [self.window makeKeyAndVisible];
    return YES;
}
@end
