//
//  ListTableViewController.h
//  InterviewTask
//
//  Created by Maneesh M on 07/12/22.
//

#import <UIKit/UIKit.h>
#import "ListViewModel.h"
#import "ListViewItem.h"

NS_ASSUME_NONNULL_BEGIN


@interface ListTableViewController : UITableViewController <ListViewModelDelegate>
@property (nonatomic, retain) ListViewModel *viewModel;

@end

NS_ASSUME_NONNULL_END
