KSLogger
========

Basic preprocessor-controlled logging for C and Objective-C.

KSLogger prints log entries to the console consisting of:

* Level (Error, Warn, Info, Debug, Trace)
* File
* Line
* Function
* Message

You can set the minimum logging level in the preprocessor and at the file level.


Usage
=====

Optional:
--------

Set the minimum log level by setting **KSLogger_Level** in your
**Preprocessor Macros** build setting.
You may choose **TRACE, DEBUG, INFO, WARN, ERROR**. If nothing is set, it
defaults to **INFO**.

    KSLogger_Level=WARN

Anything below that log level will not be printed
(except in local logging - see below).


1: Include the correct header file, one of:
------------------------------------------

    #include "KSLoggerC.h"

OR

    #import "KSLoggerObjC.h"


2: Call the logger functions from your code:
-------------------------------------------

Code:

    KSLOG_ERROR(@"Some error message");

Prints:

    2011-09-25 05:41:01.379 TestApp[4439:f803] ERROR: SomeClass.m (21): -[SomeFunction]: Some error message 


Code:

    KSLOG_INFO(@"Info about %@", someObject);

Prints:

    2011-09-25 05:44:05.239 TestApp[4473:f803] INFO : SomeClass.m (20): -[SomeFunction]: Info about <NSObject: 0xb622840>


The "BASIC" versions of the macros behave exactly like NSLog, except they
respect the KSLogger_Level setting.


Local Logging
=============

You can control logging messages at the local file level using the
**KSLogger\_LocalLevel** define. Note that it must be defined _BEFORE_ including
**KSLoggerC.h** or **KSLoggerObjC.h**

The **KSLOG\_XX()** and **KSLOGBASIC\_XX()** macros will print out based on the
_LOWER_ of **KSLogger\_Level** and **KSLogger\_LocalLevel**. So if
**KSLogger\_Level** is **DEBUG** and **KSLogger\_LocalLevel** is **TRACE**, it
will print all the way down to the trace level for that file, and to the debug
level everywhere else.

### Example:

    // KSLogger_LocalLevel, if defined, MUST be defined BEFORE including KSLoggerXX.h
    #define KSLogger_LocalLevel TRACE
    #import "KSLoggerObjC.h"


Important Notes
===============

The C logger is async-safe, but is limited in how big of a log message it can
print. By default it is 1024 bytes, but the preprocessor define
**KSLogger_CBufferSize** can set the size (only during compilation of KSLogger).


Examples
========

See the example program **LoggingTest** included in the project for example
usage. Objective-C logging is demonstrated in **AppDelegate.m** and C logging
is demonstrated in **ViewController.m**. Preprocessor defines are set in the
**Preprocessor Macros** build setting (currently set to **DEBUG**).

The example app also demonstrates local logging in **ViewController.m**, where
the local log level is set to **TRACE**.
