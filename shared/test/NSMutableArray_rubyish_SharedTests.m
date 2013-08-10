#import "NSMutableArray+rubyish.h"
#import <SenTestingKit/SenTestingKit.h>

@interface NSMutableArray_rubyish_SharedTests:SenTestCase
@end

@interface NSMutableArray_rubyish_SharedTests()
  @property(retain) NSMutableArray* abc;
  @property(retain) NSMutableArray* empty;
@end

@implementation NSMutableArray_rubyish_SharedTests

@synthesize abc, empty;

-(void)setUp
{
    [super setUp];
    abc = @[@"a", @"b", @"c"].mutableCopy;
    empty = NSMutableArray.new;
}

-(void)testClear
{
    STAssertEquals(abc.clear.count, (NSUInteger)0, nil);
}

-(void)testCollect
{
    [self testMap];
}

-(void)testCompact
{
    NSMutableArray* result = @[@"a", @"b", @"c"].mutableCopy;
    STAssertEqualObjects(result.compact, abc, nil);
}

-(void)testConcat
{
    STAssertEqualObjects([abc concat:@[@"d"]], (@[@"a", @"b", @"c", @"d"]), nil);
}

-(void)testDelete
{
    STAssertEqualObjects([abc delete:@"b"], @"b", nil);
}

-(void)testDeleteWithBlock
{
    STAssertEqualObjects([abc deleteWithBlock:^id{ return @"b"; }], @"b", nil);
}

-(void)testDeleteAt
{
    STAssertEqualObjects([abc deleteAt:1], @"b", nil);
}

-(void)testDeleteIf
{
    STAssertEqualObjects([abc deleteIf:^BOOL(NSString* o){return [o isEqualToString:@"b"];}], (@[@"b"]), nil);
}

-(void)testFill
{
    STAssertEqualObjects([abc.mutableCopy fill:@"f"], (@[@"f",@"f",@"f"]), nil);
    STAssertEqualObjects([abc.mutableCopy fill:@"f" start:1], (@[@"a",@"f",@"f"]), nil);
    STAssertEqualObjects([abc.mutableCopy fill:@"f" start:1 length:1], (@[@"a",@"f",@"c"]), nil);
    STAssertEqualObjects([abc.mutableCopy fill:@"f" range:NSMakeRange(1, 1)], (@[@"a",@"f",@"c"]), nil);
    STAssertEqualObjects([abc.mutableCopy fillWithBlock:^id(NSUInteger index){return @"f";}], (@[@"f",@"f",@"f"]), nil);
    STAssertEqualObjects([abc.mutableCopy fillWithBlock:^id(NSUInteger index){return @"f";} start:1], (@[@"a",@"f",@"f"]), nil);
    STAssertEqualObjects([abc.mutableCopy fillWithBlock:^id(NSUInteger index){return @"f";} start:1 length:1], (@[@"a",@"f",@"c"]), nil);
    STAssertEqualObjects([abc.mutableCopy fillWithBlock:^id(NSUInteger index){return @"f";} range:NSMakeRange(1, 1)], (@[@"a",@"f",@"c"]), nil);
}

-(void)testFlatten
{
    NSMutableArray* source = @[@(1), @(2), @[@(3), @[@(4), @(5)]]].mutableCopy;
    STAssertEqualObjects(source.flatten, (@[@(1),@(2),@(3),@(4),@(5)]), nil);
}

-(void)testMap
{
    NSArray* result = [abc map:(id)^(NSString *o){ return [o stringByAppendingString:o]; }];
    STAssertEqualObjects(result, (@[@"aa", @"bb", @"cc"]), nil);
}

-(void)testPop
{
    id result = abc.pop;
    STAssertEqualObjects(abc, (@[@"a", @"b"]), nil);
    STAssertEqualObjects(result, @"c", nil);
    STAssertNil([(@[]).mutableCopy pop], nil);
}

-(void)testPush
{
    NSMutableArray* result = [abc push:@"d"];
    STAssertEqualObjects(result, (@[@"a",@"b",@"c",@"d"]), nil);
    STAssertEqualObjects(result, abc, @"should return itself");
}

-(void)testReplace
{
    NSArray* replaced = @[@"replaced"];
    STAssertEqualObjects([abc replace:replaced], replaced, nil);
}

-(void)testReverse
{
    STAssertEqualObjects(abc.reverse, (@[@"c", @"b", @"a"]), nil);
    STAssertEqualObjects(abc.reverse.reverse, abc, nil);
}

-(void)testSelect
{
    NSArray* result = [abc select:^BOOL(id o){return [@"b" isEqual:o];}];
    NSArray* compare = @[(@"b")];
    STAssertEqualObjects(result, compare, nil);
}

-(void)testShift
{
    id result = abc.shift;
    STAssertEqualObjects(abc, (@[@"b", @"c"]), nil);
    STAssertEqualObjects(result, @"a", nil);
    STAssertNil([(@[]).mutableCopy shift], nil);
}

-(void)testShuffle
{
    NSArray* oneTo99 = [NSArray newWithSize:100 block:(id)^(int i){return @(i+1);}];
    NSArray* result = [oneTo99.mutableCopy shuffle];
    STAssertFalse([oneTo99 isEqual:result], nil);
    STAssertEqualObjects(result.sorted, oneTo99, nil);
}

-(void)testSort
{
    STAssertEqualObjects([(@[@"c", @"a", @"b"]).mutableCopy sort], abc, nil);
    STAssertEqualObjects((abc.reverse.sort), abc, nil);
}

-(void)testUnshift
{
    NSMutableArray* result = [abc unshift:@"d"];
    STAssertEqualObjects(result, (@[@"d",@"a",@"b",@"c"]), nil);
    STAssertEqualObjects(result, abc, @"should return itself");
}

@end
