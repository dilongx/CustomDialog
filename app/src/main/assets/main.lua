require "import"
import "android.os.*"
import "android.app.*"
import "android.view.*"
import "android.widget.*"

import "library.CustomDialog"


activity.setContentView(loadlayout"layout.main")


----****---- 全部函数 ----****----
--[[
-- 公共变量
LICENSE  --开源协议
MATCH_PARENT  --相对父布局最大化
WRAP_CONTENT  --自适应大小
SCREEN_WIDTH  --屏幕宽度
SCREEN_HEIGHT  --屏幕高度


CustomDialog.build() --初始化
:setTitle("标题") --设置标题
:setMessage(LICENSE) --设置内容
:addView(TextView(this)) --添加控件
:setContentView({TextView,text="内容"}) --设置视图
:setCancelable(false) --设置是否可关闭
:setRadius(Color.WHITE,10,10,10,10) --设置背景颜色与圆角
:setGravity(Gravity.CENTER) --设置内部对齐方式
:setParams(true) --设置是否全屏和宽高
:enterAnimation() --打开动画
:exitAnimation() --关闭动画
:setButton({"关闭","取消","确定"},{0xff643154}) --添加按钮与按钮背景颜色
:setOnClick(function(dialog,view)dialog.hide()end) --设置按钮点击事件
:setOnLongClick(function(dialog,view)dialog.hide()end) --设置按钮长按事件
.show() --显示
.hide() --隐藏
]]


----****---- 使用说明 ----****----
--[[
------- 无参数时可以使用.连接，例如：.hide()和.show()
------- CustomDialog:build(theme) 可以设置主题，但必须使用:连接
------- 已知BUG：对话框偶尔会跳动至屏幕上方、设置动画函数无效、
]]


-- 简化底部对话框
function BottomDialog(t)
  return CustomDialog.build()
  :setTitle(t.title or "标题")
  :setRadius(Color.WHITE,10,10)
  :setMessage(t.message or "内容")
  :setCancelable(t.cancelable or false)
  :addButton(t.button or {"关闭"},t.buttonColor)
  --:setGravity(Gravity.CENTER)
  --:setParams(true)
  --:enterAnimation()
  --:exitAnimation()
  :setOnClick(t.onClick)
  --:setOnLongClick(function(dialog,view)dialog.hide()end)
end


-- 简化居中对话框
function CenterDialog(t)
  local width = activity.getWidth()
  return CustomDialog.build()
  :enterAnimation(nil,0,10000,0,0)
  :exitAnimation(nil,0,0,0,0)
  :setTitle(t.title or "标题")
  :setRadius(Color.WHITE,10,10,10,10)
  :setMessage(t.message or "内容")
  :setCancelable(t.cancelable or false)
  :addButton(t.button or {"关闭"},t.buttonColor)
  :setGravity(Gravity.CENTER)
  :setParams(true,width-200)

  :setOnClick(t.onClick)
  --:setOnLongClick(function(dialog,view)dialog.hide()end)
end


function ClickEvent(view)
  switch(view.Text)
   case "底部对话框"
    BottomDialog{
      title="开源协议",
      message=LICENSE,
      cancelable=false,
      button={"关闭","知道了"},
      buttonColor={0xff359461},
      onClick=function(dialog,view)
        dialog.hide()
        switch(view.Text)

        end
      end
    }.show()
  
   case "居中对话框"
    CenterDialog{
      title="开源协议",
      message=LICENSE,
      cancelable=false,
      button={"关闭","知道了"},
      buttonColor={0xff359461},
      onClick=function(dialog,view)
        dialog.hide()
        
      end
    }.show()
  
   case "全屏对话框"
    local view = CustomDialog.build()
    :setTitle("开源协议")
    :addView({
      TextView,
      text=LICENSE,
      padding="32dp";
    })
    :addButton({"关闭"},{0xff359461})
    :setRadius(Color.WHITE)
    :setParams(true,MATCH_PARENT,MATCH_PARENT)
    .show()

  end
end










