#import <XCTest/XCTest.h>
#import "NSString+rubyish.h"

@interface NSString_rubyish_SharedTests : XCTestCase
@end

@implementation NSString_rubyish_SharedTests

-(void)testCapitalized
{
    XCTAssertEqualObjects(@"ASDF".capitalized, @"Asdf");
    XCTAssertEqualObjects(@"aSdF".capitalized, @"Asdf");
    XCTAssertEqualObjects(@"asdf".capitalized, @"Asdf");
    XCTAssertEqualObjects(@"Asdf".capitalized, @"Asdf");
}

-(void)testCasecmp
{
    XCTAssertEqual((int)[@"abcdef" casecmp:@"abcde"], 1);    // "abcdef".casecmp("abcde")     #=> 1
    XCTAssertEqual((int)[@"aBcDeF" casecmp:@"abcdef"], 0);   // "aBcDeF".casecmp("abcdef")    #=> 0
    XCTAssertEqual((int)[@"abcdef" casecmp:@"abcdefg"], -1); // "abcdef".casecmp("abcdefg")   #=> -1
    XCTAssertEqual((int)[@"abcdef" casecmp:@"ABCDEF"], 0);   // "abcdef".casecmp("ABCDEF")    #=> 0
}

-(void)testChr
{
    XCTAssertEqualObjects(@"asdf".chr, @"a");
    XCTAssertEqualObjects(@"QWER".chr, @"Q");
    XCTAssertNil(@"".chr);
}

-(void)testDowncased
{
    XCTAssertEqualObjects(@"ASDF".downcased, @"asdf");
    XCTAssertEqualObjects(@"aSdF".downcased, @"asdf");
    XCTAssertEqualObjects(@"asdf".downcased, @"asdf");
}

-(void)testEachByte
{
    __block int count = 0;
    
    [@"aaaa" eachByte:^(char b){XCTAssertEqual((int)'a', (int)b); count++;}];
    XCTAssertEqual(count, 4);
}

-(void)testEachChar
{
    NSMutableString* result = NSMutableString.new;
    [@"asdf" eachChar:^(unichar c){[result appendFormat:@"%c", c];}];
    XCTAssertEqualObjects(result, @"asdf");
}

-(void)testEachLine
{
    __block int lines = 0;
    [@"asdf\nqwer\npoiu" eachLine:^(NSString *line) {
        lines++;
    }];
    XCTAssertEqual(lines, 3);
}

-(void)testIsEmpty
{
    XCTAssertTrue(@"".isEmpty);
    XCTAssertFalse(@"asdf".isEmpty);
    XCTAssertFalse(@" ".isEmpty);
}

-(void)testEndsWith
{
    XCTAssertTrue([@"asdfQWER" endsWith:@"QWER"]);
    XCTAssertFalse([@"asdfQWER" endsWith:@"asdf"]);
}

-(void)testEndsWithAny
{
    XCTAssertTrue([@"asdfQWER" endsWithAny:(@[@"QWER"])]);
    XCTAssertTrue([@"asdfQWER" endsWithAny:(@[@"asdf", @"QWER"])]);
    XCTAssertFalse([@"asdfQWER" endsWithAny:(@[@"asdf", @"qwer"])]);
}

-(void)testIncludes
{
    XCTAssertTrue([@"hello" includes:@"lo"]);
    XCTAssertFalse([@"hello" includes:@"ol"]);
    XCTAssertTrue([@"hello" includes:@"h"]);
}

-(void)testLstripped
{
    XCTAssertEqualObjects(@"  hello  ".lstripped, @"hello  ");
    XCTAssertEqualObjects(@"hello".lstripped, @"hello");
}

-(void)testReversed
{
    XCTAssertEqualObjects(@"stressed".reversed, @"desserts"); //"stressed".reverse   #=> "desserts"
}

-(void)testRstripped
{
    XCTAssertEqualObjects(@"  hello  ".rstripped, @"  hello");
    XCTAssertEqualObjects(@"hello".rstripped, @"hello");
}

-(void)testSize
{
    XCTAssertEqual((int)@"".size,     0);
    XCTAssertEqual((int)@"2".size,    1);
    XCTAssertEqual((int)@"as".size,   2);
    XCTAssertEqual((int)@"E2e".size,  3);
    XCTAssertEqual((int)@"e!d ".size, 4);
}

-(void)testStartsWith
{
    XCTAssertTrue([@"asdfQWER" startsWith:@"asdf"]);
    XCTAssertFalse([@"asdfQWER" startsWith:@"QWER"]);
}

-(void)testStartsWithAny
{
    XCTAssertTrue([@"asdfQWER" startsWithAny:(@[@"asdf"])]);
    XCTAssertTrue([@"asdfQWER" startsWithAny:(@[@"asdf", @"QWER"])]);
    XCTAssertFalse([@"asdfQWER" startsWithAny:(@[@"ASDF", @"qwer"])]);
}

-(void)testStripped
{
    //"    hello    ".strip   #=> "hello"
    XCTAssertEqualObjects(@"    hello    ".stripped, @"hello");
    
    //"\tgoodbye\r\n".strip   #=> "goodbye"
    XCTAssertEqualObjects(@"\tgoodbye\r\n".stripped, @"goodbye");
}

-(void)testSwapcased
{
    XCTAssertEqualObjects(@"Hello".swapcased, @"hELLO"); //"Hello".swapcase          #=> "hELLO"
    XCTAssertEqualObjects(@"cYbEr_PuNk11".swapcased, @"CyBeR_pUnK11"); //"cYbEr_PuNk11".swapcase   #=> "CyBeR_pUnK11"
}

-(void)testUpcased
{
    XCTAssertEqualObjects(@"ASDF".upcased, @"ASDF");
    XCTAssertEqualObjects(@"aSdF".upcased, @"ASDF");
    XCTAssertEqualObjects(@"asdf".upcased, @"ASDF");
}

@end
