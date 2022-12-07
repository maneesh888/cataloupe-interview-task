//
//  ListViewModel.m
//  InterviewTask
//
//  Created by Maneesh M on 07/12/22.
//

#import "ListViewModel.h"
#import "ListViewItem.h"


@implementation ListViewModel
@synthesize service;
@synthesize delegate;

- (id)init:(id<ListServiceAdaptorProtocol>) service;
{
    self = [super init];
    if (self) {
        self.items = @[];
        self.service = service;
    }
    return self;
}





- (void)fetchData  {
    
    [service getListWithSuccess:^(NSArray<id<ListViewItem>> *items) {
            self.items = items;
            if (self.delegate != NULL) {
                [self.delegate dataUpdated];
            }
        } error:^(NSError *error) {
            if (self.delegate != NULL) {
                [self.delegate errorOccured:error];
            }
        }];
    
}
@end
