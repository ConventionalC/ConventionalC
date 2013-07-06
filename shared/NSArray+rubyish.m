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
    NSMutableArray *result = NSMutableArray.new;
    for(id o in self)
        if(![o isKindOfClass:NSNull.class])
            [result addObject:o];
    return result;
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

-(id)first { return self.count ? self[0] : nil; }

-(id)last { return self.count ? self[self.count-1] : nil; }

-(NSUInteger)length { return self.count; }

-(NSArray*)mapped:(ObjectReturnBlock)b
{
    NSMutableArray* result = [NSMutableArray arrayWithCapacity:self.count];
    for(id o in self)
        [result addObject:b(o)?:NSNull.null];
    return result.copy;
}

-(NSArray*)reversed
{
    return self.reverseObjectEnumerator.allObjects;
}

-(id)sample
{
    return self[arc4random_uniform(self.count)];
}

-(NSArray*)selected:(ObjectReturnBoolBlock)selectionBlock
{
    return [self filteredArrayUsingPredicate:[NSPredicate predicateWithBlock:^BOOL(id o, NSDictionary *bindings){return selectionBlock(o);}]];
}

-(NSUInteger)size { return self.count; }

-(NSArray*)sorted
{
    return [self sortedArrayUsingSelector:@selector(compare:)];
}

@end
