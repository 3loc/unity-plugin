//
//  AIRERevenue.m
//  Copyright (c) 2016 Amplitude Inc. (https://amplitude.com/)
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

#import "AIRERevenue.h"
#import "AIREConstants.h"
#import "AIREUtils.h"

@interface AIRERevenue()

@end

@implementation AIRERevenue{}

- (instancetype)init {
    if ((self = [super init])) {
        _quantity = 1;
    }
    return self;
}

/*
 * Create an AIRERevenue object
 */
+ (instancetype)revenue {
    return [[self alloc] init];
}

- (BOOL)isValidRevenue {
    if (_price == nil) {
        AIRE_LOG(@"Invalid revenue, need to set price field");
        return NO;
    }
    return YES;
}

- (AIRERevenue*)setProductIdentifier:(NSString *) productIdentifier {
    if ([AIREUtils isEmptyString:productIdentifier]) {
        AIRE_LOG(@"Invalid empty productIdentifier");
        return self;
    }

    _productId = productIdentifier;
    return self;
}

- (AIRERevenue*)setQuantity:(NSInteger)quantity {
    _quantity = quantity;
    return self;
}

- (AIRERevenue*)setPrice:(NSNumber *)price {
    _price = price;
    return self;
}

- (AIRERevenue*)setRevenueType:(NSString*)revenueType {
    _revenueType = revenueType;
    return self;
}

- (AIRERevenue*)setReceipt:(NSData*)receipt {
    _receipt = receipt;
    return self;
}

- (AIRERevenue*)setEventProperties:(NSDictionary*)eventProperties {
    eventProperties = [eventProperties copy];
    _properties = eventProperties;
    return self;
}

- (NSDictionary*)toNSDictionary {
    NSMutableDictionary *dict;
    if (_properties == nil) {
        dict = [[NSMutableDictionary alloc] init];
    } else {
        dict = [_properties mutableCopy];
    }

    [dict setValue:_productId forKey:AIRE_REVENUE_PRODUCT_ID];
    [dict setValue:[NSNumber numberWithInteger:_quantity] forKey:AIRE_REVENUE_QUANTITY];
    [dict setValue:_price forKey:AIRE_REVENUE_PRICE];
    [dict setValue:_revenueType forKey:AIRE_REVENUE_REVENUE_TYPE];

    if ([_receipt respondsToSelector:@selector(base64EncodedStringWithOptions:)]) {
        [dict setValue:[_receipt base64EncodedStringWithOptions:0] forKey:AIRE_REVENUE_RECEIPT];
    } else {
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated"
        [dict setValue:[_receipt base64Encoding] forKey:AIRE_REVENUE_RECEIPT];
#pragma clang diagnostic pop
    }

    return dict;
}

@end
