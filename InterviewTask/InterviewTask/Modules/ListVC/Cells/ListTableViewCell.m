//
//  ListTableViewCell.m
//  InterviewTask
//
//  Created by Maneesh M on 07/12/22.
//

#import "ListTableViewCell.h"

@implementation ListTableViewCell


- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
-(void)setItem:(id<ListViewItem>)item{
    [self setText:item.name];
}
@end
