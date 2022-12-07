//
//  ListViewItem.h
//  InterviewTask
//
//  Created by Maneesh M on 07/12/22.
//

#ifndef ListViewItem_h
#define ListViewItem_h

typedef NS_ENUM(NSInteger, ListViewCellType) {
  user
};


@protocol ListViewItem

@property (nonatomic, readonly) NSString *displayName;
@property (nonatomic, readonly) NSString *email;
@property (nonatomic, readonly) NSString *country;
@property (nonatomic, readonly) NSString *imageUrl;

@property (nonatomic, readonly) ListViewCellType *cellType;

@end


#endif /* ListViewItem_h */
