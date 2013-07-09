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

-(void)testDowncased
{
    STAssertEqualObjects(@"ASDF".downcased, @"asdf", nil);
    STAssertEqualObjects(@"aSdF".downcased, @"asdf", nil);
    STAssertEqualObjects(@"asdf".downcased, @"asdf", nil);
}

-(void)testIsEmpty
{
    STAssertTrue(@"".isEmpty, nil);
    STAssertFalse(@"asdf".isEmpty, nil);
    STAssertFalse(@" ".isEmpty, nil);
}

-(void)testIncludes
{
    STAssertTrue([@"hello" includes:@"lo"], nil);
    STAssertFalse([@"hello" includes:@"ol"], nil);
    STAssertTrue([@"hello" includes:@"h"], nil);
}

-(void)testSize
{
    STAssertEquals((int)@"".size,     0, nil);
    STAssertEquals((int)@"2".size,    1, nil);
    STAssertEquals((int)@"as".size,   2, nil);
    STAssertEquals((int)@"E2e".size,  3, nil);
    STAssertEquals((int)@"e!d ".size, 4, nil);
}

-(void)testStripped
{
    //"    hello    ".strip   #=> "hello"
    STAssertEqualObjects(@"    hello    ".stripped, @"hello", nil);
    
    //"\tgoodbye\r\n".strip   #=> "goodbye"
    STAssertEqualObjects(@"\tgoodbye\r\n".stripped, @"goodbye", nil);
}

-(void)testUpcased
{
    STAssertEqualObjects(@"ASDF".upcased, @"ASDF", nil);
    STAssertEqualObjects(@"aSdF".upcased, @"ASDF", nil);
    STAssertEqualObjects(@"asdf".upcased, @"ASDF", nil);
}

@end
