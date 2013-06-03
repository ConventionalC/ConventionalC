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

-(id)asDictionaryWithReferenced:(NSMutableSet*)referenced
{
    // prevent circular references
    if([referenced containsObject:self])
        return NSNull.null;
    [referenced addObject:self];
    
    NSArray *valueClasses = @[NSString.class, NSNumber.class, NSNull.class];
    NSArray* propertyNames = self.propertyNames;
    NSMutableDictionary *result = [NSMutableDictionary dictionaryWithCapacity:propertyNames.count];
    for(NSString* property in propertyNames)
    {
        NSObject* value = [self valueForKey:property];
        if(value)
        {
            if([value conformsToProtocol:@protocol(NSFastEnumeration)])
            {
                id<NSFastEnumeration> collection = (id<NSFastEnumeration>)value;
                NSMutableArray* processedArray = NSMutableArray.new;
                for(NSObject* arrayValue in collection)
                    if([arrayValue isKindOfClasses:valueClasses])
                        [processedArray addObject:arrayValue];
                    else
                        [processedArray addObject:[arrayValue asDictionaryWithReferenced:referenced]];
                result[property] = processedArray;
            }
            else if([value isKindOfClasses:valueClasses])
                result[property] = value;
            else
                result[property] = [value asDictionaryWithReferenced:referenced];
        }
    }
    return result;
}

-(NSDictionary*)asDictionary
{
    return [self asDictionaryWithReferenced:NSMutableSet.new];
}

-(BOOL)isKindOfClasses:(NSArray*)classes
{
    for(Class c in classes)
        if([self isKindOfClass:c])
            return YES;
    return NO;
}

@end
