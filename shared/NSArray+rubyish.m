#import "NSArray+rubyish.h"

@implementation NSArray(rubyish)

+(id)newWithSize:(int)size object:(id)o
{
    return [self newWithSize:size block:^id(NSUInteger i){ return o; }];
}

+(id)newWithSize:(int)size
{
    return [self newWithSize:size object:nil];
}

+(id)newWithSize:(int)size block:(IndexReturnBlock)block
{
    NSMutableArray* result = [NSMutableArray arrayWithCapacity:size];
    for(int i=0; i<size; i++)
        [result addObject: block(i) ?: NSNull.null];
    return result.copy;
}

-(id)at:(NSUInteger)index
{
    return index < self.count ? self[index] : nil;
}

-(NSArray*)collected:(ObjectReturnBlock)b { return [self mapped:b]; }

-(NSArray*)compacted
{
    return [self filteredArrayUsingPredicate:[NSPredicate predicateWithBlock:^BOOL(id o, NSDictionary *bindings){return ![o isKindOfClass:NSNull.class];}]];
}

-(NSArray*)each:(ObjectBlock)b { for(id o in self) b(o); return self;}

-(NSArray*)eachIndex:(IndexBlock)block
{
    for(NSUInteger i=0; i<self.count; i++)
        block(i);
    return self;
}

-(void)eachIndexAndObject:(IndexAndObjectBlock)b
{
    for(int i=0; i<self.count; i++)
        b(i, [self objectAtIndex:i]);
}

-(BOOL)isEmpty { return self.count == 0; }

-(id)first { return self.count ? self[0] : nil; }

-(NSArray*)flattened
{
    NSMutableArray* result = NSMutableArray.new;
    for(id o in self)
        if([o isKindOfClass:NSArray.class])
            [result addObjectsFromArray:[o flattened]];
        else
            [result addObject:o];
    return result.copy;
}

-(NSArray*)flattenedToLevel:(NSUInteger)level
{
    NSMutableArray* result = NSMutableArray.new;
    for(id o in self)
        if([o isKindOfClass:NSArray.class] && level > 0)
            [result addObjectsFromArray:[o flattenedToLevel:level-1]];
        else
            [result addObject:o];
    return result.copy;
}

-(id)last { return self.lastObject; }

-(NSArray*)last:(NSUInteger)n
{
    return [self subarrayWithRange:NSMakeRange(MAX(0, (long)self.length - (long)n), MIN(self.count, n))];
}

-(NSUInteger)length { return self.count; }

-(NSArray*)mapped:(ObjectReturnBlock)b
{
    NSMutableArray* result = [NSMutableArray arrayWithCapacity:self.count];
    for(id o in self)
        [result addObject:b(o)?:NSNull.null];
    return result.copy;
}

-(NSMutableArray*)rejected:(ObjectReturnBoolBlock)block
{
    BOOL rejected = NO;
    NSMutableArray* result = NSMutableArray.new;
    if(self.count)
        for(long i = self.length - 1; i >= 0; i--)
        {
            if(!block(self[i]))
                rejected = YES;
            else
                [result addObject:self[i]];
        }
    return rejected ? result : nil;
}

-(NSArray*)reversed
{
    return self.reverseObjectEnumerator.allObjects;
}

-(NSArray*)reverseEach:(ObjectBlock)b
{
    for(id o in self.reverseObjectEnumerator)
        b(o);
    return self;
}

-(id)sample
{
    return self[arc4random_uniform(self.count)];
}

-(NSArray*)selected:(ObjectReturnBoolBlock)selectionBlock
{
    return [self filteredArrayUsingPredicate:[NSPredicate predicateWithBlock:^BOOL(id o, NSDictionary *bindings){return selectionBlock(o);}]];
}

-(NSArray*)shuffled
{
    NSMutableArray* source = self.mutableCopy;
    NSMutableArray* result = NSMutableArray.new;
    while(source.count)
    {
        int i = arc4random_uniform((int)source.count);
        [result addObject:source[i]];
        [source removeObjectAtIndex:i];
    }
    return result;
}

-(NSUInteger)size { return self.count; }

-(id)sliced:(NSUInteger)index
{
    return index >= self.count ? nil : self[index];
}

-(NSArray*)sliced:(NSUInteger)start length:(NSUInteger)length
{
    return [self slicedRange:NSMakeRange(start, length)];
}

-(NSArray*)slicedRange:(NSRange)range
{
    return range.location >= self.count ? nil : [self subarrayWithRange:range];
}

-(NSArray*)sorted
{
    return [self sortedArrayUsingSelector:@selector(compare:)];
}

@end
