#import <SenTestingKit/SenTestingKit.h>
#import "NSString+rubyish.h"

@interface NSString_rubyish_SharedTests : SenTestCase
@end

@implementation NSString_rubyish_SharedTests

-(void)testCapitalized
{
    STAssertEqualObjects(@"ASDF".capitalized, @"Asdf", nil);
    STAssertEqualObjects(@"aSdF".capitalized, @"Asdf", nil);
    STAssertEqualObjects(@"asdf".capitalized, @"Asdf", nil);
    STAssertEqualObjects(@"Asdf".capitalized, @"Asdf", nil);
}

-(void)testCasecmp
{
    STAssertEquals([@"abcdef" casecmp:@"abcde"], 1, nil);    // "abcdef".casecmp("abcde")     #=> 1
    STAssertEquals([@"aBcDeF" casecmp:@"abcdef"], 0, nil);   // "aBcDeF".casecmp("abcdef")    #=> 0
    STAssertEquals([@"abcdef" casecmp:@"abcdefg"], -1, nil); // "abcdef".casecmp("abcdefg")   #=> -1
    STAssertEquals([@"abcdef" casecmp:@"ABCDEF"], 0, nil);   // "abcdef".casecmp("ABCDEF")    #=> 0
}

-(void)testChr
{
    STAssertEqualObjects(@"asdf".chr, @"a", nil);
    STAssertEqualObjects(@"QWER".chr, @"Q", nil);
    STAssertNil(@"".chr, nil);
}

-(void)testDowncased
{
    STAssertEqualObjects(@"ASDF".downcased, @"asdf", nil);
    STAssertEqualObjects(@"aSdF".downcased, @"asdf", nil);
    STAssertEqualObjects(@"asdf".downcased, @"asdf", nil);
}

-(void)testEachByte
{
    __block int count = 0;
    
    [@"aaaa" eachByte:^(char b){STAssertEquals((int)'a', (int)b, nil); count++;}];
    STAssertEquals(count, 4, nil);
}

-(void)testEachChar
{
    NSMutableString* result = NSMutableString.new;
    [@"asdf" eachChar:^(unichar c){[result appendFormat:@"%c", c];}];
    STAssertEqualObjects(result, @"asdf", nil);
}

-(void)testEachLine
{
    __block int lines = 0;
    [@"asdf\nqwer\npoiu" eachLine:^(NSString *line) {
        lines++;
    }];
    STAssertEquals(lines, 3, nil);
}

-(void)testIsEmpty
{
    STAssertTrue(@"".isEmpty, nil);
    STAssertFalse(@"asdf".isEmpty, nil);
    STAssertFalse(@" ".isEmpty, nil);
}

-(void)testEndsWith
{
    STAssertTrue([@"asdfQWER" endsWith:@"QWER"], nil);
    STAssertFalse([@"asdfQWER" endsWith:@"asdf"], nil);
}

-(void)testEndsWithAny
{
    STAssertTrue([@"asdfQWER" endsWithAny:(@[@"QWER"])], nil);
    STAssertTrue([@"asdfQWER" endsWithAny:(@[@"asdf", @"QWER"])], nil);
    STAssertFalse([@"asdfQWER" endsWithAny:(@[@"asdf", @"qwer"])], nil);
}

-(void)testIncludes
{
    STAssertTrue([@"hello" includes:@"lo"], nil);
    STAssertFalse([@"hello" includes:@"ol"], nil);
    STAssertTrue([@"hello" includes:@"h"], nil);
}

-(void)testLstripped
{
    STAssertEqualObjects(@"  hello  ".lstripped, @"hello  ", nil);
    STAssertEqualObjects(@"hello".lstripped, @"hello", nil);
}

-(void)testReversed
{
    STAssertEqualObjects(@"stressed".reversed, @"desserts", nil); //"stressed".reverse   #=> "desserts"
}

-(void)testRstripped
{
    STAssertEqualObjects(@"  hello  ".rstripped, @"  hello", nil);
    STAssertEqualObjects(@"hello".rstripped, @"hello", nil);
}

-(void)testSize
{
    STAssertEquals((int)@"".size,     0, nil);
    STAssertEquals((int)@"2".size,    1, nil);
    STAssertEquals((int)@"as".size,   2, nil);
    STAssertEquals((int)@"E2e".size,  3, nil);
    STAssertEquals((int)@"e!d ".size, 4, nil);
}

-(void)testStartsWith
{
    STAssertTrue([@"asdfQWER" startsWith:@"asdf"], nil);
    STAssertFalse([@"asdfQWER" startsWith:@"QWER"], nil);
}

-(void)testStartsWithAny
{
    STAssertTrue([@"asdfQWER" startsWithAny:(@[@"asdf"])], nil);
    STAssertTrue([@"asdfQWER" startsWithAny:(@[@"asdf", @"QWER"])], nil);
    STAssertFalse([@"asdfQWER" startsWithAny:(@[@"ASDF", @"qwer"])], nil);
}

-(void)testStripped
{
    //"    hello    ".strip   #=> "hello"
    STAssertEqualObjects(@"    hello    ".stripped, @"hello", nil);
    
    //"\tgoodbye\r\n".strip   #=> "goodbye"
    STAssertEqualObjects(@"\tgoodbye\r\n".stripped, @"goodbye", nil);
}

-(void)testSwapcased
{
    STAssertEqualObjects(@"Hello".swapcased, @"hELLO", nil); //"Hello".swapcase          #=> "hELLO"
    STAssertEqualObjects(@"cYbEr_PuNk11".swapcased, @"CyBeR_pUnK11", nil); //"cYbEr_PuNk11".swapcase   #=> "CyBeR_pUnK11"
}

-(void)testUpcased
{
    STAssertEqualObjects(@"ASDF".upcased, @"ASDF", nil);
    STAssertEqualObjects(@"aSdF".upcased, @"ASDF", nil);
    STAssertEqualObjects(@"asdf".upcased, @"ASDF", nil);
}

@end
