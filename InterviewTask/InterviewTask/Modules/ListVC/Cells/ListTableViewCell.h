//
//  ListTableViewCell.h
//  InterviewTask
//
//  Created by Maneesh M on 07/12/22.
//

#import <UIKit/UIKit.h>
#import "ListCellViewModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface ListTableViewCell : UITableViewCell
-(void)setItem:(ListCellViewModel*)item;
@end

NS_ASSUME_NONNULL_END
