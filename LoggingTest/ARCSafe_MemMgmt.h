//
//  ARCSafe_MemMgmt.h
//
//  Created by Karl Stenerud on 11-10-01.
//
//  Copyright (c) 2011 Karl Stenerud. All rights reserved.
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall remain in place
// in this source code.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.

#ifndef HDR_ARCSafe_MemMgmt_h
#define HDR_ARCSafe_MemMgmt_h


/** Memory management macros that work with or without automatic reference
 * counting enabled:
 *
 * - as_retain(id object): Retain an object. Returns the retained object.
 *
 * - as_release(id object): Release an object.
 *
 * - as_autorelease(id object): Autorelease an object. Returns the object.
 *
 * - as_superdealloc(): Call [super dealloc]. Use at the end of a dealloc method.
 */
#if __has_feature(objc_arc)
    #define as_retain(X) (X)
    #define as_release(X)
    #define as_autorelease(X) (X)
    #define as_superdealloc()
#else
    #define as_retain(X) [(X) retain]
    #define as_release(X) [(X) release]
    #define as_autorelease(X) [(X) autorelease]
    #define as_superdealloc() [super dealloc]
#endif


#endif // HDR_ARCSafe_MemMgmt_h
