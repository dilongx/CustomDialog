# CustomDialog

纯LuaJava代码编写的高度自定义对话框

</br>

### 使用说明
-------
* 无参数时可以使用[.]连接，例如：[.hide()]和[.show()]
* CustomDialog:build(theme)设置主题，必须使用[:]连接
* 已知BUG：对话框偶尔会跳动至屏幕上方、设置动画函数无效
> [使用示例](/app/src/main/assets/main.lua)</br>
> [捐赠支持](https://donate.mxd1.cn/)</br>
> [演示Demo](https://github.com/smalldi/CustomDialog/releases)

</br>

### 全局变量
-------
LICENSE  --开源协议

MATCH_PARENT  --相对父布局最大化

WRAP_CONTENT  --自适应大小

SCREEN_WIDTH  --屏幕宽度

SCREEN_HEIGHT  --屏幕高度

</br>

### 全部函数
-------
```
CustomDialog.build() --初始化
:setTitle(String title) --设置标题
:setMessage(String message) --设置内容
:addView(View) --添加控件
:setContentView(View) --设置视图
:setCancelable(boolean) --设置是否可关闭
:setRadius(Color,int topLeft,int topRight,int bottomRight,int bottomLeft) --设置背景颜色与圆角
:setGravity(Gravity.CENTER) --设置内部对齐方式
:setParams(boolean,width,height) --设置是否全屏和宽高
:enterAnimation(Animation) --打开动画，未知原因导致无效，待修复
:exitAnimation(Animation) --关闭动画，未知原因导致无效，待修复
:setButton(table,table) --添加按钮与按钮背景颜色
:setOnClick(function(dialog,view)dialog.hide()end) --设置按钮点击事件
:setOnLongClick(function(dialog,view)dialog.hide()end) --设置按钮长按事件
.show() --显示
.hide() --隐藏
```



