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

@end
