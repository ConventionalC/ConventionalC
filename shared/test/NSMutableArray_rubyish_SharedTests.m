#import "NSMutableArray+rubyish.h"
#import <XCTest/XCTest.h>

@interface NSMutableArray_rubyish_SharedTests:XCTestCase
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
    XCTAssertEqual(abc.clear.count, (NSUInteger)0);
}

-(void)testCollect
{
    [self testMap];
}

-(void)testCompact
{
    NSMutableArray* result = @[@"a", @"b", @"c"].mutableCopy;
    XCTAssertEqualObjects(result.compact, abc);
}

-(void)testConcat
{
    XCTAssertEqualObjects([abc concat:@[@"d"]], (@[@"a", @"b", @"c", @"d"]));
}

-(void)testDelete
{
    XCTAssertEqualObjects([abc delete:@"b"], @"b");
}

-(void)testDeleteWithBlock
{
    XCTAssertEqualObjects([abc deleteWithBlock:^id{ return @"b"; }], @"b");
}

-(void)testDeleteAt
{
    XCTAssertEqualObjects([abc deleteAt:1], @"b");
}

-(void)testDeleteIf
{
    XCTAssertEqualObjects([abc deleteIf:^BOOL(NSString* o){return [o isEqualToString:@"b"];}], (@[@"b"]));
}

-(void)testDrop
{
    NSMutableArray* a = @[@(1),@(2),@(3),@(4),@(5),@(0)].mutableCopy;//a = [1, 2, 3, 4, 5, 0]
    NSArray* result = [a drop:3];
    XCTAssertEqualObjects(result, (@[@(4),@(5),@(0)]));
    XCTAssertEqualObjects(a, (@[@(4),@(5),@(0)]));
}

-(void)testDropWhile
{
    NSMutableArray* a = @[@(1),@(2),@(3),@(4),@(5),@(0)].mutableCopy;//a = [1, 2, 3, 4, 5, 0]
    NSArray* result = [a dropWhile:^BOOL(NSNumber* o){return o.intValue < 3;}];//#=> [3, 4, 5, 0]
    XCTAssertEqualObjects(result, (@[@(3),@(4),@(5),@(0)]));
    XCTAssertEqualObjects(a, (@[@(3),@(4),@(5),@(0)]));
}

-(void)testFill
{
    XCTAssertEqualObjects([abc.mutableCopy fill:@"f"], (@[@"f",@"f",@"f"]));
    XCTAssertEqualObjects([abc.mutableCopy fill:@"f" start:1], (@[@"a",@"f",@"f"]));
    XCTAssertEqualObjects([abc.mutableCopy fill:@"f" start:1 length:1], (@[@"a",@"f",@"c"]));
    XCTAssertEqualObjects([abc.mutableCopy fill:@"f" range:NSMakeRange(1, 1)], (@[@"a",@"f",@"c"]));
    XCTAssertEqualObjects([abc.mutableCopy fillWithBlock:^id(NSUInteger index){return @"f";}], (@[@"f",@"f",@"f"]));
    XCTAssertEqualObjects([abc.mutableCopy fillWithBlock:^id(NSUInteger index){return @"f";} start:1], (@[@"a",@"f",@"f"]));
    XCTAssertEqualObjects([abc.mutableCopy fillWithBlock:^id(NSUInteger index){return @"f";} start:1 length:1], (@[@"a",@"f",@"c"]));
    XCTAssertEqualObjects([abc.mutableCopy fillWithBlock:^id(NSUInteger index){return @"f";} range:NSMakeRange(1, 1)], (@[@"a",@"f",@"c"]));
}

-(void)testFlatten
{
    NSMutableArray* source = @[@(1), @(2), @[@(3), @[@(4), @(5)]]].mutableCopy;
    XCTAssertEqualObjects(source.flatten, (@[@(1),@(2),@(3),@(4),@(5)]));
}

-(void)testFlattenedToLevel
{
    NSMutableArray* source = @[@(1), @(2), @[@(3), @[@(4), @(5)]]].mutableCopy;
    XCTAssertEqualObjects([source flatten:1], (@[@(1),@(2),@(3),@[@(4),@(5)]]));
}

-(void)testInsert
{
    XCTAssertEqualObjects([abc insertArray:@[@"n"] at:1], (@[@"a",@"n",@"b",@"c"]));
}

-(void)testKeepIf
{
    XCTAssertEqualObjects([nums keepIf:^BOOL(NSNumber* o){return o.intValue%2;}], (@[@(1),@(3),@(5)]));
}

-(void)testMap
{
    NSArray* result = [abc map:(id)^(NSString *o){ return [o stringByAppendingString:o]; }];
    XCTAssertEqualObjects(result, (@[@"aa", @"bb", @"cc"]));
}

-(void)testPop
{
    id result = abc.pop;
    XCTAssertEqualObjects(abc, (@[@"a", @"b"]));
    XCTAssertEqualObjects(result, @"c");
    XCTAssertNil([(@[]).mutableCopy pop]);
}

-(void)testPopN
{
    XCTAssertEqualObjects([abc pop:2], (@[@"b", @"c"]));
    XCTAssertEqualObjects(abc, (@[@"a"]));
}

-(void)testPush
{
    NSMutableArray* result = [abc push:@"d"];
    XCTAssertEqualObjects(result, (@[@"a",@"b",@"c",@"d"]));
    XCTAssertEqualObjects(result, abc, @"should return itself");
}

-(void)testReject
{
    XCTAssertEqualObjects([abc reject:^BOOL(NSString* o){return [o isEqualToString:@"b"];}], (@[@"b"]));
    XCTAssertNil([abc reject:^BOOL(NSString* o){return YES;}]);
}

-(void)testReplace
{
    NSArray* replaced = @[@"replaced"];
    XCTAssertEqualObjects([abc replace:replaced], replaced);
}

-(void)testReverse
{
    XCTAssertEqualObjects(abc.reverse, (@[@"c", @"b", @"a"]));
    XCTAssertEqualObjects(abc.reverse.reverse, abc);
}

-(void)testRotate
{
    NSMutableArray* a = @[@"a", @"b", @"c", @"d"].mutableCopy;
    XCTAssertEqualObjects(a.rotate, (@[@"b", @"c", @"d", @"a"]));
    XCTAssertEqualObjects(a, (@[@"b", @"c", @"d", @"a"]));
    XCTAssertEqualObjects([a rotate:2], (@[@"d", @"a", @"b", @"c"]));
    XCTAssertEqualObjects([a rotate:-3], (@[@"a", @"b", @"c", @"d"]));
}

-(void)testSelect
{
    NSArray* result = [abc select:^BOOL(id o){return [@"b" isEqual:o];}];
    NSArray* compare = @[(@"b")];
    XCTAssertEqualObjects(result, compare);
}

-(void)testShift
{
    id result = abc.shift;
    XCTAssertEqualObjects(abc, (@[@"b", @"c"]));
    XCTAssertEqualObjects(result, @"a");
    XCTAssertNil([(@[]).mutableCopy shift]);
}

-(void)testShiftN
{
    id result = [abc shift:2];
    XCTAssertEqualObjects(abc, (@[@"c"]));
    XCTAssertEqualObjects(result, (@[@"a", @"b"]));
    XCTAssertNil([empty shift:2]);
}

-(void)testShuffle
{
    NSArray* oneTo99 = [NSArray newWithSize:100 block:(id)^(int i){return @(i+1);}];
    NSArray* result = [oneTo99.mutableCopy shuffle];
    XCTAssertFalse([oneTo99 isEqual:result]);
    XCTAssertEqualObjects(result.sorted, oneTo99);
}

-(void)testSlice
{
    XCTAssertEqualObjects([abc slice:1], @"b");//a.slice!(1)     #=> "b"
    XCTAssertEqualObjects(abc, (@[@"a", @"c"]));//a               #=> ["a", "c"]
    //not implemented: a.slice!(-1)    #=> "c"
    //not implemented: a               #=> ["a"]
    XCTAssertNil([abc slice:100]);//a.slice!(100)   #=> nil
    XCTAssertEqualObjects(abc, (@[@"a", @"c"]));//a               #=> ["a"]
}

-(void)testSliceRange
{
    XCTAssertEqualObjects([abc slice:1 length:1], (@[@"b"]));//a.slice!(1)     #=> "b"
    XCTAssertEqualObjects(abc, (@[@"a", @"c"]));//a               #=> ["a", "c"]
    //not implemented: a.slice!(-1)    #=> "c"
    //not implemented: a               #=> ["a"]
    XCTAssertNil([abc slice:100 length:1]);//a.slice!(100)   #=> nil
    XCTAssertEqualObjects(abc, (@[@"a", @"c"]));//a               #=> ["a"]
}

-(void)testSort
{
    XCTAssertEqualObjects([(@[@"c", @"a", @"b"]).mutableCopy sort], abc);
    XCTAssertEqualObjects((abc.reverse.sort), abc);
}

-(void)testSortWithComparator
{
    XCTAssertEqualObjects([(@[@"c", @"a", @"b"]).mutableCopy sort], abc);
    XCTAssertEqualObjects(([abc.reverse sort:^NSComparisonResult(id a, id b){return [a compare:b]; }]), abc);
}

-(void)testSortBy
{
    NSMutableArray* source = @[@"ccc", @"a", @"bb"].mutableCopy;
    [source sortBy:(id)^(NSString* o){return @(o.length);}];
    XCTAssertEqualObjects(source, (@[@"a", @"bb", @"ccc"]));
}

-(void)testUniq
{
    NSMutableArray* a = @[@"a", @"a", @"b", @"b", @"c"].mutableCopy;//a = [ "a", "a", "b", "b", "c" ]
    XCTAssertEqualObjects(a.uniq, abc);//a.uniq!   # => ["a", "b", "c"]

    //b = [ "a", "b", "c" ]
    XCTAssertNil(abc.uniq);//b.uniq!   # => nil

    NSMutableArray* c = @[@[@"student",@"sam"], @[@"student",@"george"], @[@"teacher",@"matz"]].mutableCopy; //c = [["student","sam"], ["student","george"], ["teacher","matz"]]
    XCTAssertEqualObjects([c uniq:^id(id o){return [o first];}], (@[@[@"student", @"sam"], @[@"teacher", @"matz"]]));//c.uniq! { |s| s.first } # => [["student", "sam"], ["teacher", "matz"]]
}

-(void)testUnshift
{
    NSMutableArray* result = [abc unshift:@"d"];
    XCTAssertEqualObjects(result, (@[@"d",@"a",@"b",@"c"]));
    XCTAssertEqualObjects(result, abc, @"should return itself");
}

@end
