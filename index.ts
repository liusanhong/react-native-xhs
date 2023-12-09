// main index.js

import { NativeModules } from 'react-native';

const { Xhs } = NativeModules;

export default Xhs;

export function initAMapSearch(key:string){
    Xhs.register(key,(res:any)=>{
        console.log('result:',res)
    });
}
