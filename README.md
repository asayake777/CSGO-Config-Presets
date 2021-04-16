# 个人用csgo cfg

## 一.指令修改

### 1.auto.cfg

```cfg
增加参数
cl_crosshair_sniper_width 2    //自定义AWP/SSG08准星粗细，默认是1像素

bind ] say ╭∩╮( ° ͜ʖ͡°)╭∩╮       //说话指令
bind [ say (╭☞ ͡° ͜ʖ ͡° )╭☞
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
cl_weapon_debug_show_accuracy_duration 10 //子弹射击后留下弹道轨迹线保留时bind xx toggle r_drawclipbrushes 0 1 2 3  //取消显示空气墙;同时显示阻挡人物的空气墙和投掷物空气墙(红绿);只显示阻挡人物的空气墙(红色);只显示阻挡投掷物的空气墙(绿色);
vcollide_wireframe 1                      //显示物体模型线框
cl_sim_grenade_trajectory 20              //冻结当前预览的抛物线，可自定义时间(单位:s),未绑定按键
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

## 二.增加文件

- zx.cfg
准星相关文件
- play.cfg
自娱自乐模拟器
- export.cfg
导出准星和持枪参数