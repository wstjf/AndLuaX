require "import"
import "android.app.*"
import "android.os.*"
import "android.widget.*"
import "android.view.*"
import "AndLuaX"
import "java.io.File"
import "other"
import "color"
import "color1"
import "main10"
import "android.graphics.drawable.ColorDrawable"
import "android.graphics.drawable.StateListDrawable"
import "android.graphics.PorterDuffColorFilter"
import "android.graphics.PorterDuff"
import "Dialog"
import "toast"
local a=io.open(activity.getLuaDir().."/Verify/set4.XY"):read("*a")
local ip=a:match("2(.-)"..'"')
if ip=="开" then
  颜色1=0xff303030
  颜色2=0xff212121
  颜色3=0xffffffff
  颜色4=0xffffffff
  颜色6=0xffffffff
  颜色5=0xff212121
  颜色7=0xEBFFFFFF
  activity.setTheme(android.R.style.Theme_DeviceDefault_NoActionBar)
 else
  颜色1=0xffffffff
  颜色3=0xff303030
  颜色4=0xff757575
  颜色2=0xFFF2F1F6
  颜色6=0xff757575
  颜色5=0x5FFFFFFF
  颜色7=0xff303030
  activity.setTheme(android.R.style.Theme_DeviceDefault_Light_NoActionBar)
end



layout2={
  LinearLayout;
  layout_width="fill";
  orientation="vertical";
  layout_height="fill";
  backgroundColor=颜色1;
  id="c",
  {
    RelativeLayout;
    layout_width="match_parent";
    layout_height="match_parent";
    backgroundColor=颜色1;
    id="cc",
    {
      LinearLayout;
      backgroundColor=颜色1;
      id="ccc",
      orientation="horizontal";
      layout_width="fill";
      layout_height="60dp";
      {
        ImageView;
        src="res/AndLuaXY1.png";
        id="其他1x";
        ColorFilter="0xFF03A9F4";
        layout_gravity="center";
        layout_width="25dp";
        layout_marginLeft="13dp";
        layout_height="30dp";
      };
      {
        LinearLayout;
        layout_width="100dp";
        orientation="vertical";
        layout_height="fill";
        layout_marginLeft="10dp";
        gravity="center";

        {
          TextView;
          textSize="18sp";
          textColor="0xFF03A9F4";
          layout_marginLeft="10dp";
          singleLine=true;
          id="xy22";
          ellipsize="marquee";
          focusable=true;
          focusableInTouchMode=true;
          layout_width="90dp";
          text="编辑器";
        };
        {
          TextView;
          layout_width="70dp";
          textColor="0xFF03A9F4";
          focusableInTouchMode=true;
          singleLine=true;
          id="xy33";
          ellipsize="marquee";
          layout_marginTop="2dp";
          focusable=true;
          text="main.lua";
        };
      };
      {
        ImageView;
        src="res/AndLuaXY2.png";
        id="布局助手";
        ColorFilter="0xFF03A9F4";
        layout_gravity="center";
        layout_width="25dp";
        layout_marginLeft="10dp";
        layout_height="30dp";
      };
      {
        ImageView;
        src="res/AndLuaXY3.png";
        id="运行";
        ColorFilter="0xFF03A9F4";
        layout_gravity="center";
        layout_width="25dp";
        layout_marginLeft="17dp";
        layout_height="30dp";
      };
      {
        ImageView;
        src="res/AndLuaXY4.png";
        id="撤销";
        ColorFilter="0xFF03A9F4";
        layout_gravity="center";
        layout_width="25dp";
        layout_marginLeft="17dp";
        layout_height="30dp";
      };
      {
        ImageView;
        src="res/AndLuaXY5.png";
        id="恢复";
        ColorFilter="0xFF03A9F4";
        layout_gravity="center";
        layout_width="25dp";
        layout_marginLeft="17dp";
        layout_height="30dp";
      };
      {
        ImageView;
        src="res/AndLuaXY6.png";
        id="其他2x";
        ColorFilter="0xFF03A9F4";
        layout_gravity="center";
        layout_width="25dp";
        layout_marginLeft="17dp";
        layout_height="30dp";
      };
    };
    {
      LinearLayout;
      layout_width="fill";
      id="选择代码1";
      visibility=8;
      backgroundColor=颜色1;
      layout_height="60dp";
      {
        ImageView;
        src="res3/1.png";
        id="XY01";
        ColorFilter="0xFF03A9F4";
        layout_gravity="center";
        layout_width="30dp";
        layout_marginLeft="10dp";
        layout_height="30dp";
      };
      {
        TextView;
        textSize="18sp";
        layout_gravity="center";
        textColor="0xFF03A9F4";
        layout_marginLeft="15dp";
        text="选择代码";
      };
      {
        ImageView;
        src="res3/2.png";
        id="XY11";
        ColorFilter="0xFF03A9F4";
        layout_gravity="center";
        layout_width="29dp";
        layout_marginLeft="30dp";
        layout_height="29dp";
      };
      {
        ImageView;
        src="res3/3.png";
        id="XY21";
        ColorFilter="0xFF03A9F4";
        layout_gravity="center";
        layout_width="25dp";
        layout_marginLeft="25dp";
        layout_height="25dp";
      };
      {
        ImageView;
        src="res3/4.png";
        id="XY31";
        ColorFilter="0xFF03A9F4";
        layout_gravity="center";
        layout_width="25dp";
        layout_marginLeft="25dp";
        layout_height="25dp";
      };
      {
        ImageView;
        src="res3/5.png";
        id="XY41";
        ColorFilter="0xFF03A9F4";
        layout_gravity="center";
        layout_width="25dp";
        layout_marginLeft="25dp";
        layout_height="25dp";
      };
    };
    {
      LinearLayout;
      layout_width="fill";
      id="转到";
      visibility=8;
      backgroundColor=颜色1;
      layout_height="60dp";
      {
        ImageView;
        src="res3/1.png";
        id="关闭转到";
        ColorFilter="0xFF03A9F4";
        layout_gravity="center";
        layout_width="30dp";
        layout_marginLeft="10dp";
        layout_height="30dp";
      };
      {
        TextView;
        textSize="16sp";
        layout_gravity="center";
        textColor="0xFF03A9F4";
        layout_marginLeft="15dp";
        text="转到";
      };
      {
        LinearLayout;
        layout_width="match_parent";
        gravity="right";
        layout_gravity="center";
        layout_height="match_parent";
        {
          EditText;
          textSize="15sp";
          id="转到行数";
          textColor=颜色4,
          singleLine="true";
          layout_gravity="center";
          layout_width="140dp";
          gravity="center";
        };
        {
          Button;
          layout_width="70dp";
          textSize="12sp";
          id="确定转到";
          layout_height="match_parent";
          backgroundColor="0";
          textColor="0xFF03A9F4";
          layout_gravity="center";
          text="确定";
        };
      };
    };
    {
      LinearLayout;
      layout_width="fill";
      id="搜索";
      visibility=8;
      backgroundColor=颜色1;
      layout_height="60dp";
      {
        ImageView;
        src="res3/1.png";
        id="关闭搜索";
        ColorFilter="0xFF03A9F4";
        layout_gravity="center";
        layout_width="30dp";
        layout_marginLeft="10dp";
        layout_height="30dp";
      };
      {
        TextView;
        textSize="16sp";
        layout_gravity="center";
        textColor="0xFF03A9F4";
        layout_marginLeft="15dp";
        text="搜索";
      };
      {
        LinearLayout;
        layout_width="match_parent";
        gravity="right";
        layout_gravity="center";
        layout_height="match_parent";
        {
          EditText;
          textSize="15sp";
          id="搜索字符";
          textColor=颜色4,
          singleLine="true";
          layout_gravity="center";
          layout_width="140dp";
          gravity="center";
        };
        {
          Button;
          layout_width="70dp";
          textSize="12sp";
          id="确定搜索";
          layout_height="match_parent";
          backgroundColor="0";
          textColor="0xFF03A9F4";
          layout_gravity="center";
          text="搜索";
        };
      };
    };
    {
      LinearLayout;
      layout_width="match_parent";
      layout_height="match_parent";
      layout_marginTop="60dp";
      {
        DrawerLayout;
        id="左侧滑";
        layout_width="fill";
        layout_height="fill";
        {
          RelativeLayout;
          id="cf",
          {
            LinearLayout;
            orientation="vertical";
            layout_width="match_parent";

            {
              RelativeLayout;
              layout_width="fill";
              backgroundColor=颜色1;
              layout_height="4%h";

              {
                HorizontalScrollView;
                horizontalScrollBarEnabled=false;
                backgroundColor=颜色1;
                id="cccc";
                layout_width="fill";
                layout_height="fill";
                {
                  LinearLayout;
                  layout_width="fill";
                  id="bar2";
                  layout_height="fill";
                };

              };
              {
                LinearLayout;
                layout_width="match_parent";
                id="错误提示";
                Visibility=8,
                backgroundColor="0xFFFF0000";
                layout_height="4%h";
                {
                  TextView;
                  id="错误文字";
                  layout_gravity="center";
                  textColor="0xffffffff";
                  layout_marginLeft="10dp";
                  text="错误提示";
                };
              };
            };
            {
              RelativeLayout;
              layout_width="fill";
              backgroundColor=颜色1;
              id="ccccc";
              layout_height="4%h";
              {
                HorizontalScrollView;
                horizontalScrollBarEnabled=false;
                backgroundColor=颜色1;
                id="cccccc";
                layout_width="fill";
                layout_height="fill";
                {
                  LinearLayout;
                  layout_width="fill";
                  id="bar3";
                  layout_height="fill";

                };
              };
            };
            {
              LuaEditor;
              TextSize="12sp";
              layout_width="fill";
              id="editor";
              backgroundColor=颜色5,
              layout_height="fill";
            };
          };
          {
            LinearLayout;
            layout_width="fill";
            layout_height="6%h";
            layout_alignParentBottom="true";
            {
              HorizontalScrollView;
              horizontalScrollBarEnabled=false;
              backgroundColor=颜色1;
              layout_width="fill";
              layout_height="fill";
              {
                LinearLayout;
                layout_width="fill";
                id="bar";
                layout_height="fill";
              }
            };
          };
        };
        {
          LinearLayout;
          layout_gravity="left",
          layout_width="match_parent";
          background="0";
          layout_height="match_parent";
          {
            LinearLayout;
            layout_width="match_parent";
            layout_height="match_parent";
            {
              LinearLayout;
              layout_width="280dp";
              backgroundColor=颜色2;
              orientation="vertical";
              layout_height="match_parent";
              {
                CardView;
                layout_marginTop="10dp";
                layout_gravity="center";
                layout_height="50dp";
                layout_width="260dp";
                CardElevation=0;
                radius=25;
                backgroundColor=颜色1;

                {
                  LinearLayout;
                  layout_width="match_parent";
                  gravity="center";
                  orientation="vertical";
                  layout_height="match_parent";
                  id="ch",
                  {
                    TextView;
                    textColor=颜色4,
                    textSize="16sp";
                    text="文件资源列表";
                  };
                  {
                    TextView;
                    textColor=颜色4,
                    ellipsize="marquee";
                    focusableInTouchMode=true;
                    focusable=true;
                    singleLine=true;
                    layout_width="240dp",
                    layout_height="15dp";
                    textSize="10sp";
                    text="路径";
                    layout_marginTop="5dp";
                    id="cp";
                  };
                };
              };
              {
                ListView;
                layout_height="fill";
                layout_width="fill";
                DividerHeight=0;
                id="lv";
                layout_marginTop="5dp";
              };
            };
          },
        };
      };
    };
  };
};

activity.setContentView(loadlayout(layout2))


import "android.graphics.Typeface"
local Text_Type=Typeface.defaultFromStyle(Typeface.BOLD)
local sd = StateListDrawable()
import "android.graphics.Color"
import "android.content.res.ColorStateList"
import "android.graphics.drawable.RippleDrawable"
import "android.content.Context"
appt={C_Bacgg=function(mBinding,radiu,InsideColor,S,S2,T1)
    local drawable = GradientDrawable(GradientDrawable.Orientation.TOP_BOTTOM,{});
    drawable.setCornerRadius(radiu);
    drawable.setColor(颜色5)
    drawable.setStroke(3,0xCFB0B0B0)
    drawable.setGradientType(GradientDrawable.RECTANGLE);
    mBinding.setTextColor(T1)
    mBinding.setTypeface(Text_Type)
    return drawable
  end}
美化按钮2=function(mBinding,radiu,InsideColor,T1)
  stateList = {
    {android.R.attr.state_pressed},
    {android.R.attr.state_focused},
    {android.R.attr.state_activated},
    {android.R.attr.selectableItemBackground},
  };
  sd.addState({ android.R.attr.state_enabled}, appt.C_Bacgg(mBinding,radiu,InsideColor,S,S2,T1))
  pressedColor =InsideColor 
  stateColorList ={
    pressedColor,
    pressedColor,
    pressedColor,
    normalColor
  };
  colorStateList = ColorStateList(stateList, stateColorList);
  rippleDrawable = RippleDrawable(colorStateList,sd,nil);
  mBinding.setBackground(rippleDrawable);
end

function ToStringEx(value)
  if type(value)=='table' then
    return TableToStr(value)
   elseif type(value)=='string' then
    return "\'"..value.."\'"
   else
    return tostring(value)
  end
end

function TableToStr(t)
  if t == nil then return "" end
  local retstr= "{"

  local i = 1
  for key,value in pairs(t) do
    local signal = ","
    if i==1 then
      signal = ""
    end

    if key == i then
      retstr = retstr..signal..ToStringEx(value)
     else
      if type(key)=='number' or type(key) == 'string' then
        retstr = retstr..signal..'['..ToStringEx(key).."]="..ToStringEx(value)
       else
        if type(key)=='userdata' then
          retstr = retstr..signal.."*s"..TableToStr(getmetatable(key)).."*e".."="..ToStringEx(value)
         else
          retstr = retstr..signal..key.."="..ToStringEx(value)
        end
      end
    end

    i = i+1
  end

  retstr = retstr.."}"
  return retstr
end

function StrToTable(str)
  if str == nil or type(str) ~= "string" then
    return
  end

  return loadstring("return " .. str)()
end

kj={}
kjk={}
kjkj={}
项目名称,状态,项目名,多了个=...
function filezxb(path)
  local f=io.open(path,'r')
  if f~=nil then
  io.close(f)
  return true
  else
  return false
  end
end
function getCacheDir()
  return "/data/user/0/"..activity.getPackageName().."/cache/"
end
local 快捷文件列表 = {}
是否在项目目录 = true
function 返回当前路径()
  for i=1,#快捷文件列表 do
    if tostring(File(快捷文件列表[i]).Name) == xy33.text then
      if tostring(File(快捷文件列表[i]).getParentFile()) == 项目名称 then
        if 是否在项目目录 == true then
          return tostring(快捷文件列表[i])
        end
       else
        if 是否在项目目录 == false then
          return tostring(快捷文件列表[i])
        end
      end
    end
  end
  return 项目名称.."/"..xy33.text
end
switch filezxb("/sdcard/AndLuaX+/cache/")
 case true
 default
  os.execute("mkdir /sdcard/AndLuaX+/cache")
end
function 保存()
  local json = require "cjson"
  写入文件(返回当前路径(),editor.text)
  local test = io.open(getCacheDir().."/"..项目名..".ini","w")
  result = json.encode(kjkj)
  test:write(项目名.."!!"..result.."!!".."\n")
  test:close()
  写入文件("/sdcard/AndLuaX+/cache/"..File(项目名称).Name..".lua",TableToStr(快捷文件列表))
end
function save()
  写入文件(项目名称.."/"..xy33.text,editor.text)
end


function 初始化快捷栏()
  local 缓存路径 = "/storage/emulated/0/AndLuaX+/cache/"..File(项目名称).Name..".lua"
  if filezxb(缓存路径) == false then
    table.insert(快捷文件列表,项目名称.."/main.lua")
    table.insert(快捷文件列表,项目名称.."/init.lua")
   else local 内容 = io.open(缓存路径):read("*a") if (内容 == "") then
      table.insert(快捷文件列表,项目名称.."/main.lua")
      table.insert(快捷文件列表,项目名称.."/init.lua")
     else if (内容 == nil) then
        table.insert(快捷文件列表,项目名称.."/main.lua")
        table.insert(快捷文件列表,项目名称.."/init.lua")
       else
        快捷文件列表 = StrToTable(内容)
      end
    end
  end
  加载快捷栏()
end

function 加载快捷栏()
  bar3.removeAllViews()
  for i数量 = 1,#快捷文件列表 do
    local 快捷文件布局字体颜色 = 颜色4
    local 表文件 = File(快捷文件列表[i数量])
    if tostring(表文件.Name) == xy33.text then
      if (tostring(表文件.getParentFile()) != tostring(项目名称)) then
        if 是否在项目目录 == false then
          快捷文件布局字体颜色 = 0xFF03A9F4
        end
       else
        if 是否在项目目录 == true then
          快捷文件布局字体颜色 = 0xFF03A9F4
        end
      end
    end
    local 快捷文件布局文字 = 表文件.Name
    if (tostring(表文件.getParentFile()) != tostring(项目名称)) then
      快捷文件布局文字 = tostring(表文件.getParentFile().Name).."/"..表文件.Name
    end
    button3={
      Button;
      text=快捷文件布局文字;
      layout_width="fill";
      layout_height="fill";
      background="#ffffff";
      padding="5dp",
      id="sssssw",
      textColor=快捷文件布局字体颜色,
      AllCaps=false,
    };
    m3=loadlayout(button3)
    bar3.addView(m3)
    波纹(sssssw,0xE7EAEEEE)
    m3.onClick=function(v)
      保存()
      if (tostring(表文件.getParentFile()) != tostring(项目名称)) then
        是否在项目目录 = false
       else
        是否在项目目录 = true
      end editor.text=io.open(tostring(快捷文件列表[i数量])):read("*a")
      xy33.text=tostring(表文件.Name)
      加载快捷栏()
    end
    m3.onLongClick=function(v)
      保存()
      local cj={
        CardView;
        radius=30;
        layout_width="match_parent";

        layout_height="match_parent";
        {
          CardView;
          layout_gravity="center";
          layout_height="350dp";
          layout_width="match_parent";
          
          
          {
            TextView;
            layout_marginTop="15dp";
            text="标签操作";
            layout_marginLeft="20dp";
            textColor="0xFF03A9F4";
            textSize="20sp";
          };
          {
            LinearLayout;
            layout_height="match_parent";
            layout_width="match_parent";
            {
              Button;
              textColor="0x7E000000";
              layout_gravity="center";
              text="关闭标签";
              layout_height="40dp";
              layout_marginBottom="5dp";
              id="关闭标签";
              layout_marginLeft="10dp";
            };

            {
              Button;
              layout_marginLeft="20dp";
              textColor="0xFF03A9F4";
              text="重命名文件";
              layout_height="40dp";
              layout_marginBottom="5dp";
              id="重命名文件";
              layout_gravity="center";
            };


            {
              LinearLayout;
              layout_height="match_parent";
              layout_width="match_parent";
              gravity="right";
              {
                Button;
                layout_marginRight="10dp";
                textColor="0xFF03A9F4";
                text="删除文件";
                layout_height="40dp";
                layout_marginBottom="5dp";
                id="删除文件";
                layout_gravity="center";

              };
            };
          };
        };
      };
      dialog= AlertDialog.Builder(this)
      dialog1=dialog.show()
      dialog1.getWindow().setContentView(loadlayout(cj));
      dialog1.getWindow().setBackgroundDrawable(ColorDrawable(0x00000000));
      local dialogWindow = dialog1.getWindow();
      dialogWindow.setGravity(Gravity.BOTTOM);
      dialog1.getWindow().getAttributes().width=(activity.Width);
      dialog1.getWindow().clearFlags(WindowManager.LayoutParams.FLAG_ALT_FOCUSABLE_IM);
      local x=nil
      美化按钮2(关闭标签,10,0x7E000000,颜色7)
      美化按钮2(重命名文件,10,0x7E000000,颜色7)
      美化按钮2(删除文件,10,0x7E000000,颜色7)
      function 关闭标签.onClick()
        if tostring(表文件.getParentFile()) == 项目名称 then
          switch 表文件.Name
           case "main.lua"
            print("请勿关闭main.lua")
            dialog1.dismiss()
           case "init.lua"
            print("请勿关闭init.lua")
            dialog1.dismiss()
           case xy33.text
            print("请勿关闭正在编辑的文件")
            dialog1.dismiss()
           default
            table.remove(快捷文件列表,i数量)
            加载快捷栏()
            print("关闭成功")
            dialog1.dismiss()
          end
         else
          table.remove(快捷文件列表,i数量)
          加载快捷栏()
          print("关闭成功")
          dialog1.dismiss()
        end
      end
      function 删除文件.onClick()
        if tostring(表文件.getParentFile()) == 项目名称 then
          switch 表文件.Name
           case "main.lua"
            print("请勿删除main.lua")
            dialog1.dismiss()
           case "init.lua"
            print("请勿删除init.lua")
            dialog1.dismiss()
           case xy33.text
            print("请勿删除正在编辑的文件")
            dialog1.dismiss()
           default
            local luaconf = luajava.luadir.."/"..项目名.."-X"
            pcall(dofile,luaconf)
            os.execute("rm -r "..快捷文件列表[i数量])
            table.remove(快捷文件列表,i数量)
            加载快捷栏()
            print("删除成功")
            dialog1.dismiss()
          end
         else
          local luaconf = luajava.luadir.."/"..项目名.."-X"
          pcall(dofile,luaconf)
          os.execute("rm -r "..快捷文件列表[i数量])
          table.remove(快捷文件列表,i数量)
          加载快捷栏()
          print("删除成功")
          dialog1.dismiss()
        end
      end
      function 重命名文件.onClick()
        dialog1.dismiss()
        local cmm={
          CardView;
          radius=30;
          layout_width="match_parent";
          layout_height="match_parent";
          {
            CardView;
            layout_gravity="center";
            layout_height="350dp";
            layout_width="match_parent";
            backgroundColor=颜色1,
            radius=20;
            {
              TextView;
              layout_marginTop="15dp";
              text="重命名";
              layout_marginLeft="20dp";
              textColor="0xFF03A9F4";
              textSize="20sp";
            };
            {
              LinearLayout;
              layout_height="180dp";
              layout_width="match_parent";
              orientation="horizontal";
              gravity="center";
              {
                EditText;
                layout_width="150dp";
                hint="请输入文件名称";
                textSize="15sp";
                
                textColor=颜色3,
                id="输入文件名称";
                gravity="center";
              };
              {
                Spinner;
                layout_marginLeft="10dp";
                items={
                  ".lua";
                  ".aly";
                  ".txt";
                };
                id="类型";
                layout_gravity="center";
              };
            };
            {
              LinearLayout;
              layout_height="match_parent";
              layout_width="match_parent";
              {
                Button;
                textColor="0x7E000000";
                layout_gravity="center";
                text="取消";
                layout_height="40dp";
                layout_marginBottom="5dp";
                id="取消";
                layout_marginLeft="10dp";
              };
              {
                LinearLayout;
                layout_height="match_parent";
                layout_width="match_parent";
                gravity="right";
                {
                  Button;
                  layout_marginRight="10dp";
                  textColor="0xFF03A9F4";
                  text="重命名";
                  layout_height="40dp";
                  layout_marginBottom="5dp";
                  id="重命名";
                  layout_gravity="center";
                };
              };
            };
          };
        };
        dialog= AlertDialog.Builder(this)
        dialog1=dialog.show()
        dialog1.getWindow().setContentView(loadlayout(cmm));
        dialog1.getWindow().setBackgroundDrawable(ColorDrawable(0x00000000));
        local dialogWindow = dialog1.getWindow();
        dialogWindow.setGravity(Gravity.BOTTOM);
        dialog1.getWindow().getAttributes().width=(activity.Width);
        dialog1.getWindow().clearFlags(WindowManager.LayoutParams.FLAG_ALT_FOCUSABLE_IM);
        local x=nil
        美化按钮2(取消,10,0x7E000000,颜色7)
        美化按钮2(重命名,10,0x7E000000,颜色7)
        控件圆角(输入文件名称,颜色2,30)
        类型.onItemSelected=function(l,v,p,i)
          x=v.text
        end
        function 取消.onClick()
          dialog1.dismiss()
        end
        function 重命名.onClick()
          if tostring(表文件.getParentFile()) == 项目名称 then
            switch 表文件.Name
             case "main.lua"
              print("请勿重命名main.lua")
              dialog1.dismiss()
             case "init.lua"
              print("请勿重命名init.lua")
              dialog1.dismiss()
             case xy33.text
              print("请勿重命名正在编辑的文件")
              dialog1.dismiss()
             default
              os.execute("mv "..快捷文件列表[i数量].." "..tostring(表文件.getParentFile()).."/"..输入文件名称.Text..x)
              快捷文件列表[i数量] = tostring(表文件.getParentFile()).."/"..输入文件名称.Text..x
              加载快捷栏()
              print("重命名成功")
              dialog1.dismiss()
            end
           else
            os.execute("mv "..快捷文件列表[i数量].." "..tostring(表文件.getParentFile()).."/"..输入文件名称.Text..x)
            快捷文件列表[i数量] = tostring(表文件.getParentFile()).."/"..输入文件名称.Text..x
            加载快捷栏()
            print("重命名成功")
            dialog1.dismiss()
          end
        end
      end
    end
  end
end




local itemq={
  LinearLayout;
  background="0";
  layout_width="match_parent";
  layout_height="match_parent";
  {
    LinearLayout;
    layout_width="match_parent";
    gravity="center";
    layout_height="match_parent";
    {
      LinearLayout;
      layout_width="280dp";
      gravity="center";
      orientation="vertical";
      layout_height="60dp";
      {
        CardView;
        backgroundColor=颜色1;
        CardElevation="0dp";
        radius=25;
        layout_width="260dp";
        layout_height="50dp";
        {
          LinearLayout;
          layout_width="fill";
          gravity="center";
          layout_height="match_parent";
          {
            LinearLayout;
            layout_width="50dp";
            gravity="center";
            layout_height="match_parent";
            {
              ImageView;
              layout_width="35dp";
              src="res2/file.png";
              id="wjlx";
              ColorFilter=颜色6,
              layout_height="35dp";
            };
          };
          {
            LinearLayout;
            layout_width="match_parent";
            layout_height="match_parent";
            {
              TextView;
              textColor=颜色4,
              id="wjm",
              layout_gravity="center";
              text="main.lua";
              textSize="15sp";
            };
            {
              TextView;
              
              id="sb",
              
              
              textSize="0sp";
            };

          };
        };
      };
    };
  };
};

switch filezxb(getCacheDir().."/"..项目名.."-X")
 case false
  local luaconf = getCacheDir().."/"..项目名.."-X" io.open(luaconf,"w"):write([[luaname="]]..xy33.text..[["]]..'\nluapath="'..项目名称.."/"..xy33.text..[["]]..'\nlast='..editor.getSelectionEnd()):close()
  pcall(dofile,luaconf)
  editor.text=io.open(luapath):read("*a")
  xy33.text=luaname
  
  初始化快捷栏()
 default
  switch io.open(getCacheDir().."/"..项目名.."-X"):read("*a")
   case ""
    local luaconf = getCacheDir().."/"..项目名.."-X"
    io.open(luaconf,"w"):write([[luaname="]]..xy33.text..[["]]..'\nluapath="'..项目名称.."/"..xy33.text..[["]]..'\nlast='..editor.getSelectionEnd()):close()

    pcall(dofile,luaconf)
    editor.text=io.open(luapath):read("*a")
    xy33.text=luaname
    
    初始化快捷栏()
   default
    local luaconf = getCacheDir().."/"..项目名.."-X"
    pcall(dofile,luaconf)
    editor.text=io.open(luapath):read("*a")
    xy33.text=luaname
    
    初始化快捷栏()
  end
end
switch filezxb(getCacheDir().."/"..项目名.."-X")
 case true
  local luaconf = getCacheDir().."/"..项目名.."-X"
  pcall(dofile,luaconf)
  switch luapath
   case 项目名称.."/"..xy33.text
    editor.setSelection(last)
   default
    local luaconf = getCacheDir().."/"..项目名.."-X"
    io.open(luaconf,"w"):write([[luaname="]]..xy33.text..[["]]..'\nluapath="'..项目名称.."/"..xy33.text..[["]]..'\nlast='..editor.getSelectionEnd()):close()
  end
 default
  local luaconf = getCacheDir().."/"..项目名.."-X"
  io.open(luaconf,"w"):write([[luaname="]]..xy33.text..[["]]..'\nluapath="'..项目名称.."/"..xy33.text..[["]]..'\nlast='..editor.getSelectionEnd()):close()
end





function strippath(filename)
  return string.match(filename, ".+/([^/]*%.%w+)$")
end
function isintable(value,tb)
  for k,v in pairs(tb) do
    switch v
     case value
      return true
    end
  end
  return false
end

function 是否有此文件(hh路径)
  for i = 1,#快捷文件列表 do
    if tostring(快捷文件列表[i]) == tostring(hh路径) then
      return true
    end
  end
  return false
end

function 刷新路径(StartPath)
  
  data={}
  adpq=LuaAdapter(activity,data,itemq)
  lv.setAdapter(adpq)
  function SetItem(path)
    path=tostring(path)
    adpq.clear()
    cp.Text=tostring(path)
    if path~=tostring(项目名称) then
      adpq.add{wjm="返回上级目录",wjlx="res2/folder.png",sb="返回"}
    end
    ls=File(path).listFiles()
    if ls~=nil then
      ls=luajava.astable(File(path).listFiles()) 
      table.sort(ls,function(a,b)
        return (a.isDirectory()~=b.isDirectory() and a.isDirectory()) or ((a.isDirectory()==b.isDirectory()) and a.Name<b.Name)
      end)
     else
      ls={}
    end
    for index,c in ipairs(ls) do
      if c.isDirectory() then
        adpq.add{wjm=c.Name,wjlx="res2/folder.png",sb="文件夹"}
       elseif c.isFile() then
        adpq.add{wjm=c.Name,wjlx="res2/file.png",sb="文件"}
      end
    end
  end

  wh=activity.getWidth()
  pio=(wh/10)*8

  左侧滑.setDrawerListener(DrawerLayout.DrawerListener{

    onDrawerSlide=function(v,i)
      
      cf.setTranslationX(i*pio)
      

      
      
      
      

      cf.setTranslationX(i*250)
      cf.setTranslationY(i*100)
      
      




      
      
      
      
      其他1x.setRotation(i*30)
      ch.setAlpha(i)
      ch.setScaleY(i)
      lv.setAlpha(i)
      lv.setScaleY(i)
      
      

      
      
      
    end,
    

    
    

    

  })

  o=RippleHelper(lv)
  o.RippleColor=0x34FFFFFF


  lv.onItemClick=function(l,v,p,s)
    import "java.io.File"
    项目=tostring(v.tag.wjm.Text)
    类别=tostring(v.tag.sb.Text)

    if tostring(cp.Text)==tostring(项目名称) then
      路径=ls[p+1]
     else
      路径=ls[p]
    end
    if 项目=="返回上级目录" then
      SetItem(File(cp.Text).getParentFile())
     elseif 路径.isDirectory() then
      SetItem(路径)

     elseif 路径.isFile() then
      local a=路径.Name
      if a:find("%.lua$") or a:find("%.aly$") then
        保存()
        if 是否有此文件(路径) == false then
          table.insert(快捷文件列表,tostring(路径))
        end
        editor.text=io.open(tostring(路径)):read("*a")
        xy33.text=路径.Name
        左侧滑.closeDrawer(3)
        加载快捷栏()
        if (tostring(路径.getParentFile()) != tostring(项目名称)) then
          是否在项目目录 = false
         else
          是否在项目目录 = true
        end
       else
        print("暂不支持打开此类文件哦")
      end
    end
  end

  SetItem(StartPath)
end






功能={"打开","新建","调色","打包","备份","属性","分析","搜索","插件","跳转","布局","格式","编译"}
for i=1,#功能 do
  button2={
    Button;
    text=功能[i];
    layout_width="45dp";
    layout_height="fill";
    background="#ffffff";
    padding="5dp",
    id="sssssw",
    textColor=颜色4,
  };
  m2=loadlayout(button2)
  bar2.addView(m2)
  波纹(sssssw,0xE7EAEEEE)
  m2.onClick=function(v)
    保存()
    i=v.text
    if i=="打开" then
      保存()
      左侧滑.openDrawer(3)
    end
    if i=="新建" then
      保存()
      local cj={
        CardView;
        radius=30;
        layout_width="match_parent";

        layout_height="match_parent";
        {
          CardView;
          layout_gravity="center";
          layout_height="350dp";
          layout_width="match_parent";
          
          
          {
            TextView;
            layout_marginTop="15dp";
            text="新建文件";
            layout_marginLeft="20dp";
            textColor="0xFF03A9F4";
            textSize="20sp";
          };
          {
            LinearLayout;
            layout_height="180dp";
            layout_width="match_parent";
            orientation="horizontal";
            gravity="center";
            {
              EditText;

              layout_width="150dp";
              hint="请输入新建文件名称";
              textSize="15sp";
              
              textColor=颜色3,
              id="输入文件名称";
              gravity="center";
            };
            {
              Spinner;
              layout_marginLeft="10dp";

              items={
                "lua";
                "aly";
                "txt";
                "文件夹";
              };
              id="类型";
              layout_gravity="center";
            };
          };
          {
            LinearLayout;
            layout_height="match_parent";
            layout_width="match_parent";
            {
              Button;
              textColor="0x7E000000";
              layout_gravity="center";
              text="取消";
              layout_height="40dp";
              layout_marginBottom="5dp";
              id="取消创建文件";
              layout_marginLeft="10dp";
            };
            {
              LinearLayout;
              layout_height="match_parent";
              layout_width="match_parent";
              gravity="right";
              {
                Button;
                layout_marginRight="10dp";
                textColor="0xFF03A9F4";
                text="创建";
                layout_height="40dp";
                layout_marginBottom="5dp";
                id="确定创建文件";
                layout_gravity="center";
              };
            };
          };
        };
      };
      dialog= AlertDialog.Builder(this)
      dialog1=dialog.show()
      dialog1.getWindow().setContentView(loadlayout(cj));
      dialog1.getWindow().setBackgroundDrawable(ColorDrawable(0x00000000));
      local dialogWindow = dialog1.getWindow();
      dialogWindow.setGravity(Gravity.BOTTOM);
      dialog1.getWindow().getAttributes().width=(activity.Width);
      dialog1.getWindow().clearFlags(WindowManager.LayoutParams.FLAG_ALT_FOCUSABLE_IM);
      local x=nil
      美化按钮2(取消创建文件,10,0x7E000000,颜色7)
      美化按钮2(确定创建文件,10,0x7a00bfff,0xFF03A9F4)
      控件圆角(输入文件名称,颜色2,30)
      function 取消创建文件.onClick()
        保存()
        dialog1.dismiss()
      end
      类型.onItemSelected=function(l,v,p,i)
        x=v.text
      end
      function 确定创建文件.onClick()
        保存()
        if #输入文件名称.text~=0 then
          if x=="lua" then
            local lua=[[require "import"
import "android.app.*"
import "android.os.*"
import "android.widget.*"
import "android.view.*"
import "layout"

activity.setTheme(android.R.style.Theme_DeviceDefault_Light)
activity.setContentView(loadlayout(layout))]]
            if not File(项目名称.."/"..输入文件名称.text..".lua").isFile() then
              写入文件(项目名称.."/"..输入文件名称.text..".lua",lua)
              dialog1.dismiss()
              print"创建成功"
              刷新路径(项目名称)

              
              
             else
              print"文件已存在"
            end
           elseif x=="aly" then

            local aly=[[{
  LinearLayout;
  layout_height="fill";
  layout_width="fill";
};]]
            if not File(项目名称.."/"..输入文件名称.text..".aly").isFile() then
              写入文件(项目名称.."/"..输入文件名称.text..".aly",aly)
              dialog1.dismiss()
              print"创建成功"
              刷新路径(项目名称)
              

             else
              print"文件已存在"
            end
           elseif x=="txt" then
            if not File(项目名称.."/"..输入文件名称.text..".txt").isFile() then
              创建文件(项目名称.."/"..输入文件名称.text..".txt")
              dialog1.dismiss()
              刷新路径(项目名称)
              

              print"创建成功"
             else
              print"文件已存在"
            end
           elseif x=="文件夹" then
            if not File(项目名称.."/"..输入文件名称.text).isDirectory() then
              创建文件夹(项目名称.."/"..输入文件名称.text)
              dialog1.dismiss()
              刷新路径(项目名称)
              

              print"创建成功"
             else
              print"文件夹已存在"
            end
          end
        end
      end
      
    end
    if i=="备份" then
      保存()
      local a=File(项目名称).getName()
      LuaUtil.copyDir(项目名称,备份文件夹.."/"..a)
      ZipUtil.zip(备份文件夹.."/"..a,备份文件夹)
      LuaUtil.rmDir(File(备份文件夹.."/"..a))
      File(备份文件夹.."/"..a..".zip").renameTo(File(备份文件夹.."/"..a.."_"..os.date("%Y%m%d%H%M%S")..".alp"))
      print("备份成功"..备份文件夹.."/"..a.."_"..os.date("%Y%m%d%H%M%S")..".alp")
    end
    if i=="调色" then
      保存()
      yss1("调色板","0xFFFFFFFF","复制")
    end
    if i=="打包" then
      保存()
      import "java.util.zip.ZipOutputStream"
      import "android.net.Uri"
      import "java.io.File"
      import "android.widget.Toast"
      import "java.util.zip.CheckedInputStream"
      import "java.io.FileInputStream"
      import "android.content.Intent"
      import "com.androlua.LuaUtil"
      import "java.security.Signer"
      import "java.util.ArrayList"
      import "java.io.FileOutputStream"
      import "java.io.BufferedOutputStream"
      import "java.util.zip.ZipInputStream"
      import "java.io.BufferedInputStream"
      import "java.util.zip.ZipEntry"
      import "android.app.ProgressDialog"
      import "java.util.zip.CheckedOutputStream"
      import "java.util.zip.Adler32"
      import "android.graphics.drawable.ColorDrawable"
      local bin_dlg, error_dlg
      local function update(s)
        bin_dlg.setMessage(s)
      end

      local function callback(s)
        LuaUtil.rmDir(File(activity.getLuaExtDir("bin/.temp")))
        bin_dlg.dismiss()
        bin_dlg.Message = ""
        if not s:find("成功") then
          error_dlg.Message = s
          error_dlg.show()
        end
      end

      local function create_bin_dlg()
        if bin_dlg then
          return
        end
        bin_dlg = ProgressDialog(activity);
        bin_dlg.setTitle("正在打包");
        bin_dlg.setMax(100);
      end

      local function create_error_dlg2()
        if error_dlg then
          return
        end
        error_dlg = AlertDialogBuilder(activity)
        error_dlg.Title = "出错"
        error_dlg.setPositiveButton("确定", nil)
      end
      local function binapk(luapath, apkpath)
        require "import"
        
        

        local function ps(str)
          str = str:gsub("%b\"\"",""):gsub("%b\'\'","")
          local _,f= str:gsub ('%f[%w]function%f[%W]',"")
          local _,t= str:gsub ('%f[%w]then%f[%W]',"")
          local _,i= str:gsub ('%f[%w]elseif%f[%W]',"")
          local _,d= str:gsub ('%f[%w]do%f[%W]',"")
          local _,e= str:gsub ('%f[%w]end%f[%W]',"")
          local _,r= str:gsub ('%f[%w]repeat%f[%W]',"")
          local _,u= str:gsub ('%f[%w]until%f[%W]',"")
          local _,a= str:gsub ("{","")
          local _,b= str:gsub ("}","")
          return (f+t+d+r+a)*4-(i+e+u+b)*4
        end


        local function _format()
          local p=0
          return function(str)
            str=str:gsub("[ \t]+$","")
            str=string.format('%s%s',string.rep(' ',p),str)
            p=p+ps(str)
            return str
          end
        end


        function format(Text)
          local t=os.clock()
          local Format=_format()
          Text=Text:gsub('[ \t]*([^\r\n]+)',function(str)return Format(str)end)
          print('操作完成,耗时:'..os.clock()-t)
          return Text
        end


        function build(path)
          if path then
            local str,st=loadfile(path)
            if st then
              return nil,st
            end
            local path=path..'c'

            local st,str=pcall(string.dump,str,true)
            if st then
              f=io.open(path,'wb')
              f:write(str)
              f:close()
              return path
             else
              os.remove(path)
              return nil,str
            end
          end
        end

        function build_aly(path2)
          if path2 then
            local f,st=io.open(path2)
            if st then
              return nil,st
            end
            local str=f:read("*a")
            f:close()
            str=string.format("local layout=%s\nreturn layout",str)
            local path=path2..'c'
            str,st=loadstring(str,path2:match("[^/]+/[^/]+$"),"bt")
            if st then
              return nil,st:gsub("%b[]",path2,1)
            end

            local st,str=pcall(string.dump,str,true)
            if st then
              f=io.open(path,'wb')
              f:write(str)
              f:close()
              return path
             else
              os.remove(path)
              return nil,str
            end
          end
        end


        compile "mao"
        compile "sign"
        import "java.util.zip.*"
        import "java.io.*"
        import "mao.res.*"
        import "apksigner.*"
        local b = byte[2 ^ 16]
        local function copy(input, output)
          LuaUtil.copyFile(input, output)
          input.close()
          
        end
        local function copy2(input, output)
          LuaUtil.copyFile(input, output)
        end
        local temp = File(apkpath).getParentFile();
        if (not temp.exists()) then

          if (not temp.mkdirs()) then

            error("create file " .. temp.getName() .. " fail");
          end
        end

        local tmp = luajava.luadir.. "/tmp.apk"
        local info = activity.getApplicationInfo()
        local ver = activity.getPackageManager().getPackageInfo(activity.getPackageName(), 0).versionName
        local code = activity.getPackageManager().getPackageInfo(activity.getPackageName(), 0).versionCode

        
        local zipFile = File(info.publicSourceDir)
        local fis = FileInputStream(zipFile);
        
        local zis = ZipInputStream(BufferedInputStream(fis));

        local fot = FileOutputStream(tmp)
        
        local out = ZipOutputStream(BufferedOutputStream(fot))
        local f = File(luapath)
        local errbuffer = {}
        local replace = {}
        local checked = {}
        local lualib = {}
        local md5s = {}
        local libs = File(activity.ApplicationInfo.nativeLibraryDir).list()
        libs = luajava.astable(libs)
        for k, v in ipairs(libs) do
          
          replace[v] = true
        end

        local mdp = activity.Application.MdDir
        local function getmodule(dir)
          local mds = File(activity.Application.MdDir .. dir).listFiles()
          mds = luajava.astable(mds)
          for k, v in ipairs(mds) do
            if mds[k].isDirectory() then
              getmodule(dir .. mds[k].Name .. "/")
             else
              mds[k] = "lua" .. dir .. mds[k].Name
              replace[mds[k]] = true
            end
          end
        end

        getmodule("/")

        local function checklib(path)
          if checked[path] then
            return
          end
          local cp, lp
          checked[path] = true
          local f = io.open(path)
          local s = f:read("*a")
          f:close()
          for m, n in s:gmatch("require *%(? *\"([%w_]+)%.?([%w_]*)") do
            cp = string.format("lib%s.so", m)
            if n ~= "" then
              lp = string.format("lua/%s/%s.lua", m, n)
              m = m .. '/' .. n
             else
              lp = string.format("lua/%s.lua", m)
            end
            if replace[cp] then
              replace[cp] = false
            end
            if replace[lp] then
              checklib(mdp .. "/" .. m .. ".lua")
              replace[lp] = false
              lualib[lp] = mdp .. "/" .. m .. ".lua"
            end
          end
          for m, n in s:gmatch("import *%(? *\"([%w_]+)%.?([%w_]*)") do
            cp = string.format("lib%s.so", m)
            if n ~= "" then
              lp = string.format("lua/%s/%s.lua", m, n)
              m = m .. '/' .. n
             else
              lp = string.format("lua/%s.lua", m)
            end
            if replace[cp] then
              replace[cp] = false
            end
            if replace[lp] then
              checklib(mdp .. "/" .. m .. ".lua")
              replace[lp] = false
              lualib[lp] = mdp .. "/" .. m .. ".lua"
            end
          end
        end

        replace["libluajava.so"] = false
        function isintable(value,tb)
          for k,v in pairs(tb) do
            switch v
             case value
              return true
            end
          end
          return false
        end

        function strippath(filename)
          return string.match(filename, ".+/([^/]*%.%w+)$")
        end
        function stripextension(filename)
          local idx = filename:match(".+()%.%w+$")
          if(idx) then
            return filename:sub(1, idx-1)
           else
            return filename
          end
        end
        function getExtension(str)
          return str:match(".+%.(%w+)$")
        end
        local function addDir(out, dir, f)
          local entry = ZipEntry("assets/" .. dir)
          out.putNextEntry(entry)
          local ls = f.listFiles()
          for n = 0, #ls - 1 do
            local name = ls[n].getName()
            if name==(".using") then
              checklib(luapath .. dir .. name)
             elseif name:find("%.apk$") or name:find("%.luac$") or name:find("^%.") then
             elseif name:find("%.lua$") then
              checklib(luapath .. dir .. name)
              switch isintable(dir..name,skip_compilation)
               case true
                local readlua=io.open(luapath..dir..name):read("*a")
                io.open(luapath..dir..name.."c","w"):write(readlua):close()
                path=luapath..dir..name.."c"
               default
                path=build(luapath..dir..name)
              end
              if path then
                if replace["assets/" .. dir .. name] then
                  table.insert(errbuffer, dir .. name .. "/.aly")
                end
                local entry = ZipEntry("assets/" .. dir .. name)
                out.putNextEntry(entry)

                replace["assets/" .. dir .. name] = true
                copy(FileInputStream(File(path)), out)
                table.insert(md5s, LuaUtil.getFileMD5(path))
                os.remove(path)
               else
                table.insert(errbuffer, err)
              end
             elseif name:find("%.aly$") then
              switch isintable(dir..name,skip_compilation)
               case true
                local readlua=io.open(luapath..dir..name):read("*a")
                io.open(luapath..dir..name.."c","w"):write(stripextension(strippath(luapath..dir..name)).."="..readlua):close()
                path=luapath..dir..name.."c"
               default
                path=build_aly(luapath..dir..name)
              end
              if path then
                name = name:gsub("aly$", "lua")
                if replace["assets/" .. dir .. name] then
                  table.insert(errbuffer, dir .. name .. "/.aly")
                end
                local entry = ZipEntry("assets/" .. dir .. name)
                out.putNextEntry(entry)

                replace["assets/" .. dir .. name] = true
                copy(FileInputStream(File(path)), out)
                table.insert(md5s, LuaUtil.getFileMD5(path))
                os.remove(path)
               else
                table.insert(errbuffer, err)
              end
             elseif ls[n].isDirectory() then
              addDir(out, dir .. name .. "/", ls[n])
             else
              local entry = ZipEntry("assets/" .. dir .. name)
              out.putNextEntry(entry)
              replace["assets/" .. dir .. name] = true
              copy(FileInputStream(ls[n]), out)
              table.insert(md5s, LuaUtil.getFileMD5(ls[n]))
            end
          end
        end


        this.update("正在编译...");
        if f.isDirectory() then
          require "permission"
          dofile(luapath .. "init.lua")
          if user_permission then
            for k, v in ipairs(user_permission) do
              user_permission[v] = true
            end
          end


          local ss, ee = pcall(addDir, out, "", f)
          if not ss then
            table.insert(errbuffer, ee)
          end
          


          local wel = File(luapath .. "icon.png")
          if wel.exists() then
            local entry = ZipEntry("res/drawable/icon.png")
            out.putNextEntry(entry)
            replace["res/drawable/icon.png"] = true
            copy(FileInputStream(wel), out)
          end
          local wel = File(luapath .. "welcome.png")
          if wel.exists() then
            local entry = ZipEntry("res/drawable/welcome.png")
            out.putNextEntry(entry)
            replace["res/drawable/welcome.png"] = true

            copy(FileInputStream(wel), out)
          end
         else
          return "error"
        end

        
        for name, v in pairs(lualib) do
          local path, err = build(v)
          if path then
            local entry = ZipEntry(name)
            out.putNextEntry(entry)
            copy(FileInputStream(File(path)), out)
            table.insert(md5s, LuaUtil.getFileMD5(path))
            os.remove(path)
           else
            table.insert(errbuffer, err)
          end
        end

        apkpath="/storage/emulated/0/AndLuaX+/bin/"..appname.."_"..appver..".apk"
        function touint32(i)
          local code = string.format("%08x", i)
          local uint = {}
          for n in code:gmatch("..") do
            table.insert(uint, 1, string.char(tonumber(n, 16)))
          end
          return table.concat(uint)
        end

        this.update("正在打包...");
        local entry = zis.getNextEntry();
        while entry do
          local name = entry.getName()
          local lib = name:match("([^/]+%.so)$")
          if replace[name] then
           elseif lib and replace[lib] then
           elseif name:find("^assets/") then
           elseif name:find("^lua/") then
           elseif name:find("META%-INF") then
           else
            local entry = ZipEntry(name)
            out.putNextEntry(entry)
            if entry.getName() == "AndroidManifest.xml" then
              if path_pattern and #path_pattern > 1 then
                path_pattern = ".*\\\\." .. path_pattern:match("%w+$")
              end
              local list = ArrayList()
              local xml = AXmlDecoder.read(list, zis)
              local req = {
                [activity.getPackageName()] = packagename,
                [info.nonLocalizedLabel] = appname,
                [ver] = appver,
                [".*\\\\.alp"] = path_pattern or "",
                [".*\\\\.lua"] = "",
                [".*\\\\.luac"] = "",
              }
              for n = 0, list.size() - 1 do
                local v = list.get(n)
                if req[v] then
                  list.set(n, req[v])
                 elseif user_permission then
                  local p = v:match("%.permission%.([%w_]+)$")
                  if p and (not user_permission[p]) then
                    list.set(n, "android.permission.UNKNOWN")
                  end
                end
              end
              local pt = activity.getLuaPath(".tmp")
              local fo = FileOutputStream(pt)
              xml.write(list, fo)
              local code = activity.getPackageManager().getPackageInfo(activity.getPackageName(), 0).versionCode
              fo.close()
              local f = io.open(pt)
              local s = f:read("a")
              f:close()
              s = string.gsub(s, touint32(code), touint32(tointeger(appcode) or 1),1)
              s = string.gsub(s, touint32(18), touint32(tointeger(appsdk) or 18),1)

              local f = io.open(pt, "w")
              f:write(s)
              f:close()
              local fi = FileInputStream(pt)
              copy(fi, out)
              os.remove(pt)
             elseif not entry.isDirectory() then
              copy2(zis, out)
            end
          end
          entry = zis.getNextEntry()
        end
        out.setComment(table.concat(md5s))
        
        zis.close();
        out.closeEntry()
        out.close()

        if #errbuffer == 0 then
          this.update("正在签名...");
          os.remove(apkpath)
          Signer.sign(tmp, apkpath)
          os.remove(tmp)
          activity.installApk(apkpath)
          
          return "打包成功:" .. apkpath
         else
          os.remove(tmp)
          this.update("打包出错:\n " .. table.concat(errbuffer, "\n"));
          return "打包出错:\n " .. table.concat(errbuffer, "\n")
        end
      end
      luabindir=activity.getLuaExtDir("bin")
      local function bin(path)
        local p = {}
        local e, s = pcall(function()dofile(path .. "init.lua")end)
        if e then
          create_error_dlg2()
          create_bin_dlg()
          bin_dlg.show()
          activity.newTask(binapk, update, callback).execute { path, activity.getLuaExtPath("bin", appname .. "_" .. appver .. ".apk") }
         else
          Toast.makeText(activity, "工程配置文件错误." .. s, Toast.LENGTH_SHORT).show()
        end
      end


      bin(项目名称.."/")
    end
    if i=="属性" then
      保存()
      x90=io.open(项目名称.."/init.lua"):read("*a")
      if x90:find("appname") then
        x91=x90:match('appname="(.-)"')
      end
      if x90:find("appcode") then
        x92=x90:match('appcode="(.-)"')
      end
      if x90:find("appver") then
        x93=x90:match('appver="(.-)"')
      end
      if x90:find("appsdk") then
        x94=x90:match('appsdk="(.-)"')
      end
      if x90:find("packagename") then
        x95=x90:match('packagename="(.-)"')
      end
      if x90:find("rue") or x90:find("tru") then
        x96="开"
      end
      if x90:find("user_permission") then
        x97=x90:match('user_permission={(.-)}')
      end
      if x90:find("skip_compilation") then
        x99=x90:match('skip_compilation={(.-)}')
      end
      x98=项目名称.."/init.lua"
      x0=io.open(项目名称.."/init.lua"):read("*a")
      activity.newActivity("main5",android.R.anim.fade_in,android.R.anim.fade_out,{
        true,
        x0,
        x91,
        x92,
        x93,
        x94,
        x95,
        x96,
        x97,
        x98,
        项目名,
        x99,
      })
    end
    if i=="分析" then

      
      activity.newActivity("javaapi/fiximport",{项目名称.."/",项目名称.."/"..xy33.text})
    end
    if i=="搜索" then
      保存()
      editor.search()
      
    end
    if i=="插件" then
      保存()
      import "java.io.*"
      if File("/sdcard/AndLuaX+/plugin/").isDirectory()then
        activity.newActivity("plugin/main", {项目名称.."/",项目名称.."/"..xy33.text})
       else
        os.execute("mkdir /sdcard/AndLuaX+/plugin/")
        activity.newActivity("plugin/main", {项目名称.."/",项目名称.."/"..xy33.text})
      end
    end

    if i=="跳转" then
      保存()
      if 转到.Visibility==8 then
        转到.setVisibility(0)
       else
        转到.setVisibility(8)
      end
    end
    if i=="布局" then
      保存()
      if xy33.text:find("%.aly$") then
        activity.newActivity("main9",android.R.anim.fade_in,android.R.anim.fade_out,{项目名称.."/"..xy33.text,项目名称})
        function onResult(a,b)
          if a=="main9" then
            editor.text=io.open(项目名称.."/"..xy33.text):read("*a")
          end
        end
       else
        print("请选择aly文件")
      end
    end
    if i=="格式" then
      editor.format()
      保存()
    end
    if i=="编译" then
      保存()
      
      

      local function ps(str)
        str = str:gsub("%b\"\"",""):gsub("%b\'\'","")
        local _,f= str:gsub ('%f[%w]function%f[%W]',"")
        local _,t= str:gsub ('%f[%w]then%f[%W]',"")
        local _,i= str:gsub ('%f[%w]elseif%f[%W]',"")
        local _,d= str:gsub ('%f[%w]do%f[%W]',"")
        local _,e= str:gsub ('%f[%w]end%f[%W]',"")
        local _,r= str:gsub ('%f[%w]repeat%f[%W]',"")
        local _,u= str:gsub ('%f[%w]until%f[%W]',"")
        local _,a= str:gsub ("{","")
        local _,b= str:gsub ("}","")
        return (f+t+d+r+a)*4-(i+e+u+b)*4
      end


      local function _format()
        local p=0
        return function(str)
          str=str:gsub("[ \t]+$","")
          str=string.format('%s%s',string.rep(' ',p),str)
          p=p+ps(str)
          return str
        end
      end


      function format(Text)
        local t=os.clock()
        local Format=_format()
        Text=Text:gsub('[ \t]*([^\r\n]+)',function(str)return Format(str)end)
        print('操作完成,耗时:'..os.clock()-t)
        return Text
      end


      function build(path)
        if path then
          local str,st=loadfile(path)
          if st then
            return nil,st
          end
          local path=path..'c'

          local st,str=pcall(string.dump,str,true)
          if st then
            f=io.open(path,'wb')
            f:write(str)
            f:close()
            return path
           else
            os.remove(path)
            return nil,str
          end
        end
      end

      function build_aly(path2)
        if path2 then
          local f,st=io.open(path2)
          if st then
            return nil,st
          end
          local str=f:read("*a")
          f:close()
          str=string.format("local layout=%s\nreturn layout",str)
          local path=path2..'c'
          str,st=loadstring(str,path2:match("[^/]+/[^/]+$"),"bt")
          if st then
            return nil,st:gsub("%b[]",path2,1)
          end

          local st,str=pcall(string.dump,str,true)
          if st then
            f=io.open(path,'wb')
            f:write(str)
            f:close()
            return path
           else
            os.remove(path)
            return nil,str
          end
        end
      end
      local 路径,错误=build(项目名称.."/"..xy33.text)
      if 路径 then
        print("编译成功"..路径)
       else
        print("编译失败"..错误)
      end


    end
  end
end

if 状态==true then
  刷新路径(项目名称)
  
  
  editor.text=io.open(项目名称.."/main.lua"):read("*a")
end
activity.getWindow().setSoftInputMode(WindowManager.LayoutParams.SOFT_INPUT_ADJUST_RESIZE)
local ab=io.open(activity.getLuaDir().."/Verify/set5.XY"):read("*a")
local abc=io.open(activity.getLuaDir().."/Verify/set6.XY"):read("*a")
local abcd=io.open(activity.getLuaDir().."/Verify/set7.XY"):read("*a")
local abcde=io.open(activity.getLuaDir().."/Verify/set8.XY"):read("*a")
local abcdef=io.open(activity.getLuaDir().."/Verify/set9.XY"):read("*a")
local abcdefg=io.open(activity.getLuaDir().."/Verify/set10.XY"):read("*a")
local abcdefgh=io.open(activity.getLuaDir().."/Verify/set11.XY"):read("*a")
local abcdefghi=io.open(activity.getLuaDir().."/Verify/set12.XY"):read("*a")
local abcdefghij=io.open(activity.getLuaDir().."/Verify/set13.XY"):read("*a")
local bj=io.open(activity.getLuaDir().."/Verify/setb.XY"):read("*a")
local bbl=io.open(activity.getLuaDir().."/Verify/setbb.XY"):read("*a")
switch abc
 case "颜色1"
  abc=颜色1
 default
  abc=tonumber(abc)
end
switch abcdef
 case "颜色3"
  abcdef=颜色3
 default
  abcdef=tonumber(abcdef)
end
switch bj
 case "颜色5"
  bj=颜色5
 default
  bj=tonumber(bj)
end
switch bbl
 case "颜色1"
  bbl=颜色1
 default
  bbl=tonumber(bbl)
end
editor.backgroundColor=bj

cc.backgroundColor=bbl
ccc.backgroundColor=bbl
cccc.backgroundColor=bbl
ccccc.backgroundColor=bbl
cccccc.backgroundColor=bbl
activity.getWindow().addFlags(WindowManager.LayoutParams.FLAG_DRAWS_SYSTEM_BAR_BACKGROUNDS).setStatusBarColor(bbl);
if tonumber(Build.VERSION.SDK) >= 23 then
  activity.getWindow().getDecorView().setSystemUiVisibility(View.SYSTEM_UI_FLAG_LIGHT_STATUS_BAR);
end
editor.setBasewordColor(tonumber(ab))
editor.setPanelBackgroundColor(tonumber(abc))
editor.setPanelTextColor(tonumber(abcd))
editor.setStringColor(tonumber(abcde))
editor.setTextColor(tonumber(abcdef))
editor.setUserwordColor(tonumber(abcdefg))
editor.setCommentColor(tonumber(abcdefgh))
editor.setKeywordColor(tonumber(abcdefghi))
switch abcdefghij
 case "true"
  editor.setWordWrap(true)
 case true
  editor.setWordWrap(true)
end
hs={"删除文件()"}
editor.addNames(hs)
fh=io.open(activity.getLuaDir().."/Verify/set2.XY"):read("*a")
for t,c in fh:gmatch("(.-) ") do
  button={
    Button;
    text=tostring(t);
    layout_width="45dp";
    layout_height="fill";
    background="#ffffff";
    textColor=0xFF03A9F4;
    padding="5dp",
    id="sssss",
  };
  m=loadlayout(button)
  bar.addView(m)
  波纹(sssss,0xE7EAEEEE)
  m.onClick=function(v)
    if v.text=="Fun" or v.text=="fun" or v.text=="function" or v.text=="Function" then
      editor.paste("function")
      
     else
      if v.text=="End" or v.text=="end" then
        editor.paste("end")
        
       else
        editor.paste(v.Text)
        
      end
    end
  end
  m.onLongClick=function(v)
    if v.text=="Fun" or v.text=="fun" or v.text=="function" or v.text=="Function" then
      editor.paste("function")
      
     else
      if v.text=="End" or v.text=="end" then
        editor.paste("end")
        
       else
        editor.paste(v.Text..v.text)
        
      end
    end
    return true
  end
end
editor.OnSelectionChangedListener=function(a,b,c)
  if a==true then
    其他2x.setVisibility(View.GONE)
    恢复.setVisibility(View.GONE)
    撤销.setVisibility(View.GONE)
    运行.setVisibility(View.GONE)
    布局助手.setVisibility(View.GONE)
    其他1x.setVisibility(View.GONE)
    选择代码1.setVisibility(0)
   else
    其他2x.setVisibility(View.VISIBLE)
    恢复.setVisibility(View.VISIBLE)
    撤销.setVisibility(View.VISIBLE)
    运行.setVisibility(View.VISIBLE)
    布局助手.setVisibility(View.VISIBLE)
    其他1x.setVisibility(View.VISIBLE)
    选择代码1.setVisibility(8)
  end
end
function XY01.onClick()
  其他2x.setVisibility(View.VISIBLE)
  恢复.setVisibility(View.VISIBLE)
  撤销.setVisibility(View.VISIBLE)
  运行.setVisibility(View.VISIBLE)
  布局助手.setVisibility(View.VISIBLE)
  其他1x.setVisibility(View.VISIBLE)
  选择代码1.setVisibility(8)
end
function XY11.onClick()
  editor.selectAll()
  保存()
end
function XY21.onClick()
  editor.cut()
  保存()
end
function XY31.onClick()
  editor.copy()
  保存()
end
function XY41.onClick()
  editor.paste()
  保存()
end
波纹(XY11,0xFFD9D9D9)
波纹(XY21,0xFFD9D9D9)
波纹(XY31,0xFFD9D9D9)
波纹(XY41,0xFFD9D9D9)
波纹(撤销,0xFFD9D9D9)
波纹(恢复,0xFFD9D9D9)
波纹(布局助手,0xFFD9D9D9)
波纹(其他1x,0xFFD9D9D9)
波纹(其他2x,0xFFD9D9D9)
波纹(运行,0xFFD9D9D9)
波纹(确定转到,0xFFD9D9D9)

function 确定转到.onClick()
  保存()
  if #转到行数.text~=0 then
    editor.gotoLine(tointeger(转到行数.text))
  end
end
function 关闭转到.onClick()
  保存()
  转到.setVisibility(8)
end







function reopen(path)
  local f = io.open(path, "r")
  if f then
    local str = f:read("*all")
    if tostring(editor.getText()) ~= str then
      editor.setText(str, true)
      
    end
    f:close()
  end
end
function onStart()
  reopen(项目名称.."/"..xy33.text)
  
  if isupdate then
    editor.format()
    
  end
  isupdate = false
end
function onStop()
  保存()
  local luaconf = getCacheDir().."/"..项目名.."-X" io.open(luaconf,"w"):write([[luaname="]]..xy33.text..[["]]..'\nluapath="'..项目名称.."/"..xy33.text..[["]]..'\nlast='..editor.getSelectionEnd()):close()
  
end





local function adds()
  require "import"
  local classes = require "javaapi.android"
  local ms = { "onCreate",
    "onStart",
    "onResume",
    "onPause",
    "onStop",
    "onDestroy",
    "onActivityResult",
    "onResult",
    "onCreateOptionsMenu",
    "onOptionsItemSelected",
    "onClick",
    "onTouch",
    "onLongClick",
    "onItemClick",
    "onItemLongClick",
    "圆角提示()",
    "字符转ASCII码()",
    "ASCII码转字符()",
    "ASCII码判断字符()",
    "提示()",
    "MD提示()",
    "窗口标题()",
    "载入界面()",
    "隐藏标题栏()",
    "设置主题()",
    "打印()",
    "截取文本()",
    "替换文本()",
    "字符串长度()",
    "状态栏颜色()",
    "沉浸状态栏()",
    "设置文本()",
    "跳转界面()",
    "关闭界面()",
    "获取文本()",
    "结束程序()",
    "控件圆角()",
    "获取设备标识码()",
    "获取IMEI()",
    "控件背景渐变动画()",
    "获取屏幕尺寸()",
    "是否安装APP()",
    "设置中划线()",
    "设置下划线()",
    "设置字体加粗()",
    "设置斜体()",
    "分享内容()",
    "跳转QQ群()",
    "跳转QQ聊天()",
    "发送短信()",
    "获取剪切板()",
    "写入剪切板()",
    "开启WIFI()",
    "关闭WIFI()",
    "断开网络()",
    "创建文件()",
    "创建文件夹()",
    "创建多级文件夹()",
    "移动文件()",
    "写入文件()",
    "设置按钮颜色()",
    "设置编辑框颜色()",
    "设置进度条颜色()",
    "设置控件颜色()",
    "获取手机存储路径()",
    "获取屏幕宽()",
    "获取屏幕高()",
    "文件是否存在()",
    "关闭侧滑()",
    "打开侧滑()",
    "显示控件()",
    "隐藏控件()",
    "播放本地音乐()",
    "在线播放音乐()",
    "播放本地视频()",
    "在线本地视频()",
    "打开APP()",
    "卸载APP()",
    "安装APP()",
    "调用系统下载文件()",
    "确定弹窗()",
    "添加波纹效果()",
    "随机数()",
    "删除控件()",
    "状态栏亮色()",
    "AndLuaX",
    "AndLuaX+",
    "andluax",
    "AndLua1",
    "AndLua2",
    "AndLua3",
    "AndLua4",
    "AndLua5",
    "AndLua6",
    "AndLua7",
    "AndLua8",
    "AndLua9",
    "AndLua10",
    "AndLua11",
    "AndLua12",
    "AndLua13",
    "AndLua14",
    "AndLua15",
    "AndLua16",
    "AndLua17",
    "AndLua18",
    "this",
    "onItemLongClick",
    "api",
    "MarText",
    "sid()",
    "key()",
    "窗口全屏()",
    "取消全屏()",
    "返回桌面()",
    "重构页面()",
    "YLListView",
    "PhotoView",
    "SwipeMenuListView",
    "gif",
    "loadGif",
    "void",
    "static",
    "class",
    "public",
    "new",
    "boolean",
    "char",
    "int",
    "private",
    "trim",
    "toString",
    "length",
    "IOException",
    "FileNotFoundException",
    "out",
    "println",
    "util",
    "append",
    "Theme_Pink",
    "Theme_Yellow",
    "Theme_Black",
    "Theme_Green",
    "Theme_Cyan",
    "Theme_Purple",
    "Theme_Teal",
    "Theme_Blue",
    "Theme_Dark_Blue",
    "Theme_Brown",
    "Theme_Dark_Brown",
    "Theme_Gray",
    "Theme_Dark_Gray",
    "Theme_Light_Gray",
    "Theme_Red"
  }
  local buf = String[#ms + #classes]
  for k, v in ipairs(ms) do
    buf[k - 1] = v
  end
  local l = #ms
  for k, v in ipairs(classes) do
    buf[l + k - 1] = string.match(v, "%w+$")
  end
  return buf
end
task(adds, function(buf)
  editor.addNames(buf)
end)
function onKeyShortcut(keyCode, event)
  local filteredMetaState = event.getMetaState() & ~KeyEvent.META_CTRL_MASK;
  if (KeyEvent.metaStateHasNoModifiers(filteredMetaState)) then
    switch(keyCode)
     case
      KeyEvent.KEYCODE_S
      保存();
      return true;
     case
      KeyEvent.KEYCODE_I
      fix(editor.getSelectedText());
      return true;
    end
  end
  return false;
end

import "android.content.*"
cm = activity.getSystemService(activity.CLIPBOARD_SERVICE)

function copyClip(str)
  local cd = ClipData.newPlainText("label", str)
  cm.setPrimaryClip(cd)
  Toast.makeText(activity, "已复制到剪切板", 1000).show()
end

function create_import_dlg()
  if import_dlg then
    return
  end
  import_dlg = AlertDialogBuilder(activity)
  import_dlg.Title = "可能需要导入的类"
  import_dlg.setPositiveButton("确定", nil)

  import_dlg.ListView.onItemClick = function(l, v)
    copyClip(v.Text)
    import_dlg.hide()
    return true
  end
end

function create_error_dlg()
  if error_dlg then
    return
  end
  error_dlg = AlertDialogBuilder(activity)
  error_dlg.Title = "出错"
  error_dlg.setPositiveButton("确定", nil)
end

function onActivityResult(req, res, intent)
  if res == 10000 then
    editor.format()
    return
  end
  if res ~= 0 then
    local data = intent.getStringExtra("data")
    local _, _, path, line = data:find("\n[	 ]*([^\n]-):(%d+):")
    if path == luapath then
      editor.gotoLine(tonumber(line))
    end
    local classes = require "javaapi.android"
    local c = data:match("a nil value %(global '(%w+)'%)")
    if c then
      local cls = {}
      c = "%." .. c .. "$"
      for k, v in ipairs(classes) do
        if v:find(c) then
          table.insert(cls, string.format("import %q", v))
        end
      end
      if #cls > 0 then
        create_import_dlg()
        import_dlg.setItems(cls)
        import_dlg.show()
      end
    end

  end
end






function 其他1x.onClick()
  保存()
  if 左侧滑.isDrawerOpen(3) then
    左侧滑.closeDrawer(3)
   else
    左侧滑.openDrawer(3)
  end
end
delay_handler = Handler()
function 布局助手.onClick()
  保存()
  if xy33.text:find("%.aly$") then
    isupdate = true
    activity.newActivity("layouthelper/main",{项目名称.."/",项目名称.."/"..xy33.text})
    function onResult(a,b)
      if a=="layouthelper/main" then
        delay_handler.postDelayed(
        function()
          editor.paste(path)
        end,200)
        delay_handler.postDelayed(
        function()
          editor.format()
        end,400)
        
      end
    end
   else
    print("请选择aly文件")
  end
end
function 运行.onClick()
  保存()
  activity.newActivity(项目名称.."/main.lua")
end
function 撤销.onClick()
  editor.undo()
  
  保存()
end
function 恢复.onClick()
  editor.redo()
  
  保存()
end
function 其他2x.onClick()
  pop=PopupMenu(activity,其他2x)
  menu=pop.Menu
  
  
  menu.add("Java Api").onMenuItemClick=function()
    保存()
    activity.newActivity("main10",android.R.anim.fade_in,android.R.anim.fade_out)
  end
  menu.add("中文手册").onMenuItemClick=function(a)
    activity.newActivity("main3",android.R.anim.fade_in,android.R.anim.fade_out)
  end
  menu.add("编辑器设置").onMenuItemClick=function(a)
    activity.newActivity("main13",android.R.anim.fade_in,android.R.anim.fade_out)
  end
  menu.add("保存并退出").onMenuItemClick=function()
    保存()
    activity.finish()
  end
  pop.show()
end



lastclick = os.time() - 2
function onKeyDown(e)
  local now = os.time()
  if e == 4 then
    if now - lastclick > 2 then
      
      Toast.makeText(activity, "再按一次退出编辑器.", Toast.LENGTH_SHORT ).show()
      lastclick = now
      return true
     else
      editor.format()
      保存()
      
      
    end
  end
end
