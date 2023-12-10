// Xhs.m

#import "Xhs.h"

#import <XiaoHongShuOpenSDK/XHSApi.h>
@implementation Xhs

RCT_EXPORT_MODULE()



RCT_EXPORT_METHOD(register:(NSString *)key :(NSString *)universalLink :(RCTResponseSenderBlock)onSuccess) {
    dispatch_async(dispatch_get_main_queue(), ^{
        [XHSApi registerApp:key universalLink:universalLink delegate:self];
    });

}


RCT_EXPORT_METHOD(shareImage:(NSString *)title :(NSString *)content :(NSString *)imageUrl) {

    dispatch_async(dispatch_get_main_queue(), ^{

        XHSOpenSDKShareRequest *shareRequest = [[XHSOpenSDKShareRequest alloc] init];
        shareRequest.mediaType = XHSOpenSDKShareMediaTypeImage;
        NSMutableArray<XHSShareInfoImageItem *> *imageResources = [NSMutableArray array];
        XHSShareInfoImageItem *imageObject = [[XHSShareInfoImageItem alloc] init];
        /// 图片远程url 或者本地沙盒路径
        imageObject.imageUrl = imageUrl;

        XHSShareInfoTextContentItem * textItem = [[XHSShareInfoTextContentItem alloc]init];
        textItem.title = title;
        textItem.content = content;
        [imageResources addObject:imageObject];
        shareRequest.textContentItem = textItem;
        shareRequest.imageInfoItems = imageResources;
        [XHSApi sendRequest:shareRequest completion:^(BOOL success) {

        }];

    });

}


RCT_EXPORT_METHOD(shareVideo:(NSString *)title :(NSString *)content :(NSString *)imageUrl :(NSString *)videoUrl) {

    dispatch_async(dispatch_get_main_queue(), ^{

        XHSOpenSDKShareRequest *shareRequest = [[XHSOpenSDKShareRequest alloc] init];
        shareRequest.mediaType = XHSOpenSDKShareMediaTypeVideo;

        /// 视频
        NSMutableArray<XHSShareInfoVideoItem *> *videoResources = [NSMutableArray array];

        XHSShareInfoVideoItem *videoObject = [[XHSShareInfoVideoItem alloc] init];
        /// 视频
        videoObject.videoUrl = videoUrl;
        /// 视频封面
        videoObject.coverUrl = imageUrl;
        XHSShareInfoTextContentItem *messageObject = [[XHSShareInfoTextContentItem alloc] init];
        messageObject.title = title;
        messageObject.content = content;

        [videoResources addObject:videoObject];
            shareRequest.videoInofoItems = videoResources;
        [XHSApi sendRequest:shareRequest completion:^(BOOL success) {

        }];

    });

}

@end
