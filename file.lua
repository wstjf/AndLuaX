require "import"
import "android.os.*"
import "android.widget.*"
import "android.view.*"
import "android.app.*"
import "android.graphics.Typeface"
import "android.content.Intent"
import "android.content.Context"
import "android.content.pm.PackageManager"
import "android.graphics.drawable.ColorDrawable"
import "android.content.Intent"
import "java.io.File"
import "other"
import "Dialog"
import "toast"
import "main6"
title,StartPath,filterTypes=...
local a=io.open(activity.getLuaDir().."/Verify/set4.XY"):read("*a")
local ip=a:match("2(.-)"..'"')
if ip=="开" then
  颜色1=0xff303030
  颜色2=0xff212121
  颜色3=0xffffffff
  颜色4=0xffffffff
  颜色5=0xff303030
  颜色6=0x5FFFFFFF
 else
  颜色1=0xFF03A9F4
  颜色3=0xff303030
  颜色4=0xffffffff
  颜色5=0x5FFFFFFF
  颜色2=0xFFF2F1F6
  颜色6=0xff303030
end
ProgressBarMargin=utf8.len(title)*5 .."dp"

RippleBoundary="50dp"
RippleRange=tostring(tonumber(RippleBoundary:match("%d%d"))+10).."dp"
RippleAngle=tostring(tonumber(RippleBoundary:match("%d%d"))/2).."dp"
MainColor=颜色1--主色
SecondaryColor=颜色1--辅助色
TextColor=颜色4--文本色
IconColor=颜色4
sdk=Build.VERSION.SDK_INT
if sdk >= 19 then
  resourceId = activity.getResources().getIdentifier("status_bar_height", "dimen", "android")
  statusHeight= activity.getResources().getDimensionPixelSize(resourceId)
 else
  statusHeight= 0
end

layout=
{
  LinearLayout;
  orientation="vertical";
  layout_width="fill";
  layout_height="fill";
  {
    LinearLayout;
    gravity="center";
    layout_height="1.5%h";
    orientation="horizontal";
    backgroundColor=颜色1;
    layout_width="fill";
    

      
 }, 

 
 

 
  {
    LinearLayout;
    layout_width="fill";
    orientation="vertical";
    layout_height="fill";
    Focusable=true;
    FocusableInTouchMode=true;
    Background=Background,

    {
      FrameLayout;
      layout_width="fill";
      id="ActionBar";
      layout_height="75dp";
      BackgroundColor=MainColor,

      {
        FrameLayout,
        layout_width="fill";
        layout_height=activity.Height*0.105;
        layout_gravity="bottom",

        {
          FrameLayout,
          layout_width="fill";
          layout_height=activity.Height*0.105;
          layout_gravity="top",

          {TextView,
            BackgroundColor=0,
            text="选择源码(*.alp)";
            textSize="16dp";
            Typeface=Typeface.defaultFromStyle(Typeface.BOLD),
            singleLine="true";
            layout_marginRight="60dp";
            layout_gravity="center";
            textColor=TextColor;
          },
          {HorizontalScrollView;
            HorizontalScrollBarEnabled=false;
            layout_height="20dp";
            layout_width="100%w";
            layout_gravity="bottom";
            layout_marginLeft="3dp";
            layout_marginRight="3dp";
            {TextView,
              id="subTitle",
              layout_marginLeft="65dp";
              text=path;
              textSize="13dp";
              singleLine="true";
              layout_width="300dp";
              textColor=TextColor;
            },
          },
        
          {ProgressBar;
            style="?android:attr/progressBarStyleSmallTitle";
            layout_marginRight=ProgressBarMargin;
            layout_gravity="center";
            Visibility=View.INVISIBLE;
          };
            
          {
            RippleLayout,
            layout_width="fill";
            layout_height="fill";
            RippleColor=RippleColor,

            {CardView,
              BackgroundColor=0,
              layout_height=RippleBoundary,
              clickable=true,
              layout_width=RippleBoundary,
              radius=RippleAngle;
              CardElevation="0dp";
              layout_gravity="center|left",
              x=tonumber("-"..activity.Width*0.0001),
              {FrameLayout,
                layout_height=RippleRange,
                layout_width=RippleRange,
                layout_gravity="center",
                {TextView,
                  id="back",
                  layout_height=RippleRange,
                  layout_width=RippleRange,
                  layout_gravity="center",
                },
                {
                  ImageView,
                  --id="Navi",
                  layout_height="27dp",
                  layout_width="27dp",
                  layout_marginLeft="25dp";
                  layout_marginTop="23dp";
                  ColorFilter=IconColor,
                  src="res/AndLuaXY8.png",
                },
              },
            },
          {CardView,
              BackgroundColor=0,
              layout_height=RippleBoundary,
              clickable=true,
              layout_width=RippleBoundary,
              radius=RippleAngle;
              CardElevation="0dp";
              layout_gravity="center|right",
              x=tonumber("-"..activity.Width*0.0001),
              {FrameLayout,
                layout_height=RippleRange,
                layout_width=RippleRange,
                layout_gravity="center",
                {TextView,
                  id="refresh",
                  layout_height=RippleRange,
                  layout_width=RippleRange,
                  layout_gravity="center",
                },
                {
                  ImageView,
                  --id="Navi",
                  layout_height="27dp",
                  layout_width="27dp",
                  layout_marginTop="23dp";
                  ColorFilter=IconColor,
                  src="res/AndLuaXY6.png",
                },
              },
            },
          },
        },
      },
    };
    {
      FrameLayout,
      layout_width="fill",
      layout_height="fill",
      BackgroundColor=0xffffffff;
      {ListView;
        id="listview";
        layout_width="fill";
        Divider=ColorDrawable(0);
      };
    };
  };
};


activity.setTheme(android.R.style.Theme_DeviceDefault_Light_NoActionBar)
activity.setContentView(loadlayout(layout))
if sdk >= 21 then
  ActionBar.setElevation(15)
end

if sdk>= 19 then
  activity.getWindow().addFlags(WindowManager.LayoutParams.FLAG_TRANSLUCENT_STATUS);
end


ItemLayout={
  LinearLayout;
  orientation="vertical";
  layout_width="fill";
  {
    CardView;
    CardElevation=0;
    layout_width="fill";
    layout_margin="5dp";
    layout_height="70dp";
    BackgroundColor=0;
    id="cv";
    {
      ImageView;
      layout_marginRight="130dp";
      layout_width="50dp";
      layout_gravity="center";
      layout_height="50dp";
      id="icon";
    };
    {
      TextView;
      id="name";
      Typeface=Typeface.defaultFromStyle(Typeface.BOLD),
      layout_marginBottom="15dp";
      layout_width="200dp";
      layout_marginLeft="30dp";
      layout_gravity="center";
      singleLine=true;
      ellipsize="end";
    };
    {
      TextView;
      id="hint";
      layout_marginLeft="20dp";
      layout_marginTop="10dp";
      layout_width="200dp";

      text="lasttime";
      layout_gravity="center";
      singleLine=true;
      ellipsize="end";
    };
  };
};


function ToColor(path,color)
  import "android.graphics.drawable.BitmapDrawable"
  import "android.graphics.PorterDuffColorFilter"
  import "android.graphics.PorterDuff"
  import "android.graphics.PorterDuff$Mode"
  local aa=BitmapDrawable(loadbitmap(tostring(path)))
  aa.setColorFilter(PorterDuffColorFilter(color,PorterDuff.Mode.SRC_ATOP))
  return aa
end


LuaDir=activity.LuaDir
ImagePath=LuaDir.."/res2/"
IconColor=SecondaryColor
IconTable={
  MusicIcon=ToColor(ImagePath.."music.png",IconColor),
  ApkIcon=ToColor(ImagePath.."apk.png",IconColor),
  FolderIcon=ToColor(ImagePath.."folder.png",IconColor),
  FileIcon=ToColor(ImagePath.."file.png",IconColor),
  ImageIcon=ToColor(ImagePath.."image.png",IconColor),
  PdfIcon=ToColor(ImagePath.."pdf.png",IconColor),
  TextIcon=ToColor(ImagePath.."text.png",IconColor),
  VideoIcon=ToColor(ImagePath.."video.png",IconColor),
  XmlIcon=ToColor(ImagePath.."xml.png",IconColor),
}


FileTypesTable={
  MusicTypes={".mp3",".flac",".m4a",".mod"},
  CompressionTypes={".zip",".rar",".jar"},
  PictureTypes={".png",".jpg",".jpeg"},
  TextTypes={".conf",".txt",".text",".html",".ini",".rtf",".log",".sh",".rc"},
  VideoTypes={".mp4",".rmvb",".avi",".mkv"},
}
function SetList(adp)
  listview.Adapter=adp
end
function SetStart(path)
  if path==tostring(subTitle.Text) then
    sel=listview.getFirstVisiblePosition()
   else
    sel=0
  end
end
function SetEnd(path)
  listview.setSelection(sel)
  subTitle.setText(path)
  adp=nil
  t=nil
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
美化按钮1=function(mBinding,radiu,InsideColor,T1)
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
function loadAdapter(path,adp)
  require"import"
  IconTable=luajava.astable(activity.get("IconTable"))
  FileTypesTable=luajava.astable(activity.get("FileTypesTable"))
  FilterTypes=luajava.astable(activity.get("filterTypes"))
  call("SetStart",path)
  function GetFilelastTime(path)
    import "java.util.Calendar"
    f = File(path);
    cal = Calendar.getInstance();
    time = f.lastModified()
    cal.setTimeInMillis(time);
    return cal.getTime().toLocaleString()
  end
  function rotateToFit(bm,degrees)
    import "android.graphics.Matrix"
    import "android.graphics.Bitmap"
    width = bm.getWidth()
    height = bm.getHeight()
    matrix = Matrix()
    matrix.postRotate(2)
    bmResult = Bitmap.createBitmap(bm, 0, 0, width, height, matrix, true)
    return bmResult
  end

  function GetApkIcon(archiveFilePath)
    import "android.content.pm.PackageManager"
    import "android.content.pm.ApplicationInfo"
    pm = activity.getPackageManager()
    info = pm.getPackageArchiveInfo(archiveFilePath, PackageManager.GET_ACTIVITIES);
    if info ~= nil then
      appInfo = info.applicationInfo;
      icon = pm.getApplicationIcon(appInfo);--图标
      return icon
     else
      return IconTable.ApkIcon
    end
  end

  function IfType(strings,types)
    if pcall(function()luajava.astable(types)end) then
      types=luajava.astable(types)
    end
    for i,str in ipairs(types) do
      if String(tostring(strings)).endsWith(str) then
        return true
      end
    end

  end

  function run()
    import"java.io.File"
    Lists=luajava.astable(File(path).listFiles())
    table.sort(Lists,function(a,b)
      return (a.isDirectory()~=b.isDirectory() and a.isDirectory()) or ((a.isDirectory()==b.isDirectory()) and a.Name<b.Name)
    end)
    if path~="/storage/emulated/0/" then
      adp.add({
        name="../",
        icon=IconTable.FolderIcon,
        hint="返回上级目录"})
    end
    for i,path in ipairs(Lists) do
      Tpath=tostring(path)
      if path.isDirectory() then
        adp.add({
          name=path.Name,
          icon=IconTable.FolderIcon,
          hint=GetFilelastTime(Tpath)})
       elseif IfType(path.Name,FilterTypes) then
        if IfType(path.Name,{".apk"})==true then
          adp.add({
            name=path.Name,
            icon=GetApkIcon(Tpath),
            hint=GetFilelastTime(Tpath)})

         elseif IfType(path.Name,{".xml",".Xml",".XML"})==true then
          adp.add({
            name=path.Name,
            icon=IconTable.XmlIcon,
            hint=GetFilelastTime(Tpath)})
         elseif IfType(path.Name,FileTypesTable.VideoTypes)==true then
          adp.add({
            name=path.Name,
            icon=IconTable.VideoIcon,
            hint=GetFilelastTime(Tpath)})
         elseif IfType(path.Name,FileTypesTable.TextTypes)==true then
          adp.add({
            name=path.Name,
            icon=IconTable.TextIcon,
            hint=GetFilelastTime(Tpath)})
         elseif IfType(path.Name,FileTypesTable.PictureTypes)==true then
          if loadbitmap(Tpath)~=nil then
            adp.add({
              name=path.Name,
              icon=rotateToFit(loadbitmap(Tpath),degrees),
              hint=GetFilelastTime(Tpath)})
          end
         else
          adp.add({
            name=path.Name,
            icon=IconTable.FileIcon,
            hint=GetFilelastTime(Tpath)})

        end

      end
    end
    call("SetList",adp)
    call("SetEnd",path)
  end
end

function loadList(path)
  data={}
  path=tostring(path)
  adp=LuaAdapter(activity,data,ItemLayout)
  
    t=thread(loadAdapter,path,adp)
  
end
loadList("/storage/emulated/0/")
listview.onItemClick=function(l,v,p,s)
  if v.Tag.name.Text=="../" then
    loadList(File(subTitle.Text).getParentFile())
   else
    if subTitle.Text~="/" then
      inpath=subTitle.Text.."/"..v.Tag.name.Text
     else
      inpath=subTitle.Text..v.Tag.name.Text
    end
    if File(inpath).isDirectory() then
      loadList(inpath)
     else
      local sc={
        CardView;
        radius=30;
        layout_width="match_parent";
        --orientation="vertical";
        layout_height="match_parent";
        {
          CardView;
          layout_gravity="center";
          layout_height="280dp";
          layout_width="340dp";
          backgroundColor=颜色2,
          radius=20;
          {
            TextView;
            layout_marginLeft="25dp";
            layout_marginTop="10dp";
            textSize="20sp";
            textColor="0xFF03A9F4";
            text="提示";
          };
          {
            TextView;
            textSize="15sp";
            textColor=颜色6,
            layout_marginLeft="25dp";
            text="是否导入此工程？";
            layout_marginTop="45dp";
          };
          {
            LinearLayout;
            layout_marginBottom="50dp";
            layout_gravity="bottom";
            layout_marginTop="20dp";
            layout_width="match_parent";
            layout_height="50dp";
            {
              Button;
              text="取消";
              layout_gravity="center";
              layout_marginLeft="20dp";
              id="取消导入工程";
              layout_height="40dp";
            };
            {
              LinearLayout;
              layout_width="match_parent";
              gravity="right";
              layout_height="match_parent";
              {
                Button;
                layout_marginRight="20dp";
                layout_gravity="center";
                text="导入";
                layout_height="40dp";
                id="确定导入工程";
              };
            };
          };
        };
      };

      dialog2= AlertDialog.Builder(this)
      dialog3=dialog2.show()
      dialog3.getWindow().setContentView(loadlayout(sc));
      dialog3.getWindow().setBackgroundDrawable(ColorDrawable(0x00000000));
      local dialogWindow = dialog3.getWindow();
      dialogWindow.setGravity(Gravity.BOTTOM);
  dialog3.getWindow().getAttributes().width=(activity.Width);
  dialog3.getWindow().clearFlags(WindowManager.LayoutParams.FLAG_ALT_FOCUSABLE_IM);
  美化按钮1(取消导入工程,10,0x7E000000,0x7E000000)
      美化按钮1(确定导入工程,10,0x7a00bfff,0x7a00bfff)
       function 取消导入工程.onClick()
        dialog3.dismiss()
      end
      function 确定导入工程.onClick()
        local a=File(inpath).getName()
        local b=a:match("(.-).alp")
        local c=项目文件夹.."/"..a
        local d=项目文件夹.."/"..b..".zip"
        local e=项目文件夹.."/"..b
        LuaUtil.copyDir(inpath,c)
        File(c).renameTo(File(d))
        ZipUtil.unzip(d,e)
        os.remove(d)
        dialog3.dismiss()
        activity.result{true}
      end
    end
  end
end

refresh.onClick=function()
  pop=PopupMenu(activity,refresh)
  menu=pop.Menu
  menu.add("QQ下载").onMenuItemClick=function(a)
    loadList("/storage/emulated/0/Android/data/com.tencent.mobileqq/Tencent/QQfile_recv/")
      end
  menu.add("AndLuaX+").onMenuItemClick=function(a)
    loadList("/storage/emulated/0/AndLuaX+/")
  end
  menu.add("系统下载").onMenuItemClick=function(a)
    loadList("/storage/emulated/0/Download/")
  end
  menu.add("内部存储").onMenuItemClick=function(a)
    loadList("/storage/emulated/0/")
  end
  pop.show()
end



back.onClick=function()
  activity.finish()
end

loadList(StartPath)

