//
//  ListTableViewCell.m
//  InterviewTask
//
//  Created by Maneesh M on 07/12/22.
//

#import "UserTableViewCell.h"
#import <SDWebImage/SDWebImage.h>

@implementation UserTableViewCell
@synthesize profileImageView, nameLabel, emailLabel, countryLabel;

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
-(void)setItem:(id<ListViewItem>_Nonnull)item{
    [self.profileImageView sd_setImageWithURL:[NSURL URLWithString:item.imageUrl]
                             placeholderImage:[UIImage imageNamed:@"noImage"]];
    self.nameLabel.text = item.displayName;
    self.emailLabel.text = item.email;
    self.countryLabel.text = [NSString stringWithFormat:@"Country: %@", item.country];
}
@end
