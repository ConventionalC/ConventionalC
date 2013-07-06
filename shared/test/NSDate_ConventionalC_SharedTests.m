#import <SenTestingKit/SenTestingKit.h>
#import "NSDate+ConventionalC.h"

@interface NSDate_ConventionalC_SharedTests : SenTestCase
@end

@implementation NSDate_ConventionalC_SharedTests

-(NSDate*)date { return [NSDate dateWithTimeIntervalSinceReferenceDate:2*24*60*60]; }

-(void)testDateSecond
{
    STAssertEquals((int)self.date.second, 0, nil);
}

-(void)testDateMinute
{
    STAssertEquals((int)self.date.minute, 0, nil);
}

-(void)testDateHour
{
    long diff = (NSTimeZone.localTimeZone.secondsFromGMT / 60l / 60l);
    STAssertEquals(self.date.hour, (NSInteger)(23 + diff), nil);
}

@end
