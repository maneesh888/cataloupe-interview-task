//
//  ListServiceAdaptorProtocol.h
//  InterviewTask
//
//  Created by Maneesh M on 07/12/22.
//

#import "ListViewItem.h"

#ifndef ListServiceAdaptorProtocol_h
#define ListServiceAdaptorProtocol_h

@protocol ListServiceAdaptorProtocol <NSObject>

- (void)getListWithSuccess:(void (^)(NSArray<id<ListViewItem>> *items))successCompletion error:(void (^)(NSError *error))errorCompletion;

@end


#endif /* ListServiceAdaptorProtocol_h */
