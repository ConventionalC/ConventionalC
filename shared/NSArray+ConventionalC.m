#import "NSArray+ConventionalC.h"

@implementation NSArray(ConventionalC)

-(NSArray*)arrayByRemovingLastObject
{
    return [self subarrayWithRange:NSMakeRange(0, self.count-1)];
}

-(NSArray*)arrayByRemovingObject:(id)anObject
{
    NSMutableArray *a = self.mutableCopy;
    [a removeObject:anObject];
    return a.copy;
}

-(NSArray*)subarrayFrom:(NSUInteger)from length:(NSUInteger)length
{
    return [self subarrayWithRange:NSMakeRange(from, length)];
}

-(NSArray*)subarrayFrom:(NSUInteger)from
{
    return [self subarrayWithRange:NSMakeRange(from, self.length - from)];
}

-(NSArray*)subarrayTo:(NSUInteger)to
{
    return [self subarrayFrom:0 length:to+1];
}

@end
