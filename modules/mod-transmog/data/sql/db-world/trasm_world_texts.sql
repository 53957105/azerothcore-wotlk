SET @TEXT_ID := 601083;
DELETE FROM `npc_text` WHERE `ID` IN  (@TEXT_ID,@TEXT_ID+1);
INSERT INTO `npc_text` (`ID`, `text0_0`) VALUES
(@TEXT_ID, '幻化可以改变装备的外观\r\n幻化后的装备,将与你绑定。\r\n\r\n首先选择一个位置,系统会列出此位置上的装备,可以被幻化成你背包里哪些装备的外观。\r\n选择一个装备，确认，即完成幻化。'),
(@TEXT_ID+1, '你可以管理你的幻化方案.\r\n\r\n保存你当前的幻化方案\r\n应用一个方案\r\n或者删除一个方案');

SET @STRING_ENTRY := 11100;
DELETE FROM `acore_string` WHERE `entry` IN  (@STRING_ENTRY+0,@STRING_ENTRY+1,@STRING_ENTRY+2,@STRING_ENTRY+3,@STRING_ENTRY+4,@STRING_ENTRY+5,@STRING_ENTRY+6,@STRING_ENTRY+7,@STRING_ENTRY+8,@STRING_ENTRY+9,@STRING_ENTRY+10);
INSERT INTO `acore_string` (`entry`, `content_default`) VALUES
(@STRING_ENTRY+0, '装备幻化成功.'),
(@STRING_ENTRY+1, '装备栏是空的.'),
(@STRING_ENTRY+2, '幻化源装备无效.'),
(@STRING_ENTRY+3, '幻化源装备不存在.'),
(@STRING_ENTRY+4, '待幻化的装备不存在.'),
(@STRING_ENTRY+5, '选择的道具不纯在'),
(@STRING_ENTRY+6, '你没有足够的金币.'),
(@STRING_ENTRY+7, '你没有足够的货币.'),
(@STRING_ENTRY+8, '所有的幻化已经移除.'),
(@STRING_ENTRY+9, '没有幻化.'),
(@STRING_ENTRY+10, '无效名称.');

