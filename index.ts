// main index.js

import {NativeModules, Platform} from 'react-native';

const {Xhs} = NativeModules;
const XHS = {

    init(key: string, universalLink?: string) {
        if (Platform.OS === "android") {
            Xhs.register(key, (res: any) => {
                console.log('initAMapSearch result:', res)
            });
        } else {
            Xhs.register(key, universalLink, (res: any) => {
                console.log('initAMapSearch result:', res)
            });
        }

    },

    shareImage(title: string, content: string, imageUrl: string,callback:Function) {
        // if(Platform.OS === 'ios'){
        //     Xhs.shareImage(title, content, imageUrl);
        // }else {
        // }

        Xhs.shareImage(title, content, imageUrl,callback);


    },


    shareImages(title: string, content: string, imageUrls: string[],callback:Function) {
        // if(Platform.OS === 'ios'){
        //     Xhs.shareImage(title, content, imageUrl);
        // }else {
        // }

        Xhs.shareImages(title, content, imageUrls,callback);


    },

    shareVideo(title: string, content: string, imageUrl: string, videoUrl: string,callback:Function) {
        // if(Platform.OS === 'ios') {
        //     Xhs.shareVideo(title, content, imageUrl, videoUrl);
        // }else {
        // }
        Xhs.shareVideo(title, content, imageUrl, videoUrl,callback);

    },


    isXhsInstalled(callback:Function) {
        // if(Platform.OS === 'ios') {
        //     // Xhs.shareVideo(callback);
        // }else {
        // }
        Xhs.isXhsInstalled(callback);

    }

}
export default XHS;
