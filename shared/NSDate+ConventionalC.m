#import "NSDate+ConventionalC.h"

@implementation NSDate(ConventionalC)

-(NSInteger)hour
{
    return [NSCalendar.currentCalendar components:NSCalendarUnitHour fromDate:self].hour;
}

-(NSInteger)minute
{
    return [NSCalendar.currentCalendar components:NSCalendarUnitMinute fromDate:self].minute;
}

-(NSInteger)second
{
    return [NSCalendar.currentCalendar components:NSCalendarUnitSecond fromDate:self].second;
}

@end
