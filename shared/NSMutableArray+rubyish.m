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

-(NSMutableArray*)concat:(NSArray*)other
{
    [self addObjectsFromArray:other];
    return self;
}

-(id)delete:(id)object
{
    id result = [self containsObject:object] ? object : nil;
    [self removeObject:object];
    return result;
}

-(id)deleteWithBlock:(ReturnBlock)block
{
    return [self delete:block()];
}

-(id)deleteAt:(NSUInteger)index
{
    id result = self[index];
    [self removeObjectAtIndex:index];
    return result;
}

-(NSArray*)deleteIf:(ObjectReturnBoolBlock)block
{
    return [self mapped:^id(id o){return block(o)?o:nil;}].compacted;
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

-(id)shift
{
    id result = self.first;
    if(result)
       [self removeObjectAtIndex:0];
    return result;
}

-(NSMutableArray*)shuffle
{
    return [self replace:self.shuffled];
}

-(NSMutableArray*)sort
{
    return [self replace:self.sorted];
}

-(NSMutableArray*)unshift:(id)object
{
    [self insertObject:object atIndex:0];
    return self;
}

@end
