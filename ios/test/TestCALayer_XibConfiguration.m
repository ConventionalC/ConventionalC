#import <XCTest/XCTest.h>
#import <QuartzCore/QuartzCore.h>
#import "CALayer+XibConfiguration.h"

@interface TestUIView_XibConfiguration : XCTestCase
    @property UIView* view;
@end

@implementation TestUIView_XibConfiguration

-(void)setUp
{
    self.view = UIView.new;
}

-(void)testBorderColor
{
    self.view.layer.borderUIColor = UIColor.redColor;
    XCTAssertEqualObjects(self.view.layer.borderUIColor, UIColor.redColor);
    XCTAssertEqualObjects([UIColor colorWithCGColor:self.view.layer.borderColor], UIColor.redColor);
}

@end
