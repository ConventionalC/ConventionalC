#import "NSDate+ConventionalC.h"

@implementation NSDate(ConventionalC)

-(NSInteger)hour
{
    return [NSCalendar.currentCalendar components:kCFCalendarUnitHour fromDate:self].hour;
}

-(NSInteger)minute
{
    return [NSCalendar.currentCalendar components:kCFCalendarUnitMinute fromDate:self].minute;
}

-(NSInteger)second
{
    return [NSCalendar.currentCalendar components:kCFCalendarUnitSecond fromDate:self].second;
}

@end
