//
//  AIREConstants.m
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

#import "AIREConstants.h"

NSString *const kAIRELibrary = @"aire-ios";
NSString *const kAIREVersion = @"5.1.0";
NSString *const kAIREUnknownLibrary = @"unknown-library";
NSString *const kAIREUnknownVersion = @"unknown-version";
NSString *const kAIREEventLogDomain = @"2ceg9ozg2i.execute-api.eu-west-1.amazonaws.com";
NSString *const kAIREEventLogUrl = @"https://2ceg9ozg2i.execute-api.eu-west-1.amazonaws.com/Prod/ingestion/aire-sdk";
NSString *const kAIREDefaultInstance = @"$default_instance";
const int kAIREApiVersion = 3;
const int kAIREDBVersion = 3;
const int kAIREDBFirstVersion = 2; // to detect if DB exists yet

#if TARGET_OS_OSX
    const int kAIREEventUploadThreshold = 30;
    const int kAIREEventMaxCount = 1000;
    NSString *const kAIREPlatform = @"macOS";
    NSString *const kAIREOSName = @"macos";
#elif TARGET_OS_TV // For tvOS, upload events immediately, don't save too many events locally.
    const int kAIREEventUploadThreshold = 1;
    const int kAIREEventMaxCount = 100;
    NSString *const kAIREPlatform = @"tvOS";
    NSString *const kAIREOSName = @"tvos";
#elif TARGET_OS_MACCATALYST // This is when iPad app runs on mac.
    const int kAIREEventUploadThreshold = 30;
    const int kAIREEventMaxCount = 1000;
    NSString *const kAIREPlatform = @"macOS";
    NSString *const kAIREOSName = @"macos";
#else // iOS, simulator, etc.
    const int kAIREEventUploadThreshold = 30;
    const int kAIREEventMaxCount = 1000;
    NSString *const kAIREPlatform = @"iOS";
    NSString *const kAIREOSName = @"ios";
#endif

const int kAIREEventUploadMaxBatchSize = 100;
const int kAIREEventRemoveBatchSize = 20;
const int kAIREEventUploadPeriodSeconds = 30; // 30 seconds
const long kAIREMinTimeBetweenSessionsMillis = 5 * 60 * 1000; // 5 minutes
const int kAIREMaxStringLength = 1024;
const int kAIREMaxPropertyKeys = 1000;

NSString *const IDENTIFY_EVENT = @"$identify";
NSString *const GROUP_IDENTIFY_EVENT = @"$groupidentify";
NSString *const AIRE_OP_ADD = @"$add";
NSString *const AIRE_OP_APPEND = @"$append";
NSString *const AIRE_OP_CLEAR_ALL = @"$clearAll";
NSString *const AIRE_OP_PREPEND = @"$prepend";
NSString *const AIRE_OP_SET = @"$set";
NSString *const AIRE_OP_SET_ONCE = @"$setOnce";
NSString *const AIRE_OP_UNSET = @"$unset";

NSString *const AIRE_REVENUE_PRODUCT_ID = @"$productId";
NSString *const AIRE_REVENUE_QUANTITY = @"$quantity";
NSString *const AIRE_REVENUE_PRICE = @"$price";
NSString *const AIRE_REVENUE_REVENUE_TYPE = @"$revenueType";
NSString *const AIRE_REVENUE_RECEIPT = @"$receipt";

NSString *const AIRE_TRACKING_OPTION_CARRIER = @"carrier";
NSString *const AIRE_TRACKING_OPTION_CITY = @"city";
NSString *const AIRE_TRACKING_OPTION_COUNTRY = @"country";
NSString *const AIRE_TRACKING_OPTION_DEVICE_MANUFACTURER = @"device_manufacturer";
NSString *const AIRE_TRACKING_OPTION_DEVICE_MODEL = @"device_model";
NSString *const AIRE_TRACKING_OPTION_DMA = @"dma";
NSString *const AIRE_TRACKING_OPTION_IDFA = @"idfa";
NSString *const AIRE_TRACKING_OPTION_IDFV = @"idfv";
NSString *const AIRE_TRACKING_OPTION_IP_ADDRESS = @"ip_address";
NSString *const AIRE_TRACKING_OPTION_LANGUAGE = @"language";
NSString *const AIRE_TRACKING_OPTION_LAT_LNG = @"lat_lng";
NSString *const AIRE_TRACKING_OPTION_OS_NAME = @"os_name";
NSString *const AIRE_TRACKING_OPTION_OS_VERSION = @"os_version";
NSString *const AIRE_TRACKING_OPTION_PLATFORM = @"platform";
NSString *const AIRE_TRACKING_OPTION_REGION = @"region";
NSString *const AIRE_TRACKING_OPTION_VERSION_NAME = @"version_name";
