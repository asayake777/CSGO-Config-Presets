# 个人用csgocfg

## 一.指令修改

### 1.auto.cfg

- 增加参数

```cfg
cl_crosshair_sniper_width 2          //自定义AWP/SSG08准星粗细，默认是1像素

cl_crosshaircolor                    //0红色，1绿色，2黄色，3紫色，4淡蓝色

alias mute   "toggle volume 0.03 1"; //定义F3切换静音
bind  F3     "mute"

bind "\" "rebuy"                     //按\重买
bind "MOUSE3" "radio;slot12"         //中键 发送指令；医疗针

bind ] say ╭∩╮( ° ͜ʖ͡°)╭∩╮             //聊天框表情
bind [ say (╭☞ ͡° ͜ʖ ͡° )╭☞

bind c "use weapon_knife;use weapon_decoy;use weapon_flashbang";   //快速切闪&诱饵弹

cl_showfps                    0    //FPS信息                   <0.否 1.是>

//急停代码(谨慎使用)
alias +you"+moveright;-moveleft";    //左右急停     
alias -you"-moveright";
bind d "+you";
alias +zuo"+moveleft;-moveright";
alias -zuo"-moveleft";
bind a "+zuo";
//alias +qian"+forward;-back";       //前后急停                
//alias -qian"-forward";
//bind w "+qian";
//alias +hou"+back;-forward";
//alias -hou"-back";
//bind s "+hou";
//bind "a" "+moveleft"               //恢复默认
//bind "d" "+moveright"
//bind "w" "+forward"
//bind "s" "+back"
```

- 修改参数

```cfg
bind c "use weapon_knife;use weapon_decoy;use weapon_flashbang";   //闪&诱饵弹
```

### 2.practise.cfg

- 回到点A和保存点B 绑定按键按键互换
- 生成刀的顺序改变
- 增加参数

```cfg
sv_noclipspeed 3                          //飞行穿墙速度(速度范围：1/8，默认/5)
sv_noclipaccelerate 3                     //飞行穿墙时的移动加速度(加速度范围：1/5，默认/5)

sv_showlagcompensation 0                  //是否显示 Hitbox 模型
sv_showbullethits 0                       //是否显示子弹打中身体的位置
cl_weapon_debug_show_accuracy 1           //开启子弹射击后留下弹道轨迹线
cl_weapon_debug_show_accuracy_duration 10 //子弹射击后留下弹道轨迹线保留时
sv_showimpacts "1"                        //着弹点显示；(红蓝)/1，红点本地着弹点/2，蓝点服务器弹着点/3,关闭/0
sv_showimpacts_time "15"                  //弹着点时间（单位:s）

bind xx toggle r_drawclipbrushes 0 1 2 3  //取消显示空气墙;同时显示阻挡人物的空气墙和投掷物空气墙(红绿);只显示阻挡人物的空气墙(红色);只显示阻挡投掷物的空气墙(绿色);
vcollide_wireframe 1                      //显示物体模型线框
cl_sim_grenade_trajectory 20              //冻结当前预览的抛物线，可自定义时间(单位:s),未绑定按键
bind  mouse3   "toggle fov_cs_debug 40 0" //中键放大
```

- 小键盘更改地图

```cfg
bind kp_end        map de_dust2;      //1
bind kp_downarrow  map de_inferno;    //2
bind kp_pgdn       map de_mirage;     //3
bind kp_leftarrow  map de_overpass;   //4
bind kp_5          map de_cache;      //5
bind kp_rightarrow map de_train;      //6
bind kp_home       map de_nuke;       //7
bind kp_uparrow    map de_vertigo;    //8
bind kp_pgup                          //9
```

## 二.增减文件

- 增加

```cfg
zx.cfg        //各种准星
play.cfg      //自娱自乐模拟器
export1.cfg   //导出准星参数
export2.cfg   //导出持枪参数
```

- 删除

```cfg
原作者支付宝
```
