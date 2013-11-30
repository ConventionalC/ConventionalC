#import <XCTest/XCTest.h>
#import "NSDate+ConventionalC.h"

@interface NSDate_ConventionalC_SharedTests : XCTestCase
@end

@implementation NSDate_ConventionalC_SharedTests

-(NSDate*)date { return [NSDate dateWithTimeIntervalSinceReferenceDate:2*24*60*60]; }

-(void)testDateSecond
{
    XCTAssertEqual((int)self.date.second, 0);
}

-(void)testDateMinute
{
    XCTAssertEqual((int)self.date.minute, 0);
}

-(void)testDateHour
{
    long diff = (NSTimeZone.localTimeZone.secondsFromGMT / 60l / 60l);
    //consider possible daylight savings
    XCTAssertTrue(self.date.hour == (NSInteger)(23 + diff) || self.date.hour == (NSInteger)(24 + diff));
}

@end
