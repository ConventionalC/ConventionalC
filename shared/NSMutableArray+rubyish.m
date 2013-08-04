#import "NSMutableArray+rubyish.h"

@implementation NSMutableArray(rubyish)

-(NSMutableArray*)clear
{
    [self removeAllObjects];
    return self;
}

-(NSMutableArray*)collect:(ObjectReturnBlock)b { return [self map:b]; }

-(NSMutableArray*)compact
{
    return [self replace:self.compacted];
}

-(NSMutableArray*)concat:(NSArray*)otherArray
{
    [self addObjectsFromArray:otherArray];
    return self;
}

-(NSMutableArray*)map:(ObjectReturnBlock)b
{
    [self eachIndexAndObject:^(NSUInteger i, id o){ self[i] = b(o); }];
    return self;
}

-(id)pop
{
    id result = self.last;
    [self removeLastObject];
    return result;
}

-(NSMutableArray*)push:(id)object
{
    [self addObject:object];
    return self;
}

-(NSMutableArray*)replace:(NSArray*)otherArray
{
    [self replaceObjectsInRange:NSMakeRange(0, self.count) withObjectsFromArray:otherArray];
    return self;
}

-(NSMutableArray*)reverse
{
    return [self replace:self.reversed];
}

-(NSMutableArray*)select:(ObjectReturnBoolBlock)selectionBlock
{
    return [self replace:[self selected:selectionBlock]];
}

-(NSMutableArray*)shuffle
{
    return [self replace:self.shuffled];
}

-(NSMutableArray*)sort
{
    return [self replace:self.sorted];
}

@end
