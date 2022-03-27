import "Dialog"
import "AndLua"
import "android.graphics.drawable.ColorDrawable"
import "android.graphics.drawable.StateListDrawable"
import "android.graphics.PorterDuffColorFilter"
import "android.graphics.PorterDuff"
import "android.graphics.drawable.GradientDrawable"
import "toast"
import "android.graphics.Typeface"
local Text_Type=Typeface.defaultFromStyle(Typeface.BOLD)
local sd = StateListDrawable()
import "android.graphics.Color"
import "android.content.res.ColorStateList"
import "android.graphics.drawable.RippleDrawable"
import "android.content.Context"

颜色1=0x5FFFFFFF


appt={C_Bacgg=function(mBinding,radiu,InsideColor,S,S2,T1)
    local drawable = GradientDrawable(GradientDrawable.Orientation.TOP_BOTTOM,{});
    drawable.setCornerRadius(radiu);
    drawable.setColor(颜色1)
    drawable.setStroke(3, 0xCFB0B0B0)
    drawable.setGradientType(GradientDrawable.RECTANGLE);
    mBinding.setTextColor(T1)
    mBinding.setTypeface(Text_Type)
    return drawable
end}
美化按钮=function(mBinding,radiu,InsideColor,T1)
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


import "toast"
function 拖动条颜色(id,颜色)
  id.ProgressDrawable.setColorFilter(PorterDuffColorFilter(颜色,PorterDuff.Mode.SRC_ATOP))
  id.Thumb.setColorFilter(PorterDuffColorFilter(颜色,PorterDuff.Mode.SRC_ATOP))
end

local a=io.open(activity.getLuaDir().."/Verify/set4.XY"):read("*a")
local ip=a:match("2(.-)"..'"')
if ip=="开" then
  颜色1=0xff303030
 else
  颜色1=0xffffffff
end

function 调色板()
  require "import"
  import "android.widget.*"
  import "android.view.*"
  import "android.graphics.PorterDuffColorFilter"
  import "android.graphics.PorterDuff"
  调色板布局=
  {
    CardView;
    radius=30;
    layout_width="match_parent";
    --orientation="vertical";
    layout_height="match_parent";
    {
      CardView;
      layout_gravity="center";
      layout_height="350dp";
      layout_width="340dp";
      backgroundColor=颜色1,
      radius=20;
      {
        TextView;
        layout_marginTop="10dp";
        layout_marginLeft="25dp";
        text="调色板";
        textColor="0xFF03A9F4";
        textSize="20sp";
      };
      {
        LinearLayout;
        layout_width="fill";
        orientation="vertical";
        gravity="center";
        layout_height="fill";
        {
          CardView;
          id="卡片颜色";
          CardElevation=0,
          radius="125",
          layout_width="85dp";
          layout_marginTop="5dp";
          layout_height="85dp";
        };
        {
          TextView;
          id="字体颜色";
          text="0xFFFFFFFF";
          layout_marginTop="10dp";
        };
        {
          LinearLayout;
          orientation="horizontal";
          gravity="center";
          layout_marginTop="10dp";
          layout_width="fill";
          layout_height="30dp";
          {
            LinearLayout;
            gravity="center";
            {
              TextView;
              text="A";
            };
          };
          {
            LinearLayout;
            gravity="center";
            layout_width="250dp";
            {
              SeekBar;
              id="拖动一";
              layout_width="250dp";
            };
          };
          {
            LinearLayout;
            gravity="center";
            {
              TextView;
              id="文本1";
              text="0xff";
            };
          };
        };
        {
          LinearLayout;
          orientation="horizontal";
          gravity="center";
          layout_marginTop="10dp";
          layout_width="fill";
          layout_height="30dp";
          {
            LinearLayout;
            gravity="center";
            {
              TextView;
              text="B";
            };
          };
          {
            LinearLayout;
            gravity="center";
            layout_width="250dp";
            {
              SeekBar;
              id="拖动二";
              layout_width="250dp";
            };
          };
          {
            LinearLayout;
            gravity="center";
            {
              TextView;
              id="文本2";
              text="0xff";
            };
          };

        };
        {
          LinearLayout;
          orientation="horizontal";
          gravity="center";
          layout_marginTop="10dp";
          layout_width="fill";
          layout_height="30dp";
          {
            LinearLayout;
            gravity="center";
            {
              TextView;
              text="C";
            };
          };
          {
            LinearLayout;
            gravity="center";
            layout_width="250dp";
            {
              SeekBar;
              id="拖动三";
              layout_width="250dp";
            };
          };
          {
            LinearLayout;
            gravity="center";
            {
              TextView;
              id="文本3";
              text="0xff";
            };
          };
        };
        {
          LinearLayout;
          orientation="horizontal";
          gravity="center";
          layout_marginTop="10dp";
          layout_width="fill";
          layout_height="30dp";
          {
            LinearLayout;
            gravity="center";
            {
              TextView;
              text="D";
            };
          };
          {
            LinearLayout;
            gravity="center";
            layout_width="250dp";
            {
              SeekBar;
              id="拖动四";
              layout_width="250dp";
            };
          };
          {
            LinearLayout;
            gravity="center";
            {
              TextView;
              id="文本4";
              text="0xff";
            };
          };
        };
        {
          LinearLayout;
          layout_width="fill";
          gravity="right";
          layout_height="fill";
          {
            Button;
            id="关闭调色板";
            textColor="0xFF383A3D",
            backgroundColor="0xffffff";
            text="取消";
            layout_marginRight="20dp",
            layout_height="40dp",
          };
          {
            Button;
            textColor="0xFF03A9F4",
            id="复制";
            text="复制";
            layout_height="40dp",
            backgroundColor="0xffffff";
            layout_marginRight="15dp";
          };
        };
      };
    };
  };
  dialog= AlertDialog.Builder(this)
  dialog1=dialog.show()
  dialog1.getWindow().setContentView(loadlayout(调色板布局));
  dialog1.getWindow().setBackgroundDrawable(ColorDrawable(0x00000000));
  local dialogWindow = dialog1.getWindow();
  dialogWindow.setGravity(Gravity.BOTTOM);
  dialog1.getWindow().getAttributes().width=(activity.Width);
  dialog1.getWindow().clearFlags(WindowManager.LayoutParams.FLAG_ALT_FOCUSABLE_IM);
  美化按钮(关闭调色板,10,0x7E000000,0x7E000000)
  美化按钮(复制,10,0x7a00bfff,0x7a00bfff)

  拖动一.setMax(255)
  拖动二.setMax(255)
  拖动三.setMax(255)
  拖动四.setMax(255)
  拖动一.setProgress(0xFF)
  拖动二.setProgress(0xFF)
  拖动三.setProgress(0xFF)
  拖动四.setProgress(0xFF)
  拖动一.setOnSeekBarChangeListener{
    onProgressChanged=function(view, i)
      updateArgb()
    end
  }

  拖动二.setOnSeekBarChangeListener{
    onProgressChanged=function(view, i)
      updateArgb()
    end
  }

  拖动三.setOnSeekBarChangeListener{
    onProgressChanged=function(view, i)
      updateArgb()
    end
  }

  拖动四.setOnSeekBarChangeListener{
    onProgressChanged=function(view, i)
      updateArgb()
    end
  }
  function updateArgb()
    local a=拖动一.getProgress()
    local b=拖动二.getProgress()
    local c=拖动三.getProgress()
    local d=拖动四.getProgress()
    local abcd_hex=(a<<24|b<<16|c<<8|d)
    字体颜色.Text=string.format("%#x", abcd_hex)
    卡片颜色.setCardBackgroundColor(abcd_hex)
    文本1.text=string.format("%#x",a)
    文本2.text=string.format("%#x",b)
    文本3.text=string.format("%#x",c)
    文本4.text=string.format("%#x",d)
  end
  复制.onClick=function()
    local a=拖动一.getProgress()
    local b=拖动二.getProgress()
    local c=拖动三.getProgress()
    local d=拖动四.getProgress()
    local abcd_hex=(a<<24|b<<16|c<<8|d)
    local abcd_str=string.format("%#x", abcd_hex)
    写入剪切板(abcd_str) print"已复制到剪切板"
    dialog1.dismiss()
  end
  关闭调色板.onClick=function()
    dialog1.dismiss()
  end
  function showArgbDialog()
    updateArgb()
  end
  showArgbDialog()
  拖动条颜色(拖动一,0xff000000)
  拖动条颜色(拖动二,0xffff0000)
  拖动条颜色(拖动三,0xFF1DE9B6)
  拖动条颜色(拖动四,0xFF6699FF)
end

