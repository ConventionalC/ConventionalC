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

-(NSMutableArray*)fill:(id)object
{
    return [self map:^id(id o){return object;}];
}

-(NSMutableArray*)fill:(id)object start:(NSUInteger)start
{
    return [self fill:object range:NSMakeRange(start, 1 + self.length - start - 1)];
}

-(NSMutableArray*)fill:(id)object start:(NSUInteger)start length:(NSUInteger)length;
{
    return [self fill:object range:NSMakeRange(start, length)];
}

-(NSMutableArray*)fill:(id)object range:(NSRange)range;
{
    for(NSUInteger i=0; i<range.length; i++)
        self[i + range.location] = object;
    return self;
}

-(NSMutableArray*)fillWithBlock:(IndexReturnBlock)block;
{
    [self eachIndex:^(NSUInteger i){ self[i] = block(i); }];
    return self;
}

-(NSMutableArray*)fillWithBlock:(IndexReturnBlock)block start:(NSUInteger)start;
{
    return [self fillWithBlock:block range:NSMakeRange(start, self.length - start)];
}

-(NSMutableArray*)fillWithBlock:(IndexReturnBlock)block start:(NSUInteger)start length:(NSUInteger)length;
{
    return [self fillWithBlock:block range:NSMakeRange(start, length)];
}

-(NSMutableArray*)fillWithBlock:(IndexReturnBlock)block range:(NSRange)range;
{
    for(int i=0; i<range.length; i++)
        self[i + range.location] = block(i + range.location);
    return self;
}

-(NSMutableArray*)flatten
{
    return [self replace:self.flattened];
}

-(NSMutableArray*)flatten:(NSUInteger)level
{
    return [self replace:[self flattenedToLevel:level]];
}

-(NSMutableArray*)insertArray:(NSArray*)objects at:(NSUInteger)index
{
    for(id o in objects)
        [self insertObject:o atIndex:index++];
    return self;
}

-(NSMutableArray*)keepIf:(ObjectReturnBoolBlock)block
{
    if(self.count)
        for(long i = self.length - 1; i >= 0; i--)
            if(!block(self[i]))
                [self removeObjectAtIndex:i];
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

-(NSArray*)pop:(NSUInteger)n
{
    NSArray* result = [self subarrayFrom:self.length - n];
    for(int i=0; i<n; i++)
        [self pop];
    return result;
}

-(NSMutableArray*)push:(id)object
{
    [self addObject:object];
    return self;
}

-(NSMutableArray*)reject:(ObjectReturnBoolBlock)block
{
    BOOL rejected = NO;
    if(self.count)
        for(long i = self.length - 1; i >= 0; i--)
            if(!block(self[i]))
            {
                rejected = YES;
                [self removeObjectAtIndex:i];
            }
    return rejected ? self : nil;
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

-(NSMutableArray*)sort:(NSComparator)block
{
    [self sortUsingComparator:block];
    return self;
}

-(NSMutableArray*)sortBy:(ObjectReturnBlock)block
{
    return [self sort:^NSComparisonResult(id a, id b){return [block(a) compare:block(b)];}];
}

-(NSMutableArray*)unshift:(id)object
{
    [self insertObject:object atIndex:0];
    return self;
}

@end
