#import "NSArray+rubyish.h"

@implementation NSArray(rubyish)

+(id)newWithSize:(int)size object:(id)o
{
    return [self newWithSize:size block:^id(NSUInteger i){ return o; }];
}

+(id)newWithSize:(int)size block:(IndexReturnBlock)block
{
    NSMutableArray* result = [NSMutableArray arrayWithCapacity:size];
    for(int i=0; i<size; i++)
        [result addObject: block(i)?:NSNull.null];
    return result.copy;
}

-(void)each:(ObjectBlock)b { for(id o in self) b(o); }

-(void)eachIndex:(IndexBlock)block
{
    for(NSUInteger i=0; i<self.count; i++)
        block(i);
}

-(void)eachIndexAndObject:(IndexAndObjectBlock)b
{
    for(int i=0; i<self.count; i++)
        b(i, [self objectAtIndex:i]);
}

-(BOOL)isEmpty { return self.count == 0; }

@end
