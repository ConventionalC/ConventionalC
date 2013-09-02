#import <UIKit/UIKit.h>

@interface UITableView(ConventionalC)

+(UITableView*)tableViewWithFrame:(CGRect)bounds style:(UITableViewStyle)style;
//not implemented: -(UITableViewCell*)getReusableCellWithIdentifier:(NSString*)identifier style:(UITableViewCellStyle)style;
@property(readonly) BOOL isEmpty;
@property(readonly) BOOL isNotEmpty;
-(UITableViewCell*)cellForRow:(int)r inSection:(int)s;
-(UITableViewCell*)cellForRow:(int)r;
-(UITableViewCell*)cellForSelectedRow;
//not implemented: -(void)doForEachCellInSection:(int)s action:(ESUICellBlock)action;
//not implemented: -(void)doForEachIndexPathInSection:(int)s action:(ESUIIndexPathBlock)action;
-(void)insertRowAtIndexPath:(NSIndexPath*)indexPath withRowAnimation:(UITableViewRowAnimation)animation;
-(void)insertRow:(int)r inSection:(int)s withRowAnimation:(UITableViewRowAnimation)animation;
-(void)insertRow:(int)r withRowAnimation:(UITableViewRowAnimation)animation;
-(void)insertSection:(int)s withRowAnimation:(UITableViewRowAnimation)a;
-(void)scrollToRow:(int)r inSection:(int)s atScrollPosition:(UITableViewScrollPosition)p animated:(BOOL)a;
-(void)scrollToRow:(int)r atScrollPosition:(UITableViewScrollPosition)p animated:(BOOL)a;
-(void)reloadRowAtIndexPath:(NSIndexPath*)ip withRowAnimation:(UITableViewRowAnimation)a;
-(void)reloadRowAtIndexPath:(NSIndexPath*)ip;
-(void)deleteRowAtIndexPath:(NSIndexPath*)i withRowAnimation:(UITableViewRowAnimation)a;
-(void)deleteRow:(int)r inSection:(int)s withRowAnimation:(UITableViewRowAnimation)a;
-(void)deleteRow:(int)r withRowAnimation:(UITableViewRowAnimation)a;
-(void)selectFirstRow:(BOOL)animated;
-(void)deleteSection:(int)s withRowAnimation:(UITableViewRowAnimation)a;
-(void)deselectAll;
//not implemented: -(void)update:(ESEmptyBlock)update;

@end
