# CustomViewFromXib
从Xib中自定义View的最佳姿势

### 内容
* 创建View和Xib
* 设置关联xib
* 在MyCustomView.m文件添加xib的初始化
* 使用(代码和xib或者stroyboard)
* Demo

### 创建View和Xib
创建MyCustomView.h和MyCustomView.m文件
![view](https://upload-images.jianshu.io/upload_images/1292402-9d9acea31a444008.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

创建MyCustomView.xib
![xib](https://upload-images.jianshu.io/upload_images/1292402-391834f3f1714457.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

![xib](https://upload-images.jianshu.io/upload_images/1292402-6c992446638cfe02.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)


PS:三个文件名要相同

### 设置关联xib
设置可视化View的大小为活动的，可以自己设置大小
![freedom](https://upload-images.jianshu.io/upload_images/1292402-681e69ecd315327f.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

xib文件左侧，选中File's Owner，设置class为MyCustomView
![](https://upload-images.jianshu.io/upload_images/1292402-9a1a5a6aba83baf2.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

然后自定义自己的View，比如我添加了一个label和button。点击Assistant，打开与xib关联的.m文件
![code](https://upload-images.jianshu.io/upload_images/1292402-987bbf1c4bfac366.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

可以选中.h或者.m文件，添加一个view属性，把xib上的label关联到代码中的mylabel属性上。
![](https://upload-images.jianshu.io/upload_images/1292402-26f9cfd16afcacca.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

为xib的Button绑定一个点击事件在MyCustomView.m文件中，当点击Button时，对应方法能响应。
![ ](https://upload-images.jianshu.io/upload_images/1292402-77e85302a12e69ae.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

### 在MyCustomView.m文件添加xib的初始化
```
@implementation MyCustomView

/*
 以代码的方式初始化时，会通过这个方法进行初始化
 例如：[[MyCustomView alloc] init];
 */
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.view = [self loadViewFromNib];
    }
    return self;
}

/*
以xib的方式初始化时，会通过这个方法进行初始化
例如：在xib中，把view的class设置为MyCustomView
*/
- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        self.view = [self loadViewFromNib];
    }
    return self;
}

- (UIView*)loadViewFromNib {
    
    NSBundle *bundle = [NSBundle bundleForClass:[self class]];
    UINib *nib = [UINib nibWithNibName:NSStringFromClass([self class])
                                bundle:bundle];
    
    UIView *view = [nib instantiateWithOwner:self options:nil][0];
    
    view.frame = self.bounds;
    view.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    
    [self addSubview:view];
    
    return view;
    
}

- (IBAction)bntTap:(id)sender {
    
    NSLog(@"bntTap");

}

@end
```

到这来算完成了从xib中自定义view的所有工作，下面看看怎么使用吧！

### 使用
从代码中初始化
在viewcontroller中先初始化，然后设置frame，最后添加到viewcontroller的view上就可以了。
```
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self setupView];
    
}

- (void)setupView {
    
    self.myCodeView = [[MyCustomView alloc] init];
    self.myCodeView.frame = CGRectMake(0, 0, 200, 200);
    self.myCodeView.center = self.view.center;
    self.myCodeView.myLabel.text = @"哈哈哈哈";
    [self.view addSubview:self.myCodeView];
    
}
```

Storyboard中或者xib中的使用
在storyboard中的viewcontroller中加入一个View控件，然后设置View的class为MyCustomView
![](https://upload-images.jianshu.io/upload_images/1292402-4bf7634724e17b79.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

如果要修改MyCustomView，可以在viewcontroller上引用它
![](https://upload-images.jianshu.io/upload_images/1292402-8c9d081f8475d025.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

最后看两种初始化的效果
![](https://upload-images.jianshu.io/upload_images/1292402-64b892efb60f04f1.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
