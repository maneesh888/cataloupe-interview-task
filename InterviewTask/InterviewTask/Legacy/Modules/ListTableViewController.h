//
//  ListTableViewController.h
//  InterviewTask
//
//  Created by Maneesh M on 07/12/22.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol ListViewItem

@property (nonatomic, retain) NSString *name;
@property (nonatomic, retain) NSString *email;
@property (nonatomic, retain) NSString *country;
@property (nonatomic, retain) NSString *imageUrl;

@end


@interface ListTableViewController : UITableViewController
@property (nonatomic, retain) NSArray<ListViewItem> *dataSource;
@end

NS_ASSUME_NONNULL_END
