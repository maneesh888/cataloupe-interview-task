//
//  ListTableViewCell.h
//  InterviewTask
//
//  Created by Maneesh M on 07/12/22.
//

#import <UIKit/UIKit.h>
#import "ListViewItem.h"

NS_ASSUME_NONNULL_BEGIN

@interface ListTableViewCell : UITableViewCell
-(void)setItem:(id<ListViewItem>_Nonnull)item;
@end

NS_ASSUME_NONNULL_END
