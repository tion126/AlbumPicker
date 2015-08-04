AlbumPicker
===
类似于微信里集成的相册功能，可以选择要上传照片或者视频

-----
选择照片：<br>
![](https://github.com/GGGHub/AlbumPicker/raw/master/AlbumPicker/AlbumPicker.gif "选择照片")<br>
预览照片：<br>
![](https://github.com/GGGHub/AlbumPicker/raw/master/AlbumPicker/Preview.gif "预览照片")<br>

-----
**关于AlbumPicker：**
* 分别用Swift与Objective-C编写两个版本
* 可以选择相册里面的所有资源，也可以只设置选择图片
* 根据要求限制选取资源的最大数量，默认没有限制

## 安装
### Objective-C
1. 把项目里的`LSYAlbumPicker_OC`文件及里面的所有文件拷贝到其他项目中
2. 由于项目中用到很多宏定义，所以需要把`AlbumPicker-prefix.pch`里面自定义宏拷贝到其他项目中的`.pch`文件中

### Swift
_正在开发中_

## 使用
### 导入头文件
#### Objective-C

``` objective-c
#import "LSYAlbumCatalog.h"
```
在该项目里用的是自定义的导航栏，可以根据项目的需求来改变导航栏样式。所以在该项目里导入了两个头文件

``` objective-c
#import "LSYAlbumCatalog.h"
#import "LSYNavigationController.h"
```
#### Swift
*正在开发中*
### 打开相册
#### Objective-C

``` objective-c
LSYAlbumCatalog *albumCatalog = [[LSYAlbumCatalog alloc] init];
    albumCatalog.delegate = self;
    LSYNavigationController *navigation = [[LSYNavigationController alloc] initWithRootViewController:albumCatalog];
    [self presentViewController:navigation animated:YES completion:^{
    }];
```
#### Swift
_正在开发中_

### 代理实现
#### Objective-C 
实现`LSYAlbumCatalogDelegate`的方法

``` objective-c
-(void)AlbumDidFinishPick:(NSArray *)assets
{
    
}
```
其中`assets`是`ALAsset`类型的数组表示返回的所选资源
#### Swift
_正在开发中_

### 选择资源种类
#### Objective-C
选择相册中的所有资源，并且设置最多选择的数量
``` objective-c
    LSYAlbumCatalog *albumCatalog = [[LSYAlbumCatalog alloc] init];
    albumCatalog.maximumNumberOfSelectionMedia = 5;
```
只选择相册中的相片，并且设置最多选择的数量
``` objective-c
    LSYAlbumCatalog *albumCatalog = [[LSYAlbumCatalog alloc] init];
    albumCatalog.maximumNumberOfSelectionPhoto = 5;
```
#### Swift
_正在开发中_
