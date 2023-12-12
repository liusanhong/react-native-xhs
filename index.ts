// main index.js

import {NativeModules, Platform} from 'react-native';
import * as Constants from "constants";

const {Xhs} = NativeModules;

export default Xhs;

export function initAMapSearch(key: string, universalLink?: string) {
    if (Platform.OS === "android") {
        Xhs.register(key, (res: any) => {
            console.log('initAMapSearch result:', res)
        });
    } else {
        Xhs.register(key, universalLink, (res: any) => {
            console.log('initAMapSearch result:', res)
        });
    }

}

export function shareImage(title: string, content: string, imageUrl: string,callback:Function) {
    if(Platform.OS === 'ios'){
        Xhs.shareImage(title, content, imageUrl);
    }else {
        Xhs.shareImage(title, content, imageUrl,callback);
    }

}

export function shareVideo(title: string, content: string, imageUrl: string, videoUrl: string,callback:Function) {
    if(Platform.OS === 'ios') {
        Xhs.shareVideo(title, content, imageUrl, videoUrl);
    }else {
        Xhs.shareVideo(title, content, imageUrl, videoUrl,callback);
    }
}


export function isXhsInstalled(callback:Function) {
    if(Platform.OS === 'ios') {
        // Xhs.shareVideo(callback);
    }else {
        Xhs.shareVideo(callback);
    }
}
