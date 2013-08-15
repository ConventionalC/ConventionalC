#import "NSMutableArray+rubyish.h"
#import <SenTestingKit/SenTestingKit.h>

@interface NSMutableArray_rubyish_SharedTests:SenTestCase
@end

@interface NSMutableArray_rubyish_SharedTests()
  @property(retain) NSMutableArray* abc;
  @property(retain) NSMutableArray* empty;
  @property(retain) NSMutableArray* nums;
@end

@implementation NSMutableArray_rubyish_SharedTests

@synthesize abc, empty, nums;

-(void)setUp
{
    [super setUp];
    abc = @[@"a", @"b", @"c"].mutableCopy;
    nums = @[@(1),@(2),@(3),@(4),@(5)].mutableCopy;
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

-(void)testFlattenedToLevel
{
    NSMutableArray* source = @[@(1), @(2), @[@(3), @[@(4), @(5)]]].mutableCopy;
    STAssertEqualObjects([source flatten:1], (@[@(1),@(2),@(3),@[@(4),@(5)]]), nil);
}

-(void)testInsert
{
    STAssertEqualObjects([abc insertArray:@[@"n"] at:1], (@[@"a",@"n",@"b",@"c"]), nil);
}

-(void)testKeepIf
{
    STAssertEqualObjects([nums keepIf:^BOOL(NSNumber* o){return o.intValue%2;}], (@[@(1),@(3),@(5)]), nil);
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

-(void)testPopN
{
    STAssertEqualObjects([abc pop:2], (@[@"b", @"c"]), nil);
    STAssertEqualObjects(abc, (@[@"a"]), nil);
}

-(void)testPush
{
    NSMutableArray* result = [abc push:@"d"];
    STAssertEqualObjects(result, (@[@"a",@"b",@"c",@"d"]), nil);
    STAssertEqualObjects(result, abc, @"should return itself");
}

-(void)testReject
{
    STAssertEqualObjects([abc reject:^BOOL(NSString* o){return [o isEqualToString:@"b"];}], (@[@"b"]), nil);
    STAssertNil([abc reject:^BOOL(NSString* o){return YES;}], nil);
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

-(void)testRotate
{
    NSMutableArray* a = @[@"a", @"b", @"c", @"d"].mutableCopy;
    STAssertEqualObjects(a.rotate, (@[@"b", @"c", @"d", @"a"]), nil);
    STAssertEqualObjects(a, (@[@"b", @"c", @"d", @"a"]), nil);
    STAssertEqualObjects([a rotate:2], (@[@"d", @"a", @"b", @"c"]), nil);
    STAssertEqualObjects([a rotate:-3], (@[@"a", @"b", @"c", @"d"]), nil);
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

-(void)testShiftN
{
    id result = [abc shift:2];
    STAssertEqualObjects(abc, (@[@"c"]), nil);
    STAssertEqualObjects(result, (@[@"a", @"b"]), nil);
    STAssertNil([empty shift:2], nil);
}

-(void)testShuffle
{
    NSArray* oneTo99 = [NSArray newWithSize:100 block:(id)^(int i){return @(i+1);}];
    NSArray* result = [oneTo99.mutableCopy shuffle];
    STAssertFalse([oneTo99 isEqual:result], nil);
    STAssertEqualObjects(result.sorted, oneTo99, nil);
}

-(void)testSlice
{
    STAssertEqualObjects([abc slice:1], @"b", nil);//a.slice!(1)     #=> "b"
    STAssertEqualObjects(abc, (@[@"a", @"c"]), nil);//a               #=> ["a", "c"]
    //not implemented: a.slice!(-1)    #=> "c"
    //not implemented: a               #=> ["a"]
    STAssertNil([abc slice:100], nil);//a.slice!(100)   #=> nil
    STAssertEqualObjects(abc, (@[@"a", @"c"]), nil);//a               #=> ["a"]
}

-(void)testSliceRange
{
    STAssertEqualObjects([abc slice:1 length:1], (@[@"b"]), nil);//a.slice!(1)     #=> "b"
    STAssertEqualObjects(abc, (@[@"a", @"c"]), nil);//a               #=> ["a", "c"]
    //not implemented: a.slice!(-1)    #=> "c"
    //not implemented: a               #=> ["a"]
    STAssertNil([abc slice:100 length:1], nil);//a.slice!(100)   #=> nil
    STAssertEqualObjects(abc, (@[@"a", @"c"]), nil);//a               #=> ["a"]
}

-(void)testSort
{
    STAssertEqualObjects([(@[@"c", @"a", @"b"]).mutableCopy sort], abc, nil);
    STAssertEqualObjects((abc.reverse.sort), abc, nil);
}

-(void)testSortWithComparator
{
    STAssertEqualObjects([(@[@"c", @"a", @"b"]).mutableCopy sort], abc, nil);
    STAssertEqualObjects(([abc.reverse sort:^NSComparisonResult(id a, id b){return [a compare:b]; }]), abc, nil);
}

-(void)testSortBy
{
    NSMutableArray* source = @[@"ccc", @"a", @"bb"].mutableCopy;
    [source sortBy:(id)^(NSString* o){return @(o.length);}];
    STAssertEqualObjects(source, (@[@"a", @"bb", @"ccc"]), nil);
}

-(void)testUniq
{
    NSMutableArray* a = @[@"a", @"a", @"b", @"b", @"c"].mutableCopy;//a = [ "a", "a", "b", "b", "c" ]
    STAssertEqualObjects(a.uniq, abc, nil);//a.uniq!   # => ["a", "b", "c"]

    //b = [ "a", "b", "c" ]
    STAssertNil(abc.uniq, nil);//b.uniq!   # => nil

    NSMutableArray* c = @[@[@"student",@"sam"], @[@"student",@"george"], @[@"teacher",@"matz"]].mutableCopy; //c = [["student","sam"], ["student","george"], ["teacher","matz"]]
    STAssertEqualObjects([c uniq:^id(id o){return [o first];}], (@[@[@"student", @"sam"], @[@"teacher", @"matz"]]), nil);//c.uniq! { |s| s.first } # => [["student", "sam"], ["teacher", "matz"]]
}

-(void)testUnshift
{
    NSMutableArray* result = [abc unshift:@"d"];
    STAssertEqualObjects(result, (@[@"d",@"a",@"b",@"c"]), nil);
    STAssertEqualObjects(result, abc, @"should return itself");
}

@end
