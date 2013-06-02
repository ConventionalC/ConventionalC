#import "NSObject+ConventionalC.h"
#import <objc/runtime.h>
@implementation NSObject (ConventionalC)

-(NSArray*)propertyNames
{
    unsigned int count, i;
    objc_property_t *properties = class_copyPropertyList([self class], &count);
    NSMutableArray *result = [NSMutableArray arrayWithCapacity:count];
    for (i = 0; i < count; i++)
        [result addObject:[NSString stringWithUTF8String:property_getName(properties[i])]];
    free(properties);
    return result.copy;
}

-(NSDictionary*)asDictionary
{
    NSArray* propertyNames = self.propertyNames;
    NSMutableDictionary *result = [NSMutableDictionary dictionaryWithCapacity:propertyNames.count];
    for(NSString* property in propertyNames)
        result[property] = [self valueForKey:property];
    return result;
}

@end
