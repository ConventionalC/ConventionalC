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
    NSArray *valueClasses = @[NSString.class, NSNumber.class, NSNull.class];
    NSArray* propertyNames = self.propertyNames;
    NSMutableDictionary *result = [NSMutableDictionary dictionaryWithCapacity:propertyNames.count];
    for(NSString* property in propertyNames)
    {
        NSObject* value = [self valueForKey:property];
        if(value)
        {
            if([value isKindOfClass:NSArray.class])
            {
                NSArray* array = (NSArray*)value;
                NSMutableArray* processedArray = [NSMutableArray arrayWithCapacity:array.count];
                for(NSObject* arrayValue in array)
                    if([arrayValue isKindOfClasses:valueClasses])
                        [processedArray addObject:arrayValue];
                    else
                        [processedArray addObject:arrayValue.asDictionary];
                result[property] = processedArray;
            }
            else if([value isKindOfClasses:valueClasses])
                result[property] = value;
            else
                result[property] = value.asDictionary;
        }
    }
    return result;
}

-(BOOL)isKindOfClasses:(NSArray*)classes
{
    for(Class c in classes)
        if([self isKindOfClass:c])
            return YES;
    return NO;
}

@end
