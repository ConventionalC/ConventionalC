#import "NSArray+ConventionalC.h"

@implementation NSArray(ConventionalC)

-(id)first
{
    return self.count ? self[0] : nil;
}

-(id)last
{
    return self.lastObject;
}

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
