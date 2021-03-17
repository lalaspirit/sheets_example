%%%-------------------------------------------------------------------
%%% @author Nero.li
%%% @copyright (C) 2021, <Lilith>
%%% @doc
%%%     定义表格record，用于其他模块引用和生成sheet_xxx文件
%%% @end
%%% Created : 02. 三月 2021 15:05
%%%-------------------------------------------------------------------
-authour("nero.li").

-ifndef(__SHEETS_DEFINE_H__).
-define(__SHEETS_DEFINE_H__, true).


% @sheet(单位表)
% @file(Unit.csv)
% @def(UnitType, ["Hero", "Npc"])
% @def(UnitStat, ["Power", "Health", "Armor"])
-record(sheet_unit, {
  id,            % ID   @ref(ID)
  name,          % 名称  @ref(Name)
  type,          % 类型  @enum(UnitType) | cast(?to_atom)
  level = 1,     % 等级  @check(Level) -> Level < 1000
  sex = 0,       % 性别  @enum(0, 1)
  stats = [],    % 属性  @map("Stat (\\w+)") | key_enum(UnitStat) | key_cast(?to_atom)
  equips = [],   % 装备  @list("Equip \\d+")
  items = [],    % 道具  @prop("Item ID (\\d+)", "Item Amount (\\d+)") | filter({ID, Amount}) -> ID > 0 andalso Amount > 0
  loots = [],    % 掉落  @prop("Loot Type (\\d+)", "Loot ID (\\d+)", "Loot Amount (\\d+)") | filter({_, _, Amount}) -> Amount > 0 | key_cast(?to_atom)
  element = {fire, water},
  extra = [{checkable, true}],
  reserved       % 预留  @ignore
}).

% @sheet(关卡表)
% @file(Stage.csv)
-record(sheet_stage, {
  id,            % ID   @ref(ID)
  name,          % 名称  @ref(Name)
  chapter,       % 章节
  difficulty = 1,% 难度
  level = 1,     % 等级  @check(Level) -> Level < 1000
  loots = [],    % 掉落  @prop("Loot Type (\\d+)", "Loot ID (\\d+)", "Loot Amount (\\d+)") | filter({_, _, Amount}) -> Amount > 0 | key_cast(?to_atom)
  reserved       % 预留  @ignore
}).

-endif.