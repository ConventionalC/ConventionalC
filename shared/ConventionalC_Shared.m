#import "ConventionalC_Shared.h"
#import <objc/runtime.h>

@implementation ConventionalC

+(NSString*)typeNameStringForProperty:(NSString*)propertyName inClass:(Class)c
{
    objc_property_t property = class_getProperty(c, propertyName.UTF8String);
    return property ? @(property_getAttributes(property)) : nil;
}

@end
