//
//  ViewController.m
//  LoggingTest
//

#import "ViewController.h"

// Using the C logger.
// KSLogger_LocalLevel, if defined, MUST be defined BEFORE including KSLoggerXX.h
#define KSLogger_LocalLevel TRACE
#include <KSLogger/KSLoggerC.h>


@implementation ViewController

- (void)viewDidLoad
{
    // Define KSLogger_Level to one of (TRACE,DEBUG,INFO,WARN,ERROR) in the
    // "Preprocessor Macros" build setting to set the minimum log level.
    // By default, only INFO and above will display.
    KSLOG_ERROR("Error message with value %d", 100);
    KSLOG_WARN("Warning message");
    KSLOG_INFO("Info message");
    KSLOG_DEBUG("Debug message");
    KSLOG_TRACE("Trace message");
    
    KSLOGBASIC_ERROR("Basic error message");
    KSLOGBASIC_WARN("Basic warning message");
    KSLOGBASIC_INFO("Basic info message");
    KSLOGBASIC_DEBUG("Basic debug message");
    KSLOGBASIC_TRACE("Basic trace message");
    
    
    [super viewDidLoad];
}

@end
