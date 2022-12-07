//
//  ListViewModel.h
//  InterviewTask
//
//  Created by Maneesh M on 07/12/22.
//

#import <Foundation/Foundation.h>
#import "ListServiceAdaptorProtocol.h"

NS_ASSUME_NONNULL_BEGIN


@protocol ListViewModelDelegate <NSObject>

-(void)dataUpdated;
-(void)errorOccured:(NSError*) error;

@end

@interface ListViewModel : NSObject

- (id)init:(id<ListServiceAdaptorProtocol>) service;
- (void)fetchData;
@property (nonatomic,strong) id<ListServiceAdaptorProtocol> service;
@property (nonatomic, strong) NSArray<id<ListViewItem>> *items;
@property (nonatomic, weak) id<ListViewModelDelegate> delegate;

@end

NS_ASSUME_NONNULL_END
