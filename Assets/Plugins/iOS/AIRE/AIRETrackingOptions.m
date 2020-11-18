//
//  AIRETrackingOptions.m
//  Copyright (c) 2018 Amplitude Inc. (https://amplitude.com/)
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

#ifndef AIRE_DEBUG
#define AIRE_DEBUG 0
#endif

#ifndef AIRE_LOG
#if AIRE_DEBUG
#   define AIRE_LOG(fmt, ...) NSLog(fmt, ##__VA_ARGS__)
#else
#   define AIRE_LOG(...)
#endif
#endif

#import "AIRETrackingOptions.h"
#import "AIREConstants.h"

@interface AIRETrackingOptions()

@property (nonatomic, strong, readwrite) NSMutableSet *disabledFields;

@end

@implementation AIRETrackingOptions

- (instancetype)init {
    if ((self = [super init])) {
        self.disabledFields = [[NSMutableSet alloc] init];
    }
    return self;
}

+ (instancetype)options {
    return [[self alloc] init];
}

- (AIRETrackingOptions*)disableCarrier {
    [self disableTrackingField:AIRE_TRACKING_OPTION_CARRIER];
    return self;
}

- (BOOL)shouldTrackCarrier {
    return [self shouldTrackField:AIRE_TRACKING_OPTION_CARRIER];
}

- (AIRETrackingOptions*)disableCity {
    [self disableTrackingField:AIRE_TRACKING_OPTION_CITY];
    return self;
}

- (BOOL)shouldTrackCity {
    return [self shouldTrackField:AIRE_TRACKING_OPTION_CITY];
}

- (AIRETrackingOptions*)disableCountry {
    [self disableTrackingField:AIRE_TRACKING_OPTION_COUNTRY];
    return self;
}

- (BOOL)shouldTrackCountry {
    return [self shouldTrackField:AIRE_TRACKING_OPTION_COUNTRY];
}

- (AIRETrackingOptions*)disableDeviceManufacturer {
    [self disableTrackingField:AIRE_TRACKING_OPTION_DEVICE_MANUFACTURER];
    return self;
}

- (BOOL)shouldTrackDeviceManufacturer {
    return [self shouldTrackField:AIRE_TRACKING_OPTION_DEVICE_MANUFACTURER];
}

- (AIRETrackingOptions*)disableDeviceModel {
    [self disableTrackingField:AIRE_TRACKING_OPTION_DEVICE_MODEL];
    return self;
}

- (BOOL)shouldTrackDeviceModel {
    return [self shouldTrackField:AIRE_TRACKING_OPTION_DEVICE_MODEL];
}

- (AIRETrackingOptions*)disableDMA {
    [self disableTrackingField:AIRE_TRACKING_OPTION_DMA];
    return self;
}

- (BOOL)shouldTrackDMA {
    return [self shouldTrackField:AIRE_TRACKING_OPTION_DMA];
}

- (AIRETrackingOptions*)disableIDFA {
    [self disableTrackingField:AIRE_TRACKING_OPTION_IDFA];
    return self;
}

- (BOOL)shouldTrackIDFA {
    return [self shouldTrackField:AIRE_TRACKING_OPTION_IDFA];
}

- (AIRETrackingOptions*)disableIDFV
{
    [self disableTrackingField:AIRE_TRACKING_OPTION_IDFV];
    return self;
}

- (BOOL)shouldTrackIDFV {
    return [self shouldTrackField:AIRE_TRACKING_OPTION_IDFV];
}

- (AIRETrackingOptions*)disableIPAddress {
    [self disableTrackingField:AIRE_TRACKING_OPTION_IP_ADDRESS];
    return self;
}

- (BOOL)shouldTrackIPAddress {
    return [self shouldTrackField:AIRE_TRACKING_OPTION_IP_ADDRESS];
}

- (AIRETrackingOptions*)disableLanguage
{
    [self disableTrackingField:AIRE_TRACKING_OPTION_LANGUAGE];
    return self;
}

- (BOOL)shouldTrackLanguage {
    return [self shouldTrackField:AIRE_TRACKING_OPTION_LANGUAGE];
}

- (AIRETrackingOptions*)disableLatLng {
    [self disableTrackingField:AIRE_TRACKING_OPTION_LAT_LNG];
    return self;
}

- (BOOL)shouldTrackLatLng {
    return [self shouldTrackField:AIRE_TRACKING_OPTION_LAT_LNG];
}

- (AIRETrackingOptions*)disableOSName {
    [self disableTrackingField:AIRE_TRACKING_OPTION_OS_NAME];
    return self;
}

- (BOOL)shouldTrackOSName {
    return [self shouldTrackField:AIRE_TRACKING_OPTION_OS_NAME];
}

- (AIRETrackingOptions*)disableOSVersion {
    [self disableTrackingField:AIRE_TRACKING_OPTION_OS_VERSION];
    return self;
}

- (BOOL)shouldTrackOSVersion {
    return [self shouldTrackField:AIRE_TRACKING_OPTION_OS_VERSION];
}

- (AIRETrackingOptions*)disablePlatform {
    [self disableTrackingField:AIRE_TRACKING_OPTION_PLATFORM];
    return self;
}

- (BOOL)shouldTrackPlatform {
    return [self shouldTrackField:AIRE_TRACKING_OPTION_PLATFORM];
}

- (AIRETrackingOptions*)disableRegion {
    [self disableTrackingField:AIRE_TRACKING_OPTION_REGION];
    return self;
}

- (BOOL)shouldTrackRegion {
    return [self shouldTrackField:AIRE_TRACKING_OPTION_REGION];
}

- (AIRETrackingOptions*)disableVersionName {
    [self disableTrackingField:AIRE_TRACKING_OPTION_VERSION_NAME];
    return self;
}

- (BOOL)shouldTrackVersionName {
    return [self shouldTrackField:AIRE_TRACKING_OPTION_VERSION_NAME];
}

- (void) disableTrackingField:(NSString*)field {
    [self.disabledFields addObject:field];
}

- (BOOL) shouldTrackField:(NSString*)field {
    return ![self.disabledFields containsObject:field];
}

- (NSMutableDictionary*) getApiPropertiesTrackingOption {
    NSMutableDictionary *apiPropertiesTrackingOptions = [[NSMutableDictionary alloc] init];
    if (self.disabledFields.count == 0) {
        return apiPropertiesTrackingOptions;
    }
    
    NSArray *serverSideOptions =  @[AIRE_TRACKING_OPTION_CITY,
                                    AIRE_TRACKING_OPTION_COUNTRY,
                                    AIRE_TRACKING_OPTION_DMA,
                                    AIRE_TRACKING_OPTION_IP_ADDRESS,
                                    AIRE_TRACKING_OPTION_LAT_LNG,
                                    AIRE_TRACKING_OPTION_REGION];

    for (id key in serverSideOptions) {
        if ([self.disabledFields containsObject:key]) {
            [apiPropertiesTrackingOptions setObject:[NSNumber numberWithBool:NO] forKey:key];
        }
    }

    return apiPropertiesTrackingOptions;
}

- (AIRETrackingOptions *)mergeIn: (AIRETrackingOptions *)other {
    for (NSString *field in other.disabledFields) {
        [self disableTrackingField:field];
    }
    
    return self;
}

+ (AIRETrackingOptions *)forCoppaControl {
    NSArray *coppaControlOptions = @[AIRE_TRACKING_OPTION_IDFA,
                                     AIRE_TRACKING_OPTION_IDFV,
                                     AIRE_TRACKING_OPTION_CITY,
                                     AIRE_TRACKING_OPTION_IP_ADDRESS,
                                     AIRE_TRACKING_OPTION_LAT_LNG];
    
    AIRETrackingOptions *options = [[AIRETrackingOptions alloc] init];
    for (NSString *field in coppaControlOptions) {
        [options disableTrackingField:field];
    }
    return options;
}

+ (AIRETrackingOptions *)copyOf: (AIRETrackingOptions *)origin {
    AIRETrackingOptions *options = [[AIRETrackingOptions alloc] init];
    for (NSString *field in origin.disabledFields) {
        [options disableTrackingField:field];
    }
    
    return options;
}

@end
