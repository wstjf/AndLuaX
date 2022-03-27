require "import"
import "android.app.*"
import "android.os.*"
import "android.widget.*"
import "android.view.*"
import "AndLua"
import "java.io.File"
import "bin"
import "other"
import "console"
import "Color"
import "main10"
import "android.graphics.drawable.ColorDrawable"
import "android.graphics.drawable.StateListDrawable"
import "android.graphics.PorterDuffColorFilter"
import "android.graphics.PorterDuff"
import "Dialog"
import "toast"
--activity.setTheme(R.AndLua5)

颜色1=0xffffffff
颜色3=0xff303030
颜色4=0xff757575
颜色2=0xFFF2F1F6
颜色6=0xff757575
颜色5=0x5FFFFFFF



layout2={
  LinearLayout;
  layout_width="fill";
  orientation="vertical";
  layout_height="fill";
  {
    RelativeLayout;
    layout_width="match_parent";
    layout_height="match_parent";
    {
      LinearLayout;
      backgroundColor=颜色1;
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
            {
              RelativeLayout;
              layout_width="fill";
              backgroundColor=颜色1;
              layout_height="3.5%h";

              {
                HorizontalScrollView;
                horizontalScrollBarEnabled=false;
                backgroundColor=颜色1;
                layout_width="fill";
                layout_height="fill";
                {
                  LinearLayout;
                  layout_width="fill";
                  id="bar2";
                  layout_height="fill";
                };

              };
            };
            {
              RelativeLayout;
              layout_width="fill";
              backgroundColor=颜色1;
              layout_height="4%h";
              {
                HorizontalScrollView;
                horizontalScrollBarEnabled=false;
                backgroundColor=颜色1;
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
              TextSize="10sp";
              layout_width="fill";
              id="q";
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
--隐藏标题栏()
activity.getWindow().addFlags(WindowManager.LayoutParams.FLAG_DRAWS_SYSTEM_BAR_BACKGROUNDS).setStatusBarColor(颜色1);
if tonumber(Build.VERSION.SDK) >= 23 then
  activity.getWindow().getDecorView().setSystemUiVisibility(View.SYSTEM_UI_FLAG_LIGHT_STATUS_BAR);
end
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
    drawable.setStroke(3, 0xCFB0B0B0)
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
  pressedColor =InsideColor --Color.parseColor("#7ab946ff");
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

项目名称,状态,项目名=...
function 保存()
  写入文件(项目名称.."/"..xy33.text,q.text)
end
ti=Ticker()
ti.Period=480000
ti.onTick=function()
  保存()
  local a=File(项目名称).getName()
  LuaUtil.copyDir(项目名称,备份文件夹.."/"..a)
  ZipUtil.zip(备份文件夹.."/"..a,备份文件夹)
  LuaUtil.rmDir(File(备份文件夹.."/"..a))
  File(备份文件夹.."/"..a..".zip").renameTo(File(备份文件夹.."/"..a.."_"..os.date("%Y%m%d%H%M%S")..".alp"))
  print("备份成功"..备份文件夹.."/"..a.."_"..os.date("%Y%m%d%H%M%S")..".alp")

end
function 是否备份()
  local a=io.open(activity.getLuaDir().."/Verify/set4.XY"):read("*a")
  local b=a:match("3(.-)"..'"')
  if b=="开" then
    ti.start()
   else
    ti.stop()
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
          };
        };
      };
    };
  };
};
function 刷新路径(StartPath)
  --创建项目数组
  collectgarbage("collect")
  data={}
  adpq=LuaAdapter(activity,data,itemq)
  lv.setAdapter(adpq)
  function SetItem(path)
    path=tostring(path)
    adpq.clear()--清空适配器
    cp.Text=tostring(path)--设置当前路径
    if path~=tostring(项目名称) then--不是根目录则加上../
      adpq.add{wjm="返回上级目录",wjlx="res2/folder.png"}
    end
    ls=File(path).listFiles()
    if ls~=nil then
      ls=luajava.astable(File(path).listFiles()) --全局文件列表变量
      table.sort(ls,function(a,b)
        return (a.isDirectory()~=b.isDirectory() and a.isDirectory()) or ((a.isDirectory()==b.isDirectory()) and a.Name<b.Name)
      end)
     else
      ls={}
    end
    for index,c in ipairs(ls) do
      if c.isDirectory() then--如果是文件夹则
        adpq.add{wjm=c.Name,wjlx="res2/folder.png"}
       elseif c.isFile() then
        adpq.add{wjm=c.Name,wjlx="res2/file.png"}
      end
    end
  end
  wh=activity.getWidth()
  pio=(wh/10)*8

  左侧滑.setDrawerListener(DrawerLayout.DrawerListener{

    onDrawerSlide=function(v,i)
      --btn.setTextScaleX(i+0.7*1.5)
      cf.setTranslationX(i*pio)
      --ch.setTranslationX(i*250)

      --ch.setTransitionAlpha(i)
      -- cf.setTranslationX(i*pio)
      --ch.setTranslationX(i*250)
      --   ch.setTranslationY(i*100)

      cf.setTranslationX(i*250)
      cf.setTranslationY(i*100)
      --lv.setTranslationX(i*250)
      --lv.setTranslationY(i*100)




      --ck.setTranslationX(i)
      --ch.setRotationX(i*360)
      --ch.setRotationY(i*360)
      --ch.setRotation(i*360)
      其他1x.setRotation(i*30)
      ch.setAlpha(i)
      ch.setScaleY(i)
      lv.setAlpha(i)
      lv.setScaleY(i)
      --cf.setAlpha(i)
      --cf.setScaleY(i)

      --  ch.setAlpha(i)
      --   ch.setScaleY(i)
      --[[     if i==1.0 then
       
      vi.setBackgroundColor(0xFF00E300)
      cft.setCardElevation(10)
    else
    
      vi.setBackgroundColor(0x00000000)
      cft.setCardElevation(0)
    end]]
    end,
    --  onDrawerOpened=function(v)

    --  end,
    --  onDrawerClosed=function(v)

    --  end,

  })

  o=RippleHelper(lv)
  o.RippleColor=0x34FFFFFF

  lv.onItemClick=function(l,v,p,s)--列表点击事件
    项目=tostring(v.tag.wjm.Text)
    collectgarbage("collect")
    if tostring(cp.Text)==tostring(项目名称) then
      路径=ls[p+1]
     else
      路径=ls[p]
    end
    collectgarbage("collect")
    if 项目=="返回上级目录" then
      collectgarbage("collect")
      SetItem(File(cp.Text).getParentFile())
     elseif 路径.isDirectory() then
      SetItem(路径)
     elseif 路径.isFile() then
      local a=路径.Name
      collectgarbage("collect")
      if a:find("%.lua$") or a:find("%.aly$") then
        local b=File(tostring(路径)).getParentFile()
        if tostring(b)==tostring(项目名称) then
          保存()
          q.text=io.open(tostring(路径)):read("*a")

          xy33.text=路径.Name
          左侧滑.closeDrawer(3)
         else
          local c=File(tostring(b)).getParentFile()
          if tostring(c)==tostring(项目名称) then
            保存()
            q.text=io.open(tostring(路径)):read("*a")

            xy33.text=b.Name.."/"..路径.Name
            左侧滑.closeDrawer(3)
            collectgarbage("collect")
           else
            collectgarbage("collect")
            local d=File(tostring(c)).getParentFile()
            if tostring(d)==tostring(项目名称) then
              保存()
              q.text=io.open(tostring(路径)):read("*a")
              xy33.text=c.Name.."/"..b.Name.."/"..路径.Name
              左侧滑.closeDrawer(3)
             else
              local e=File(tostring(d)).getParentFile()
              if tostring(e)==tostring(项目名称) then
                保存()
                q.text=io.open(tostring(路径)):read("*a")
                xy33.text=d.Name.."/"..c.Name.."/"..b.Name.."/"..路径.Name
                左侧滑.closeDrawer(3)

               else
                local f=File(tostring(e)).getParentFile()
                if tostring(f)==tostring(项目名称) then
                  保存()
                  q.text=io.open(tostring(路径)):read("*a")
                  xy33.text=e.Name.."/"..d.Name.."/"..c.Name.."/"..b.Name.."/"..路径.Name
                  左侧滑.closeDrawer(3)

                 else
                  local g=File(tostring(f)).getParentFile()
                  if tostring(g)==tostring(项目名称) then
                    保存()
                    q.text=io.open(tostring(路径)):read("*a")
                    xy33.text=f.Name.."/"..e.Name.."/"..d.Name.."/"..c.Name.."/"..b.Name.."/"..路径.Name
                    左侧滑.closeDrawer(3)

                   else
                    local h=File(tostring(g)).getParentFile()
                    if tostring(h)==tostring(项目名称) then
                      保存()
                      q.text=io.open(tostring(路径)):read("*a")
                      xy33.text=g.Name.."/"..f.Name.."/"..e.Name.."/"..d.Name.."/"..c.Name.."/"..b.Name.."/"..路径.Name
                      左侧滑.closeDrawer(3)

                     else
                      local i=File(tostring(h)).getParentFile()
                      if tostring(i)==tostring(项目名称) then
                        保存()
                        q.text=io.open(tostring(路径)):read("*a")
                        xy33.text=h.Name.."/"..f.Name.."/"..e.Name.."/"..d.Name.."/"..c.Name.."/"..b.Name.."/"..路径.Name
                        左侧滑.closeDrawer(3)

                       else
                        local j=File(tostring(i)).getParentFile()
                        if tostring(j)==tostring(项目名称) then
                          保存()
                          q.text=io.open(tostring(路径)):read("*a")
                          xy33.text=i.Name.."/"..f.Name.."/"..e.Name.."/"..d.Name.."/"..c.Name.."/"..b.Name.."/"..路径.Name
                          左侧滑.closeDrawer(3)

                         else
                          local k=File(tostring(j)).getParentFile()
                          if tostring(k)==tostring(项目名称) then
                            保存()
                            q.text=io.open(tostring(路径)):read("*a")
                            xy33.text=j.Name.."/"..f.Name.."/"..e.Name.."/"..d.Name.."/"..c.Name.."/"..b.Name.."/"..路径.Name
                            左侧滑.closeDrawer(3)

                          end
                        end
                      end
                    end
                  end
                end
              end
            end
          end
        end
       else
        collectgarbage("collect")
        print("暂不支持打开此类文件哦")
      end
    end
  end
  collectgarbage("collect")
  SetItem(StartPath)
end
import("java.io.File")
功能=luajava.astable(File(项目名称).listFiles())
function strippath(filename)
  return string.match(filename, ".+/([^/]*%.%w+)$")
end
--[[function stripextension(filename)
    local idx = filename:match(".+()%.%w+$")
    if(idx) then
      return filename:sub(1, idx-1)
     else
      return filename
    end
  end
  function getExtension(str)
    return str:match(".+%.(%w+)$")
  end]]
--功能={"打开","新建","调色","打包","备份","属性","跳转","布局","格式","编译"}
for i=1,#功能 do
  button3={
    Button;
    text=(strippath(tostring(功能[i])));
    layout_width="fill";
    layout_height="fill";
    background="#ffffff";
    padding="5dp",
    id="sssssw",
    AllCaps=false,
    textColor=颜色4,
  };
  m3=loadlayout(button3)
  bar3.addView(m3)
  --波纹(sssssw,0xE7EAEEEE)
  m3.onClick=function(v)
    ii=v.text
    q.text=io.open(tostring(项目名称.."/"..ii)):read("*a")
    xy33.text=ii
  end
end




功能={"打开","新建","调色","打包","备份","属性","跳转","布局","格式","编译"}
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
  --波纹(sssssw,0xE7EAEEEE)
  m2.onClick=function(v)
    i=v.text
    if i=="打开" then
      左侧滑.openDrawer(3)
    end
    if i=="新建" then
      local cj={
        LinearLayout;
        layout_height="fill";
        layout_width="fill";
        gravity="center";
        {
          LinearLayout;
          backgroundColor=颜色1,
          layout_height="210dp";
          layout_width="fill";
          orientation="vertical";
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
            layout_height="80dp";
            layout_width="match_parent";
            orientation="horizontal";
            gravity="center";
            {
              EditText;
              layout_marginTop="10dp";
              layout_width="150dp";
              hint="请输入新建文件名称";
              textSize="15sp";
              hintTextColor=颜色3,
              textColor=颜色3,
              id="输入文件名称";
              gravity="center";
            };
            {
              Spinner;
              layout_marginLeft="10dp";
              layout_marginTop="9dp",
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
      Dialog1=MyBottomSheetDialog()
      .设置布局(cj)
      .设置弹窗背景("#ffffffff")
      .设置弹窗圆角("10dp")
      .显示()
      local x=nil
      美化按钮2(取消创建文件,10,0x7E000000,0x7a00bfff)
      美化按钮2(确定创建文件,10,0x7a00bfff,0x7a00bfff)
      控件圆角(输入文件名称,颜色2,30)
      function 取消创建文件.onClick()
        dialog1.dismiss()
      end
      类型.onItemSelected=function(l,v,p,i)
        x=v.text
      end
      function 确定创建文件.onClick()
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
              adp.add{text=输入文件名称.text..".lua"}
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
              adp.add{text=输入文件名称.text..".alp"}
             else
              print"文件已存在"
            end
           elseif x=="txt" then
            if not File(项目名称.."/"..输入文件名称.text..".txt").isFile() then
              创建文件(项目名称.."/"..输入文件名称.text..".txt")
              dialog1.dismiss()
              print"创建成功"
             else
              print"文件已存在"
            end
           elseif x=="文件夹" then
            if not File(项目名称.."/"..输入文件名称.text).isDirectory() then
              创建文件夹(项目名称.."/"..输入文件名称.text)
              dialog1.dismiss()
              print"创建成功"
             else
              print"文件夹已存在"
            end
          end
        end
      end
      --功能={"打开","新建","调色板","打包","备份","属性","转到","布局","替换","编译"}
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
      调色板()
    end
    if i=="打包" then
      保存()
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
      })
    end
    if i=="跳转" then
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
            q.text=io.open(项目名称.."/"..xy33.text):read("*a")
          end
        end
       else
        print("请选择aly文件")
      end
    end
    if i=="格式" then
      q.format()
    end
    if i=="编译" then
      local 路径,错误=console.build(项目名称.."/"..xy33.text)
      if 路径 then
        print("编译成功"..路径)
       else
        print("编译失败"..错误)
      end
    end
  end
end

switch 状态
 case true
  刷新路径(项目名称)
  是否备份()
  q.text=io.open(项目名称.."/main.lua"):read("*a")
end
activity.getWindow().setSoftInputMode(WindowManager.LayoutParams.SOFT_INPUT_ADJUST_RESIZE)

q.setBasewordColor(0xff8dbdc9)--基词
q.setPanelBackgroundColor(颜色1)--卡片颜色
q.setPanelTextColor(0xFF03A9F4)--卡片字体颜色
q.setStringColor(0xFF03A9F4)--字符串颜色
q.setTextColor(颜色3)--文本颜色
q.setUserwordColor(0xFF03A9F4)--数字
q.setCommentColor(0xffa0a0a0)--注释颜色
q.setKeywordColor(0xFF03A9F4)--if then等
hs={"删除文件()"}
q.addNames(hs)
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
  --波纹(sssss,0xE7EAEEEE)
  m.onClick=function(v)
    if v.text=="Fun" or v.text=="fun" or v.text=="function" or v.text=="Function" then
      q.paste("function")
     else
      if v.text=="End" or v.text=="end" then
        q.paste("end")
       else
        q.paste(v.Text)
      end
    end
  end
  m.onLongClick=function(v)
    if v.text=="Fun" or v.text=="fun" or v.text=="function" or v.text=="Function" then
      q.paste("function")
     else
      if v.text=="End" or v.text=="end" then
        q.paste("end")
       else
        q.paste(v.Text..v.text)
      end
    end
    return true
  end
end
q.OnSelectionChangedListener=function(a,b,c)
  if a==true then
    选择代码1.setVisibility(0)
   else
    选择代码1.setVisibility(8)
  end
end
function XY11.onClick()
  q.selectAll()
end
function XY21.onClick()
  q.cut()
end
function XY31.onClick()
  q.copy()
end
function XY41.onClick()
  q.paste()
end
--[[波纹(XY11,0xFFD9D9D9)
波纹(XY21,0xFFD9D9D9)
波纹(XY31,0xFFD9D9D9)
波纹(XY41,0xFFD9D9D9)
波纹(撤销,0xFFD9D9D9)
波纹(恢复,0xFFD9D9D9)
波纹(布局助手,0xFFD9D9D9)
波纹(其他1x,0xFFD9D9D9)
波纹(其他2x,0xFFD9D9D9)
波纹(运行,0xFFD9D9D9)
波纹(确定转到,0xFFD9D9D9)]]

function 确定转到.onClick()
  if #转到行数.text~=0 then
    q.gotoLine(tointeger(转到行数.text))
  end
end
function 关闭转到.onClick()
  转到.setVisibility(8)
end

ti1=Ticker()
ti1.Period=100
ti1.onTick=function()
  保存()
  luapath=项目名称.."/"..xy33.text
end
switch 状态
 case true
  ti1.start()
end
function 其他1x.onClick()
  if 左侧滑.isDrawerOpen(3) then
    左侧滑.closeDrawer(3)
   else
    左侧滑.openDrawer(3)
  end
end
function 布局助手.onClick()
  保存()
  if xy33.text:find("%.aly$") then
    activity.newActivity("main9",android.R.anim.fade_in,android.R.anim.fade_out,{项目名称.."/"..xy33.text,项目名称})
    function onResult(a,b)
      if a=="main9" then
        q.text=io.open(项目名称.."/"..xy33.text):read("*a")
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
  q.undo()
end
function 恢复.onClick()
  q.redo()
end
function 其他2x.onClick()
  pop=PopupMenu(activity,其他2x)
  menu=pop.Menu
  --menu.add("手册").onMenuItemClick=function()
  --end
  menu.add("Java Api").onMenuItemClick=function()
    activity.newActivity("main10",android.R.anim.fade_in,android.R.anim.fade_out)
  end
  menu.add("保存并退出").onMenuItemClick=function()
    q.format()
    保存()
    ti1.stop()
    ti.stop()
    activity.finish()
  end
  pop.show()
end

function onKeyDown(e)
  if e == 4 then
    q.format()
    保存()
    ti1.stop()
    ti.stop()
  end
end