#import "AIRECWrapper.h"
#import "AIRE.h"
#import "AIREIdentify.h"
#import "AIRERevenue.h"
#import "AIRETrackingOptions.h"

// Used to allocate a C string on the heap for C#
char* MakeCString(const char* string)
{
    if (string == NULL) {
        return NULL;
    }

    char* result = (char*) malloc(strlen(string) + 1);
    strcpy(result, string);

    return result;
}

// Converts C style string to NSString
NSString* ToNSString(const char* string)
{
    if (string)
        return [NSString stringWithUTF8String: string];
    else
        return nil;
}

// Helper method to safe get boolean from NSDictionary
BOOL safeGetBoolFromDictionary(NSDictionary *dict, NSString *key, BOOL defaultValue) {
    NSNumber *value = [dict objectForKey:key];
    if (value == nil) {
        return defaultValue;
    }
    return [value boolValue];
}

NSDictionary* ToNSDictionary(const char* data)
{
    if (data) {
        NSError *error = nil;
        NSDictionary *result = [NSJSONSerialization JSONObjectWithData:[ToNSString(data) dataUsingEncoding:NSUTF8StringEncoding] options:0 error:&error];

        if (error != nil) {
            NSLog(@"ERROR: Deserialization error:%@", error);
            return nil;
        } else if (![result isKindOfClass:[NSDictionary class]]) {
            NSLog(@"ERROR: invalid type:%@", [result class]);
            return nil;
        } else {
            return result;
        }
    } else {
        return nil;
    }
}

void _AIRE_init(const char* instanceName, const char* apiKey, const char* userId)
{
    if (userId) {
        [[AIRE instanceWithName:ToNSString(instanceName)] initializeApiKey:ToNSString(apiKey)
                                        userId:ToNSString(userId)];
    } else {
        [[AIRE instanceWithName:ToNSString(instanceName)] initializeApiKey:ToNSString(apiKey)];
    }
}

void _AIRE_setTrackingOptions(const char* instanceName, const char* trackingOptionsJson) {
    // convert dictionary of tracking options into AIRETrackingOptions object
    NSDictionary *trackingOptionsDict = ToNSDictionary(trackingOptionsJson);
    AIRETrackingOptions *trackingOptions = [AIRETrackingOptions options];
    if (safeGetBoolFromDictionary(trackingOptionsDict, @"disableCarrier", NO)) {
        [trackingOptions disableCarrier];
    }
    if (safeGetBoolFromDictionary(trackingOptionsDict, @"disableCity", NO)) {
        [trackingOptions disableCity];
    }
    if (safeGetBoolFromDictionary(trackingOptionsDict, @"disableCountry", NO)) {
        [trackingOptions disableCountry];
    }
    if (safeGetBoolFromDictionary(trackingOptionsDict, @"disableDeviceManufacturer", NO)) {
        [trackingOptions disableDeviceManufacturer];
    }
    if (safeGetBoolFromDictionary(trackingOptionsDict, @"disableDeviceModel", NO)) {
        [trackingOptions disableDeviceModel];
    }
    if (safeGetBoolFromDictionary(trackingOptionsDict, @"disableDMA", NO)) {
        [trackingOptions disableDMA];
    }
    if (safeGetBoolFromDictionary(trackingOptionsDict, @"disableIDFA", NO)) {
        [trackingOptions disableIDFA];
    }
    if (safeGetBoolFromDictionary(trackingOptionsDict, @"disableIDFV", NO)) {
        [trackingOptions disableIDFV];
    }
    if (safeGetBoolFromDictionary(trackingOptionsDict, @"disableIPAddress", NO)) {
        [trackingOptions disableIPAddress];
    }
    if (safeGetBoolFromDictionary(trackingOptionsDict, @"disableLanguage", NO)) {
        [trackingOptions disableLanguage];
    }
    if (safeGetBoolFromDictionary(trackingOptionsDict, @"disableLatLng", NO)) {
        [trackingOptions disableLatLng];
    }
    if (safeGetBoolFromDictionary(trackingOptionsDict, @"disableOSName", NO)) {
        [trackingOptions disableOSName];
    }
    if (safeGetBoolFromDictionary(trackingOptionsDict, @"disableOSVersion", NO)) {
        [trackingOptions disableOSVersion];
    }
    if (safeGetBoolFromDictionary(trackingOptionsDict, @"disablePlatform", NO)) {
        [trackingOptions disablePlatform];
    }
    if (safeGetBoolFromDictionary(trackingOptionsDict, @"disableRegion", NO)) {
        [trackingOptions disableRegion];
    }
    if (safeGetBoolFromDictionary(trackingOptionsDict, @"disableVersionName", NO)) {
        [trackingOptions disableVersionName];
    }
    [[AIRE instanceWithName:ToNSString(instanceName)] setTrackingOptions:trackingOptions];
}

void _AIRE_logEvent(const char* instanceName, const char* event, const char* properties)
{
    if (properties) {
        [[AIRE instanceWithName:ToNSString(instanceName)] logEvent:ToNSString(event) withEventProperties:ToNSDictionary(properties)];
    } else {
        [[AIRE instanceWithName:ToNSString(instanceName)] logEvent:ToNSString(event)];
    }
}

void _AIRE_logOutOfSessionEvent(const char* instanceName, const char* event, const char* properties)
{
    if (properties) {
        [[AIRE instanceWithName:ToNSString(instanceName)] logEvent:ToNSString(event) withEventProperties:ToNSDictionary(properties) outOfSession:true];
    } else {
        [[AIRE instanceWithName:ToNSString(instanceName)] logEvent:ToNSString(event) withEventProperties:nil outOfSession:true];
    }
}

void _AIRE_setOffline(const char* instanceName, const bool offline)
{
    [[AIRE instanceWithName:ToNSString(instanceName)] setOffline:offline];
}

void _AIRE_setUserId(const char* instanceName, const char* userId)
{
    [[AIRE instanceWithName:ToNSString(instanceName)] setUserId:ToNSString(userId)];
}

void _AIRE_setUserProperties(const char* instanceName, const char* properties)
{
    [[AIRE instanceWithName:ToNSString(instanceName)] setUserProperties:ToNSDictionary(properties)];
}

void _AIRE_setOptOut(const char* instanceName, const bool enabled)
{
    [[AIRE instanceWithName:ToNSString(instanceName)] setOptOut:enabled];
}

void _AIRE_setMinTimeBetweenSessionsMillis(const char* instanceName, const long long minTimeBetweenSessionsMillis)
{
    [[AIRE instanceWithName:ToNSString(instanceName)] setMinTimeBetweenSessionsMillis:minTimeBetweenSessionsMillis];
}

void _AIRE_setLibraryName(const char* instanceName, const char* libraryName)
{
    [AIRE instanceWithName:ToNSString(instanceName)].libraryName = ToNSString(libraryName);
}

void _AIRE_setLibraryVersion(const char* instanceName, const char* libraryVersion)
{
    [AIRE instanceWithName:ToNSString(instanceName)].libraryVersion = ToNSString(libraryVersion);
}

void _AIRE_setDeviceId(const char* instanceName, const char* deviceId)
{
    [[AIRE instanceWithName:ToNSString(instanceName)] setDeviceId:ToNSString(deviceId)];
}

void _AIRE_enableCoppaControl(const char* instanceName)
{
    [[AIRE instanceWithName:ToNSString(instanceName)] enableCoppaControl];
}

void _AIRE_disableCoppaControl(const char* instanceName)
{
    [[AIRE instanceWithName:ToNSString(instanceName)] disableCoppaControl];
}

void _AIRE_setServerUrl(const char* instanceName, const char* serverUrl)
{
    [[AIRE instanceWithName:ToNSString(instanceName)] setServerUrl:ToNSString(serverUrl)];
}

void _AIRE_logRevenueAmount(const char* instanceName, double amount)
{
    [[AIRE instanceWithName:ToNSString(instanceName)] logRevenue:[NSNumber numberWithDouble:amount]];
}

void _AIRE_logRevenue(const char* instanceName, const char* productIdentifier, int quantity, double price)
{
    [[AIRE instanceWithName:ToNSString(instanceName)] logRevenue:ToNSString(productIdentifier) quantity:quantity price:[NSNumber numberWithDouble:price]];
}

void _AIRE_logRevenueWithReceipt(const char* instanceName, const char* productIdentifier, int quantity, double price, const char* receipt)
{
    NSData *receiptData = [[NSData alloc] initWithBase64EncodedString:ToNSString(receipt) options:0];
    [[AIRE instanceWithName:ToNSString(instanceName)] logRevenue:ToNSString(productIdentifier) quantity:quantity price:[NSNumber numberWithDouble:price] receipt:receiptData];
}

void _AIRE_logRevenueWithReceiptAndProperties(const char* instanceName, const char* productIdentifier, int quantity, double price, const char* receipt, const char* revenueType, const char* properties)
{
    NSData *receiptData = nil;
    AIRERevenue *revenue = [[[AIRERevenue revenue] setQuantity:quantity] setPrice:[NSNumber numberWithDouble:price]];
    if (productIdentifier) {
        [revenue setProductIdentifier:ToNSString(productIdentifier)];
    }
    if (receipt) {
        receiptData = [[NSData alloc] initWithBase64EncodedString:ToNSString(receipt) options:0];
        [revenue setReceipt:receiptData];
    }
    if (revenueType) {
        [revenue setRevenueType:ToNSString(revenueType)];
    }
    if (properties) {
        [revenue setEventProperties:ToNSDictionary(properties)];
    }
    [[AIRE instanceWithName:ToNSString(instanceName)] logRevenueV2:revenue];
}

const char * _AIRE_getDeviceId(const char* instanceName)
{
    return MakeCString([[[AIRE instanceWithName:ToNSString(instanceName)] getDeviceId] UTF8String]);
}

void _AIRE_regenerateDeviceId(const char* instanceName)
{
    [[AIRE instanceWithName:ToNSString(instanceName)] regenerateDeviceId];
}

void _AIRE_useAdvertisingIdForDeviceId(const char* instanceName)
{
    [[AIRE instanceWithName:ToNSString(instanceName)] useAdvertisingIdForDeviceId];
}

void _AIRE_trackingSessionEvents(const char* instanceName, const bool enabled)
{
    [[AIRE instanceWithName:ToNSString(instanceName)] setTrackingSessionEvents:enabled];
}

long long _AIRE_getSessionId(const char* instanceName)
{
    return [[AIRE instanceWithName:ToNSString(instanceName)] getSessionId];
}

void _AIRE_uploadEvents(const char* instanceName)
{
    [[AIRE instanceWithName:ToNSString(instanceName)] uploadEvents];
}

// User Property Operations
void _AIRE_clearUserProperties(const char* instanceName)
{
    [[AIRE instanceWithName:ToNSString(instanceName)] clearUserProperties];
}

void _AIRE_unsetUserProperty(const char* instanceName, const char* property)
{
    AIREIdentify *identify = [[AIREIdentify identify] unset:ToNSString(property)];
    [[AIRE instanceWithName:ToNSString(instanceName)] identify:identify];
}

void _AIRE_setOnceUserPropertyBool(const char* instanceName, const char* property, const bool value)
{
    AIREIdentify *identify = [[AIREIdentify identify] setOnce:ToNSString(property) value:[NSNumber numberWithBool:value]];
    [[AIRE instanceWithName:ToNSString(instanceName)] identify:identify];
}

void _AIRE_setOnceUserPropertyDouble(const char* instanceName, const char* property, const double value)
{
    AIREIdentify *identify = [[AIREIdentify identify] setOnce:ToNSString(property) value:[NSNumber numberWithDouble:value]];
    [[AIRE instanceWithName:ToNSString(instanceName)] identify:identify];
}

void _AIRE_setOnceUserPropertyFloat(const char* instanceName, const char* property, const float value)
{
    AIREIdentify *identify = [[AIREIdentify identify] setOnce:ToNSString(property) value:[NSNumber numberWithFloat:value]];
    [[AIRE instanceWithName:ToNSString(instanceName)] identify:identify];
}

void _AIRE_setOnceUserPropertyInt(const char* instanceName, const char* property, const int value)
{
    AIREIdentify *identify = [[AIREIdentify identify] setOnce:ToNSString(property) value:[NSNumber numberWithInt:value]];
    [[AIRE instanceWithName:ToNSString(instanceName)] identify:identify];
}

void _AIRE_setOnceUserPropertyLong(const char* instanceName, const char* property, const long long value)
{
    AIREIdentify *identify = [[AIREIdentify identify] setOnce:ToNSString(property) value:[NSNumber numberWithLongLong:value]];
    [[AIRE instanceWithName:ToNSString(instanceName)] identify:identify];
}

void _AIRE_setOnceUserPropertyString(const char* instanceName, const char* property, const char* value)
{
    AIREIdentify *identify = [[AIREIdentify identify] setOnce:ToNSString(property) value:ToNSString(value)];
    [[AIRE instanceWithName:ToNSString(instanceName)] identify:identify];
}

void _AIRE_setOnceUserPropertyDict(const char* instanceName, const char* property, const char* values)
{
    AIREIdentify *identify = [[AIREIdentify identify] setOnce:ToNSString(property) value:ToNSDictionary(values)];
    [[AIRE instanceWithName:ToNSString(instanceName)] identify:identify];
}

void _AIRE_setOnceUserPropertyList(const char* instanceName, const char* property, const char* values)
{
    NSDictionary *dict = ToNSDictionary(values);
    if (dict == nil) {
        return;
    }
    AIREIdentify *identify = [[AIREIdentify identify] setOnce:ToNSString(property) value:[dict objectForKey:@"list"]];
    [[AIRE instanceWithName:ToNSString(instanceName)] identify:identify];
}

void _AIRE_setOnceUserPropertyBoolArray(const char* instanceName, const char* property, const bool value[], const int length)
{
    if (length == 0) return;
    NSMutableArray *array = [NSMutableArray arrayWithCapacity:length];
    for (int i = 0; i < length; i++) {
        [array addObject:[NSNumber numberWithBool:value[i]]];
    }
    AIREIdentify *identify = [[AIREIdentify identify] setOnce:ToNSString(property) value:array];
    [[AIRE instanceWithName:ToNSString(instanceName)] identify:identify];
}

void _AIRE_setOnceUserPropertyDoubleArray(const char* instanceName, const char* property, const double value[], const int length)
{
    if (length == 0) return;
    NSMutableArray *array = [NSMutableArray arrayWithCapacity:length];
    for (int i = 0; i < length; i++) {
        [array addObject:[NSNumber numberWithDouble:value[i]]];
    }
    AIREIdentify *identify = [[AIREIdentify identify] setOnce:ToNSString(property) value:array];
    [[AIRE instanceWithName:ToNSString(instanceName)] identify:identify];
}

void _AIRE_setOnceUserPropertyFloatArray(const char* instanceName, const char* property, const float value[], const int length)
{
    if (length == 0) return;
    NSMutableArray *array = [NSMutableArray arrayWithCapacity:length];
    for (int i = 0; i < length; i++) {
        [array addObject:[NSNumber numberWithFloat:value[i]]];
    }
    AIREIdentify *identify = [[AIREIdentify identify] setOnce:ToNSString(property) value:array];
    [[AIRE instanceWithName:ToNSString(instanceName)] identify:identify];
}

void _AIRE_setOnceUserPropertyIntArray(const char* instanceName, const char* property, const int value[], const int length)
{
    if (length == 0) return;
    NSMutableArray *array = [NSMutableArray arrayWithCapacity:length];
    for (int i = 0; i < length; i++) {
        [array addObject:[NSNumber numberWithInt:value[i]]];
    }
    AIREIdentify *identify = [[AIREIdentify identify] setOnce:ToNSString(property) value:array];
    [[AIRE instanceWithName:ToNSString(instanceName)] identify:identify];
}

void _AIRE_setOnceUserPropertyLongArray(const char* instanceName, const char* property, const long long value[], const int length)
{
    if (length == 0) return;
    NSMutableArray *array = [NSMutableArray arrayWithCapacity:length];
    for (int i = 0; i < length; i++) {
        [array addObject:[NSNumber numberWithLongLong:value[i]]];
    }
    AIREIdentify *identify = [[AIREIdentify identify] setOnce:ToNSString(property) value:array];
    [[AIRE instanceWithName:ToNSString(instanceName)] identify:identify];
}

void _AIRE_setOnceUserPropertyStringArray(const char* instanceName, const char* property, const char* value[], const int length)
{
    if (length == 0) return;
    NSMutableArray *array = [NSMutableArray arrayWithCapacity:length];
    for (int i = 0; i < length; i++) {
        [array addObject:ToNSString(value[i])];
    }
    AIREIdentify *identify = [[AIREIdentify identify] setOnce:ToNSString(property) value:array];
    [[AIRE instanceWithName:ToNSString(instanceName)] identify:identify];
}

void _AIRE_setUserPropertyBool(const char* instanceName, const char* property, const bool value)
{
    AIREIdentify *identify = [[AIREIdentify identify] set:ToNSString(property) value:[NSNumber numberWithBool:value]];
    [[AIRE instanceWithName:ToNSString(instanceName)] identify:identify];
}

void _AIRE_setUserPropertyDouble(const char* instanceName, const char* property, const double value)
{
    AIREIdentify *identify = [[AIREIdentify identify] set:ToNSString(property) value:[NSNumber numberWithDouble:value]];
    [[AIRE instanceWithName:ToNSString(instanceName)] identify:identify];
}

void _AIRE_setUserPropertyFloat(const char* instanceName, const char* property, const float value)
{
    AIREIdentify *identify = [[AIREIdentify identify] set:ToNSString(property) value:[NSNumber numberWithFloat:value]];
    [[AIRE instanceWithName:ToNSString(instanceName)] identify:identify];
}

void _AIRE_setUserPropertyInt(const char* instanceName, const char* property, const int value)
{
    AIREIdentify *identify = [[AIREIdentify identify] set:ToNSString(property) value:[NSNumber numberWithInt:value]];
    [[AIRE instanceWithName:ToNSString(instanceName)] identify:identify];
}

void _AIRE_setUserPropertyLong(const char* instanceName, const char* property, const long long value)
{
    AIREIdentify *identify = [[AIREIdentify identify] set:ToNSString(property) value:[NSNumber numberWithLongLong:value]];
    [[AIRE instanceWithName:ToNSString(instanceName)] identify:identify];
}

void _AIRE_setUserPropertyString(const char* instanceName, const char* property, const char* value)
{
    AIREIdentify *identify = [[AIREIdentify identify] set:ToNSString(property) value:ToNSString(value)];
    [[AIRE instanceWithName:ToNSString(instanceName)] identify:identify];
}

void _AIRE_setUserPropertyDict(const char* instanceName, const char* property, const char* values)
{
    AIREIdentify *identify = [[AIREIdentify identify] set:ToNSString(property) value:ToNSDictionary(values)];
    [[AIRE instanceWithName:ToNSString(instanceName)] identify:identify];
}

void _AIRE_setUserPropertyList(const char* instanceName, const char* property, const char* values)
{
    NSDictionary *dict = ToNSDictionary(values);
    if (dict == nil) {
        return;
    }
    AIREIdentify *identify = [[AIREIdentify identify] set:ToNSString(property) value:[dict objectForKey:@"list"]];
    [[AIRE instanceWithName:ToNSString(instanceName)] identify:identify];
}

void _AIRE_setUserPropertyBoolArray(const char* instanceName, const char* property, const bool value[], const int length)
{
    if (length == 0) return;
    NSMutableArray *array = [NSMutableArray arrayWithCapacity:length];
    for (int i = 0; i < length; i++) {
        [array addObject:[NSNumber numberWithBool:value[i]]];
    }
    AIREIdentify *identify = [[AIREIdentify identify] set:ToNSString(property) value:array];
    [[AIRE instanceWithName:ToNSString(instanceName)] identify:identify];
}

void _AIRE_setUserPropertyDoubleArray(const char* instanceName, const char* property, const double value[], const int length)
{
    if (length == 0) return;
    NSMutableArray *array = [NSMutableArray arrayWithCapacity:length];
    for (int i = 0; i < length; i++) {
        [array addObject:[NSNumber numberWithDouble:value[i]]];
    }
    AIREIdentify *identify = [[AIREIdentify identify] set:ToNSString(property) value:array];
    [[AIRE instanceWithName:ToNSString(instanceName)] identify:identify];
}

void _AIRE_setUserPropertyFloatArray(const char* instanceName, const char* property, const float value[], const int length)
{
    if (length == 0) return;
    NSMutableArray *array = [NSMutableArray arrayWithCapacity:length];
    for (int i = 0; i < length; i++) {
        [array addObject:[NSNumber numberWithFloat:value[i]]];
    }
    AIREIdentify *identify = [[AIREIdentify identify] set:ToNSString(property) value:array];
    [[AIRE instanceWithName:ToNSString(instanceName)] identify:identify];
}

void _AIRE_setUserPropertyIntArray(const char* instanceName, const char* property, const int value[], const int length)
{
    if (length == 0) return;
    NSMutableArray *array = [NSMutableArray arrayWithCapacity:length];
    for (int i = 0; i < length; i++) {
        [array addObject:[NSNumber numberWithInt:value[i]]];
    }
    AIREIdentify *identify = [[AIREIdentify identify] set:ToNSString(property) value:array];
    [[AIRE instanceWithName:ToNSString(instanceName)] identify:identify];
}

void _AIRE_setUserPropertyLongArray(const char* instanceName, const char* property, const long long value[], const int length)
{
    if (length == 0) return;
    NSMutableArray *array = [NSMutableArray arrayWithCapacity:length];
    for (int i = 0; i < length; i++) {
        [array addObject:[NSNumber numberWithLongLong:value[i]]];
    }
    AIREIdentify *identify = [[AIREIdentify identify] set:ToNSString(property) value:array];
    [[AIRE instanceWithName:ToNSString(instanceName)] identify:identify];
}

void _AIRE_setUserPropertyStringArray(const char* instanceName, const char* property, const char* value[], const int length)
{
    if (length == 0) return;
    NSMutableArray *array = [NSMutableArray arrayWithCapacity:length];
    for (int i = 0; i < length; i++) {
        [array addObject:ToNSString(value[i])];
    }
    AIREIdentify *identify = [[AIREIdentify identify] set:ToNSString(property) value:array];
    [[AIRE instanceWithName:ToNSString(instanceName)] identify:identify];
}

void _AIRE_addUserPropertyDouble(const char* instanceName, const char* property, const double value)
{
    AIREIdentify *identify = [[AIREIdentify identify] add:ToNSString(property) value:[NSNumber numberWithDouble:value]];
    [[AIRE instanceWithName:ToNSString(instanceName)] identify:identify];
}

void _AIRE_addUserPropertyFloat(const char* instanceName, const char* property, const float value)
{
    AIREIdentify *identify = [[AIREIdentify identify] add:ToNSString(property) value:[NSNumber numberWithFloat:value]];
    [[AIRE instanceWithName:ToNSString(instanceName)] identify:identify];
}

void _AIRE_addUserPropertyInt(const char* instanceName, const char* property, const int value)
{
    AIREIdentify *identify = [[AIREIdentify identify] add:ToNSString(property) value:[NSNumber numberWithInt:value]];
    [[AIRE instanceWithName:ToNSString(instanceName)] identify:identify];
}

void _AIRE_addUserPropertyLong(const char* instanceName, const char* property, const long long value)
{
    AIREIdentify *identify = [[AIREIdentify identify] add:ToNSString(property) value:[NSNumber numberWithLongLong:value]];
    [[AIRE instanceWithName:ToNSString(instanceName)] identify:identify];
}

void _AIRE_addUserPropertyString(const char* instanceName, const char* property, const char* value)
{
    AIREIdentify *identify = [[AIREIdentify identify] add:ToNSString(property) value:ToNSString(value)];
    [[AIRE instanceWithName:ToNSString(instanceName)] identify:identify];
}

void _AIRE_addUserPropertyDict(const char* instanceName, const char* property, const char* values)
{
    AIREIdentify *identify = [[AIREIdentify identify] add:ToNSString(property) value:ToNSDictionary(values)];
    [[AIRE instanceWithName:ToNSString(instanceName)] identify:identify];
}

void _AIRE_appendUserPropertyBool(const char* instanceName, const char* property, const bool value)
{
    AIREIdentify *identify = [[AIREIdentify identify] append:ToNSString(property) value:[NSNumber numberWithBool:value]];
    [[AIRE instanceWithName:ToNSString(instanceName)] identify:identify];
}

void _AIRE_appendUserPropertyDouble(const char* instanceName, const char* property, const double value)
{
    AIREIdentify *identify = [[AIREIdentify identify] append:ToNSString(property) value:[NSNumber numberWithDouble:value]];
    [[AIRE instanceWithName:ToNSString(instanceName)] identify:identify];
}

void _AIRE_appendUserPropertyFloat(const char* instanceName, const char* property, const float value)
{
    AIREIdentify *identify = [[AIREIdentify identify] append:ToNSString(property) value:[NSNumber numberWithFloat:value]];
    [[AIRE instanceWithName:ToNSString(instanceName)] identify:identify];
}

void _AIRE_appendUserPropertyInt(const char* instanceName, const char* property, const int value)
{
    AIREIdentify *identify = [[AIREIdentify identify] append:ToNSString(property) value:[NSNumber numberWithInt:value]];
    [[AIRE instanceWithName:ToNSString(instanceName)] identify:identify];
}

void _AIRE_appendUserPropertyLong(const char* instanceName, const char* property, const long long value)
{
    AIREIdentify *identify = [[AIREIdentify identify] append:ToNSString(property) value:[NSNumber numberWithLongLong:value]];
    [[AIRE instanceWithName:ToNSString(instanceName)] identify:identify];
}

void _AIRE_appendUserPropertyString(const char* instanceName, const char* property, const char* value)
{
    AIREIdentify *identify = [[AIREIdentify identify] append:ToNSString(property) value:ToNSString(value)];
    [[AIRE instanceWithName:ToNSString(instanceName)] identify:identify];
}

void _AIRE_appendUserPropertyDict(const char* instanceName, const char* property, const char* values)
{
    AIREIdentify *identify = [[AIREIdentify identify] append:ToNSString(property) value:ToNSDictionary(values)];
    [[AIRE instanceWithName:ToNSString(instanceName)] identify:identify];
}

void _AIRE_appendUserPropertyList(const char* instanceName, const char* property, const char* values)
{
    NSDictionary *dict = ToNSDictionary(values);
    if (dict == nil) {
        return;
    }
    AIREIdentify *identify = [[AIREIdentify identify] append:ToNSString(property) value:[dict objectForKey:@"list"]];
    [[AIRE instanceWithName:ToNSString(instanceName)] identify:identify];
}

void _AIRE_appendUserPropertyBoolArray(const char* instanceName, const char* property, const bool value[], const int length)
{
    if (length == 0) return;
    NSMutableArray *array = [NSMutableArray arrayWithCapacity:length];
    for (int i = 0; i < length; i++) {
        [array addObject:[NSNumber numberWithBool:value[i]]];
    }
    AIREIdentify *identify = [[AIREIdentify identify] append:ToNSString(property) value:array];
    [[AIRE instanceWithName:ToNSString(instanceName)] identify:identify];
}

void _AIRE_appendUserPropertyDoubleArray(const char* instanceName, const char* property, const double value[], const int length)
{
    if (length == 0) return;
    NSMutableArray *array = [NSMutableArray arrayWithCapacity:length];
    for (int i = 0; i < length; i++) {
        [array addObject:[NSNumber numberWithDouble:value[i]]];
    }
    AIREIdentify *identify = [[AIREIdentify identify] append:ToNSString(property) value:array];
    [[AIRE instanceWithName:ToNSString(instanceName)] identify:identify];
}

void _AIRE_appendUserPropertyFloatArray(const char* instanceName, const char* property, const float value[], const int length)
{
    if (length == 0) return;
    NSMutableArray *array = [NSMutableArray arrayWithCapacity:length];
    for (int i = 0; i < length; i++) {
        [array addObject:[NSNumber numberWithFloat:value[i]]];
    }
    AIREIdentify *identify = [[AIREIdentify identify] append:ToNSString(property) value:array];
    [[AIRE instanceWithName:ToNSString(instanceName)] identify:identify];
}

void _AIRE_appendUserPropertyIntArray(const char* instanceName, const char* property, const int value[], const int length)
{
    if (length == 0) return;
    NSMutableArray *array = [NSMutableArray arrayWithCapacity:length];
    for (int i = 0; i < length; i++) {
        [array addObject:[NSNumber numberWithInt:value[i]]];
    }
    AIREIdentify *identify = [[AIREIdentify identify] append:ToNSString(property) value:array];
    [[AIRE instanceWithName:ToNSString(instanceName)] identify:identify];
}

void _AIRE_appendUserPropertyLongArray(const char* instanceName, const char* property, const long long value[], const int length)
{
    if (length == 0) return;
    NSMutableArray *array = [NSMutableArray arrayWithCapacity:length];
    for (int i = 0; i < length; i++) {
        [array addObject:[NSNumber numberWithLongLong:value[i]]];
    }
    AIREIdentify *identify = [[AIREIdentify identify] append:ToNSString(property) value:array];
    [[AIRE instanceWithName:ToNSString(instanceName)] identify:identify];
}

void _AIRE_appendUserPropertyStringArray(const char* instanceName, const char* property, const char* value[], const int length)
{
    if (length == 0) return;
    NSMutableArray *array = [NSMutableArray arrayWithCapacity:length];
    for (int i = 0; i < length; i++) {
        [array addObject:ToNSString(value[i])];
    }
    AIREIdentify *identify = [[AIREIdentify identify] append:ToNSString(property) value:array];
    [[AIRE instanceWithName:ToNSString(instanceName)] identify:identify];
}
