// 跑图CFG扩展脚本 by Purp1e
// 本文件放在此处  ..\Counter-Strike Global Offensive\csgo\scripts\vscripts
// 加载方法 script_execute practiceExt

// 建议绑定的快捷键 分别为i/o/[/]
// 若不使用practice.cfg 单独使用本脚本 请删去以下四行的注释//
//SendToConsole( @"bind i ""script storeA()"" " );
//SendToConsole( @"bind o ""script loadA()"" " );
//SendToConsole( @"bind [ ""script storeB()"" " );
//SendToConsole( @"bind ] ""script loadB()"" " );
//SendToConsole( @"bind \ ""script sethp()"" " );

// 初始化
ent <- null;		//定义物体变量
command <- null;		//定义指令变量，存放指令字符串
PositionA <- Vector(0, 0, 0);		//定义A位置变量
AngleA <- Vector(0, 0, 0);		//定义A角度变量
PositionB <- Vector(0, 0, 0);		//定义B位置变量
AngleB <- Vector(0, 0, 0);		//定义B角度变量
name <- ["knife_butterfly", "knife_Karambit", "knife_stiletto", "knife_ursus", "bayonet", "knife_Flip", "knife_m9_bayonet", "knife_css", "knife_widowmaker","knife_Skeleton", "knife_falchion", "knife_gypsy_jackknife", "knife_ghost", "knife_survival_bowie", "knife_tactical", "knife_push", "knife_canis", "knife_outdoor", "knife_cord", "knife_gut"];
name_print <- ["蝴蝶刀", "爪子刀", "短剑", "熊刀", "刺刀", "折叠刀", "M9刺刀", "海豹短刀", "锯齿爪刀", "骷髅匕首", "弯刀", "折刀", "幽灵之刃", "鲍伊猎刀", "猎杀者匕首", "暗影双匕", "求生匕首", "流浪者匕首", "系绳匕首", "穿肠刀"];
choice <- [0, 0, 0, 0];
printl( @">>> 跑图CFG扩展脚本初始化完成" );


function sethp() {
	SendToConsole( @"ent_fire !self addoutput ""health 100"" " );
}

//生成刀
function dropknife(i) {
	SendToConsole( "slot3" );
	local n = i * 5 + choice[ i ];
	SendToConsole( "give weapon_" + name[ n ] );
	ScriptPrintMessageCenterAll( name_print[n] + " Get" );
	choice[i] = (choice[i] + 1 ) % 5;
}

//使刀可捡并丢出原来的刀
function knifeout() {
	EntFire("weapon_knife", "addoutput", "classname weapon_knifegg");
	SendToConsole( "drop" );
}

// 因为无法获得pitch 竖直角度总是为0 故此处主要用作弹出提示 等待改进
function storeA() {
	//获取玩家实体 获取时总是1次成功1次失败故使用 或 运算
	if ( ( ent = Entities.FindByClassname(ent, "player") ) != null || ( ent = Entities.FindByClassname(ent, "player") ) != null ) {	
		PositionA = ent.GetOrigin();	//获取位置
		AngleA =  ent.GetAngles();	//获取角度
		ScriptPrintMessageCenterAll( "已保存点A" );
		printl( ">>> 点A指令如下" )
	}
	//else {
	//	ScriptPrintMessageCenterAll( "保存点A失败，位置为(0, 0, 0)" ); 
	//}
}

function loadA() {
	if( PositionA.x || PositionA.y || AngleA.x || AngleA.y || AngleA.z ) {
		command = "setpos " + PositionA.x + ", " + PositionA.y + ", " + PositionA.z + ";";
		//command = command + "setang " + AngleA.x + ", " + AngleA.y + ", " + AngleA.z + ";" ;
		SendToConsole( command );
		SendToConsole( "-moveleft;-moveright;-forward;-back" );
		ent.SetVelocity( Vector(0,0,0) );
		ScriptPrintMessageCenterAll( "已回到点A" ); 
	}
	//else {
	//	ScriptPrintMessageCenterAll( "回到点A失败，位置为(0, 0, 0)" ); 
	//}
}

function storeB() {
	//获取玩家实体
	if ( ( ent = Entities.FindByClassname(ent, "player") ) != null || ( ent = Entities.FindByClassname(ent, "player") ) != null ) {	
		PositionB = ent.GetOrigin();	//获取位置
		AngleB =  ent.GetAngles();	//获取角度
		ScriptPrintMessageCenterAll( "已保存点B" );
		printl( ">>> 点B指令如下" )
	}
	//else {
	//	ScriptPrintMessageCenterAll( "保存点B失败，位置为(0, 0, 0)" ); 
	//}
}

function loadB() {
	if( PositionB.x || PositionB.y || AngleB.x || AngleB.y || AngleB.z ) {
		command = "setpos " + PositionB.x + ", " + PositionB.y + ", " + PositionB.z + ";";
		//command = command + "setang " + AngleB.x + ", " + AngleB.y + ", " + AngleB.z + ";" ;
		SendToConsole( command );
		SendToConsole( "-moveleft;-moveright;-forward;-back" );
		ent.SetVelocity( Vector(0,0,0) );
		ScriptPrintMessageCenterAll( "已回到点B" ); 
	}
	//else {
	//	ScriptPrintMessageCenterAll( "回到点B失败，位置为(0, 0, 0)" ); 
	//}
}

function cam( i, j ) {
	//分享摄像机运动指令 A to B . i 和 j 与运动速度相关
	if( PositionA.x || PositionA.y || AngleA.x || AngleA.y || PositionB.x || PositionB.y || AngleB.x || AngleB.y ) {
		command = "spec_mode 6;";
		command = command + "spec_goto " + PositionA.x + " " + PositionA.y + " " + PositionA.z + " " + AngleA.x + " " + AngleA.y  +";";
		command = command + "spec_lerpto " + PositionB.x + " " + PositionB.y + " " + PositionB.z + " " + AngleB.x + " " + AngleB.y + " " + i + " " + j + ";" ;
		printl( "" );
		printl( ">>> 摄像机运动指令已生成" );
		printl( "" );
		printl( command );
	}
	else {
		ScriptPrintMessageCenterAll( "分享摄像机运动指令失败，点A或B位置为(0, 0, 0)" ); 
	}
}

function hint() {
	//打印practice.cfg中的指令提示
	printl("═════════════════════════════════════════════════════════════");
	printl("──── 加载设置[auto.cfg]		:  exec auto");
	printl("──── 跑图,练习道具  		:  exec practice");
	printl("──── 对枪,SOLO   		:  exec solo");
	printl("──── 地图中加载设置[auto.cfg]  	:  Insert键");
	printl("──── 地图中一键跑图[practice.cfg]	:  Delete键");
	printl("──────────────────────  BOT相关  ─────────────────────────────");
	printl("──── BOT难度(3>2>1>0)	:  bot_difficulty 3;");
	printl("──── BOT静止	 	:  bot_stop 1;");
	printl("──── BOT拿刀		:  bot_knives_only;");
	printl("──── BOT拿手枪		:  bot_pistols_only;");
	printl("──── BOT全武器		:  bot_all_weapons;");
	printl("──── BOT加入队伍(any=任意)	:  bot_join_team ct;");
	printl("──── BOT模仿玩家动作 	:  bot_mimic 1;");
	printl("──── BOT模仿角度偏移 	:  bot_mimic_yaw_offset 180;");
	printl("──── BOT蹲下  		:  bot_crouch 1; ");
	printl("──────────────────────  常用指令  ─────────────────────────────");
	printl("──── 热身开始		:  mp_warmup_start;");
	printl("──── 热身结束		:  mp_warmup_end;");
	printl("──── 重新开始游戏		:  mp_restartgame 1;");
	printl("──── 回合开始静止1s      	:  mp_freezetime 1;");
	printl("──── 回合结束等待2s      	:  mp_round_restart_delay 2;");
	printl("──── 投掷物轨迹时间30s   	:  sv_grenade_trajectory_time 30;");
	printl("──── 弹着点时间30s		:  sv_showimpacts_time 30;");
	printl("──── C4爆炸时间999s     	:  mp_c4timer 999;");
	printl("──── C4任意处放置		:  mp_plant_c4_anywhere 1;");
	printl("──── 队友伤害		:  mp_teammates_are_enemies 1;");
	printl("──── 忽视胜利条件	    	:  mp_ignore_round_win_conditions 1;");
	printl("──── 雷达显示所有人		:  mp_radar_showall 1;" );
	printl("──── 调整护甲(2=全甲)	:  mp_free_armor 1;");
	printl("──── 无敌(个人)		:  god;");
	printl("──── 无敌(所有人)		:  gods;");
	printl("───────────────────────  快捷键  ─────────────────────────────");
	printl("──── 弹着点/投掷物轨迹显示 	:  H");
	printl("──── BOT蹲下 		:  J");
	printl("──── 杀死BOT 		:  K");
	printl("──── 切换透视模式 		:  L");
	printl("──── 切换Bhop开和关	:  P");
	printl("──── 重现最近一次投掷物	:  T");
	printl("──── 切换实时预测轨迹	:  ，");
	printl("──── 加速时间，松开恢复	:  。 （帧数暴跌，队友会卡住）");
	printl("──── 预测投掷物轨迹30s	:  /");
	printl("──── 添加BOT  		:  ↑");
	printl("──── 删除BOT  		:  ↓");
	printl("──── 放置BOT  		:  ←");
	printl("──── 重新开始 		:  →");
	printl("──── 飞行      		:  Alt");
	printl("──────────────────────  脚本功能  ─────────────────────────────");
	printl("──── 保存点A 		:  i");
	printl("──── 回到点A 		:  [");
	printl("──── 保存点B 		:  o");
	printl("──── 回到点B 		:  ]");
	printl(@"──── 补齐血条头甲和满道具	:  \");
	printl("──── 打印提示(指令)	:  hint");
	printl("───────────────  依次生成原版刀 *装备原版刀时生效*  ───────────");
	printl("──── 蝴蝶 > 爪子 > 短剑 > 熊刀 > 刺刀 : 9");
	printl("──── 折叠 > M9 > 海豹 > 锯齿爪 > 骷髅 : 0");
	printl("──── 弯刀 > 折刀 > 幽灵之刃 > 鲍伊猎刀 > 猎杀者匕首 : -");
	printl("──── 暗影双匕 > 求生 > 流浪者 > 系绳 > 穿肠 : =");
	printl("═════════════════════════════════════════════════════════════");
	printl("·在线游戏时请勿加载或多次加载本CFG，可能会被踢出");
}