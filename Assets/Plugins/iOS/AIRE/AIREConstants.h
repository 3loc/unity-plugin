//
//  AIREConstants.h
//  Copyright (c) 2014 Amplitude Inc. (https://amplitude.com/)
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.
//

#import <Foundation/Foundation.h>

extern NSString *const kAIRELibrary;
extern NSString *const kAIREVersion;
extern NSString *const kAIREUnknownLibrary;
extern NSString *const kAIREUnknownVersion;
extern NSString *const kAIREPlatform;
extern NSString *const kAIREOSName;
extern NSString *const kAIREEventLogDomain;
extern NSString *const kAIREEventLogUrl;
extern NSString *const kAIREDefaultInstance;
extern const int kAIREApiVersion;
extern const int kAIREDBVersion;
extern const int kAIREDBFirstVersion;
extern const int kAIREEventUploadThreshold;
extern const int kAIREEventUploadMaxBatchSize;
extern const int kAIREEventMaxCount;
extern const int kAIREEventRemoveBatchSize;
extern const int kAIREEventUploadPeriodSeconds;
extern const long kAIREMinTimeBetweenSessionsMillis;
extern const int kAIREMaxStringLength;
extern const int kAIREMaxPropertyKeys;

extern NSString *const IDENTIFY_EVENT;
extern NSString *const GROUP_IDENTIFY_EVENT;
extern NSString *const AIRE_OP_ADD;
extern NSString *const AIRE_OP_APPEND;
extern NSString *const AIRE_OP_CLEAR_ALL;
extern NSString *const AIRE_OP_PREPEND;
extern NSString *const AIRE_OP_SET;
extern NSString *const AIRE_OP_SET_ONCE;
extern NSString *const AIRE_OP_UNSET;

// Revenue
extern NSString *const AIRE_REVENUE_PRODUCT_ID;
extern NSString *const AIRE_REVENUE_QUANTITY;
extern NSString *const AIRE_REVENUE_PRICE;
extern NSString *const AIRE_REVENUE_REVENUE_TYPE;
extern NSString *const AIRE_REVENUE_RECEIPT;

// Options
extern NSString *const AIRE_TRACKING_OPTION_CARRIER;
extern NSString *const AIRE_TRACKING_OPTION_CITY;
extern NSString *const AIRE_TRACKING_OPTION_COUNTRY;
extern NSString *const AIRE_TRACKING_OPTION_DEVICE_MANUFACTURER;
extern NSString *const AIRE_TRACKING_OPTION_DEVICE_MODEL;
extern NSString *const AIRE_TRACKING_OPTION_DMA;
extern NSString *const AIRE_TRACKING_OPTION_IDFA;
extern NSString *const AIRE_TRACKING_OPTION_IDFV;
extern NSString *const AIRE_TRACKING_OPTION_IP_ADDRESS;
extern NSString *const AIRE_TRACKING_OPTION_LANGUAGE;
extern NSString *const AIRE_TRACKING_OPTION_LAT_LNG;
extern NSString *const AIRE_TRACKING_OPTION_OS_NAME;
extern NSString *const AIRE_TRACKING_OPTION_OS_VERSION;
extern NSString *const AIRE_TRACKING_OPTION_PLATFORM;
extern NSString *const AIRE_TRACKING_OPTION_REGION;
extern NSString *const AIRE_TRACKING_OPTION_VERSION_NAME;
