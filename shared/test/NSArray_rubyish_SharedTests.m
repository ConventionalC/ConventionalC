#import "NSArray+rubyish.h"
#import <SenTestingKit/SenTestingKit.h>

@interface NSArray_rubyish_SharedTests:SenTestCase
@end

@interface NSArray_rubyish_SharedTests()
  @property(retain) NSArray* abc;
  @property(retain) NSArray* empty;
@end

@implementation NSArray_rubyish_SharedTests

@synthesize abc, empty;

-(void)setUp
{
    [super setUp];
    abc = @[@"a", @"b", @"c"];
    empty = NSArray.new;
}

-(void)testNewWithSizeAndObject
{
    id o = @"object";
    STAssertEqualObjects([NSArray newWithSize:3 object:o], (@[o, o, o]), nil);
}

-(void)testNewWithSize
{
    STAssertEqualObjects([NSArray newWithSize:3], (@[NSNull.null, NSNull.null, NSNull.null]), nil);
}

-(void)testNewWithSizeAndBlock
{
    STAssertEqualObjects([NSArray newWithSize:3 block:(id)^(int i){return @(i);}], (@[@(0), @(1), @(2)]), nil);
}

-(void)testAt
{
    STAssertEqualObjects([NSArray newWithSize:3 block:(id)^(int i){return [abc at:i];}], abc, nil);
    STAssertNil([abc at:3], nil);
}

-(void)testCompacted
{
    STAssertEqualObjects((@[NSNull.null, @"a", @"b", NSNull.null, @"c"]).compacted, abc, nil);
}

-(void)testCollected
{
    [self testMapped];
}

-(void)testEach
{
    __block int count=0;
    STAssertNoThrow([abc each:^(id o){ count++; }], nil);
    STAssertTrue(abc.count == count, nil);
}

-(void)testEachIndex
{
    __block int count=0;
    STAssertNoThrow([abc eachIndex:^(NSUInteger i){ count+=i+1; }], nil);
    STAssertTrue(6 == count, nil);
}

-(void)testIsEmpty
{
    STAssertFalse(abc.isEmpty, nil);
    STAssertTrue(empty.isEmpty, nil);
}

-(void)testFirst
{
    STAssertEqualObjects(abc.first, @"a", nil);
    STAssertNil(NSArray.new.first, nil);
}

-(void)testFlattened
{
    NSArray* source = @[@(1), @(2), @[@(3), @[@(4), @(5)]]];
    STAssertEqualObjects(source.flattened, (@[@(1),@(2),@(3),@(4),@(5)]), nil);
}

-(void)testFlattenedToLevel
{
    NSArray* source = @[@(1), @(2), @[@(3), @[@(4), @(5)]]];
    STAssertEqualObjects([source flattenedToLevel:1], (@[@(1),@(2),@(3),@[@(4),@(5)]]), nil);
}

-(void)testLast
{
    STAssertEqualObjects(abc.last, @"c", nil);
    STAssertNil(NSArray.new.last, nil);
}

-(void)testLength
{
    STAssertEquals(abc.length, (NSUInteger)3, nil);
}

-(void)testMapped
{
    NSArray* result = [abc mapped:(id)^(NSString *o){ return [o stringByAppendingString:o]; }];
    STAssertEqualObjects(result, (@[@"aa", @"bb", @"cc"]), nil);
}

-(void)testReversed
{
    STAssertEqualObjects(abc.reversed, (@[@"c", @"b", @"a"]), nil);
    STAssertEqualObjects(abc.reversed.reversed, abc, nil);
}

-(void)testSample
{
    NSArray* result = [NSArray newWithSize:100 block:(id)^(NSUInteger i){return abc.sample;}];
    STAssertEqualObjects([[NSSet setWithArray:result] allObjects], abc, nil);
}

-(void)testSelected
{
    STAssertEqualObjects([abc selected:^BOOL(id o) { return [@"b" isEqual:o]; }], (@[@"b"]), nil);
}

-(void)testShuffled
{
    NSArray* oneTo99 = [NSArray newWithSize:100 block:(id)^(int i){return @(i+1);}];
    NSArray* result = oneTo99.shuffled;
    STAssertFalse([oneTo99 isEqual:result], nil);
    STAssertEqualObjects(result.sorted, oneTo99, nil);
}

-(void)testSize
{
    STAssertEquals(abc.size, (NSUInteger)3, nil);
}

-(void)testSliced
{
    STAssertEqualObjects([abc sliced:1], @"b", nil);//a.slice(1)     #=> "b"
    //not implemented: a.slice!(-1)    #=> "c"
    STAssertNil([abc sliced:100], nil);//a.slice(100)   #=> nil
}

-(void)testSlicedRange
{
    STAssertEqualObjects([abc sliced:1 length:1], (@[@"b"]), nil);//a.slice!(1)     #=> "b"
    //not implemented: a.slice!(-1)    #=> "c"
    STAssertNil([abc sliced:100 length:1], nil);//a.slice!(100)   #=> nil
}

-(void)testSorted
{
    STAssertEqualObjects((@[@"c", @"a", @"b"].sorted), abc, nil);
    STAssertEqualObjects((abc.reversed.sorted), abc, nil);
}

@end
