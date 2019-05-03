-- 先创建数据库libarary
-- 推荐参考课本，使用Navicat
USE library;

-- 用户表（临时）
DROP TABLE
IF EXISTS `user`;

CREATE TABLE `user` (
	`id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
	`username` VARCHAR (50) NOT NULL UNIQUE COMMENT '用户名',
	`password` VARCHAR (255) NOT NULL COMMENT '密码',
	`role` ENUM ('admin', 'member') NOT NULL DEFAULT 'member' COMMENT '用户角色',
	`register_time` DATETIME NOT NULL DEFAULT '1970-01-01 00:00:00' COMMENT '注册时间',
	`login_time` DATETIME NOT NULL DEFAULT '1970-01-01 00:00:00' COMMENT '登录时间',
	PRIMARY KEY (`id`)
);

INSERT INTO `user` (
	`username`,
	`password`,
	`role`
)
VALUES
	('admin', 'admin', 'admin'),
	('user1', 'user1', 'member'),
	('user2', 'user2', 'member');

-- 图书表（临时）
DROP TABLE
IF EXISTS `book`;

CREATE TABLE `book` (
	`id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
	`title` VARCHAR (100) NOT NULL COMMENT '书名',
	`subtitle` VARCHAR (100),
	`author` VARCHAR (50) COMMENT '作者',
	`CIP` CHAR (10) UNIQUE COMMENT '图书在版编目(CIP)核准号',
	`ISBN` CHAR (17) UNIQUE COMMENT '国际标准书号(ISBN)',
	`series` VARCHAR (100) COMMENT '丛书/系列',
	`pub_ins` VARCHAR (50) COMMENT '出版单位',
	`pub_loc` VARCHAR (50) COMMENT '出版地',
	`pub_time` CHAR (7) COMMENT '出版时间',
	`num_edit` INT UNSIGNED COMMENT '版次',
	`num_print` INT UNSIGNED COMMENT '印次',
	`price` FLOAT COMMENT '定价（元）',
	`language` VARCHAR (50) COMMENT '正文语种',
	`size` VARCHAR (10) COMMENT '开本或尺寸',
	`binding` VARCHAR (10) COMMENT '装帧方式',
	`category` VARCHAR (20) COMMENT '中图法分类',
	`keywords` VARCHAR (50) COMMENT '主题词/关键词',
	`description` TEXT COMMENT '简介',
	PRIMARY KEY (`id`)
);

INSERT INTO `book` (
	`title`,
	`subtitle`,
	`author`,
	`CIP`,
	`ISBN`,
	`series`,
	`pub_ins`,
	`pub_loc`,
	`pub_time`,
	`num_edit`,
	`num_print`,
	`price`,
	`language`,
	`size`,
	`binding`,
	`category`,
	`keywords`,
	`description`
)
VALUES
	(
		'大学物理学',
		'力学、电磁学',
		'张三慧编著.',
		'2009010781',
		'978-7-302-19344-9',
		NULL,
		'清华大学出版社',
		'北京',
		'2009.',
		3,
		1,
		35,
		NULL,
		'26',
		'平装',
		'O4',
		'物理学－高等学校－教材；力学－高等学校－教材；电磁学－高等学校－教材',
		'本书是张三慧教授编著的《大学物理学（第三版）》的《力学、电磁学》分册，讲述物理学基础理论中的力学和电磁学部分。'
	),
	(
		'J2EE项目开发与设计',
		NULL,
		'彭灿华, 魏世伟主编.',
		'2013019316',
		'978-7-113-15892-7',
		'普通高等学校计算机类专业特色教材. 精选系列',
		'中国铁道出版社',
		'北京',
		'2013.2',
		1,
		1,
		36,
		NULL,
		'26 × 19',
		'平装',
		'TP312',
		'JAVA语言－程序设计－高等学校－教材',
		'本书共分为13章，包括三大部分：基础篇、提高篇、综合篇。“基础篇”从环境部署、开发工具的安装讲起，由浅入深，详细讲述使用MySQL作为后台数据库进行J2EE项目开发的方法，同时结合每一章的知识点讲述相关实例，加深对知识点的理解。“提高篇”分别讲述J2EE黄金组合Struts2、Hibernate与Spring框架，并结合实例详细说明各框架的使用。本书最后一篇为“综合篇”，严格按照软件工程的规范，详细讲述项目的背景与目标、需求分析、总体设计、数据库设计、详细设计与实现，使读者深刻体会项目开发的各个环节，提升综合开发能力和实际动手能力。本书适用于高校相关专业和社会培训班的教材，同时也可用作初级、中级、高级软件设计人员阅读。'
	),
	(
		'Java程序设计基础',
		NULL,
		'陈国君主编.',
		'2015035085',
		'978-7-302-39402-0',
		'中国高等学校信息管理与信息系统专业规划教材',
		'清华大学出版社',
		'北京',
		'2015.',
		5,
		1,
		50,
		NULL,
		'26 × 19',
		'平装',
		'TP312',
		'JAVA语言－程序设计－高等学校－教材',
		'本教材系统地介绍Java语言的特点及应用技术。第1－5章讲述Java的基本知识，第6－8章讲解面向对象基础内容，这部分是关键内容；第9－11章讲解了异常处理、输入输出和多线程，这部分Java的主要内容；第12章主要讲解泛型与容器类；第13章主要讲解界面元素的布局；第14章的事件处理是本教材的重点，也是最能引起学生兴趣的内容；第15－18章讲述了绘图程序设计、小程序设计、数据库编程和网络编程。'
	),
	(
		'风声',
		NULL,
		'麦家著.',
		'2015072938',
		'978-7-5302-1495-4',
		NULL,
		'北京十月文艺出版社',
		'北京',
		'2014.12',
		1,
		1,
		35,
		NULL,
		'21 × 14',
		'精装',
		'I247.5',
		'长篇小说－中国－当代',
		'《风声》是茅盾文学奖得主麦家的经典代表作，作为《人民文学》杂志创刊58年第一次完整刊发的长篇小说，它获《人民文学》最佳长篇小说奖。《风声》讲述了地下工作者老鬼的故事。老鬼破译电报的能力超强，打入了日伪情报组织内部，面临身份暴露的危险时，他机智地与日伪和国民党军统特务周旋，制造种种假象迷惑敌人，使得组织内部陷入混乱，搞不清谁是真正的“老鬼”。但因条件所限，最后关头“老鬼”不得不牺牲生命，设法将情报成功传递出去。《风声》探索人的高度；它塑造超凡脱俗的英雄；它以对人类意志的热烈肯定和丰沛的想象，为当代小说开辟了独特的精神向度'
	),
	(
		'长江岸边说六朝',
		NULL,
		'金陵老杨著.',
		'2015284400',
		'978-7-5399-8932-7',
		NULL,
		'江苏凤凰文艺出版社',
		'南京',
		'2016.',
		1,
		1,
		48,
		NULL,
		'24 × 17',
		'平装',
		'I247.8',
		'历史故事－作品集－中国－当代',
		'南京，几千年来面朝着滔滔江水诉说一个又一个传奇故事。六朝，虽然只占据半壁江山，南京城却在此300多年间走向巅峰，成为至今都值得炫耀的骄傲。金戈铁马里隐约歌舞的身影，漫天尘土中飘来香水的味道，都汇聚在蜿蜒的秦淮河里，流向奔腾不息的江水，一任东去。留下年年不变的，只是暮春的江南，依然草长莺飞，烟雨朦胧。'
	),
	(
		'思想道德修养与法律基础',
		'2015年修订版',
		'《思想道德修养与法律基础》编写组著.',
		'2015161225',
		'978-7-04-043198-8',
		NULL,
		'高等教育出版社',
		'北京',
		'2015.7',
		7,
		1,
		12.6,
		NULL,
		'23 × 17',
		'平装',
		'G641.6；D920.4',
		'思想修养－高等学校－教材；法律－中国－高等学校－教材',
		'本书是马克思主义理论研究和建设工程重点教材。本书编写组在2013年版的基础上，根据社会主义核心价值观、党的十八届四中全会精神、习近平总书记最近的重要讲话等中央相关文件精神以及广大师生对教材提出的意见和建议，对教材进行了新的全面修订。本书立足于大学生的思想实际和生活实际，立足于思想政治理论课的教学需要，对大学生应该具备的理想信念、爱国主义、人生观、道德观、法律观等相关理论进行了充分论述，对于提高大学生的思想道德素质和法律素质具有非常重要的意义。'
	),
	(
		'中国近现代史纲要',
		'2015年修订版',
		'《中国近现代史纲要》编写组编.',
		'2015180797',
		'978-7-04-043199-5',
		NULL,
		'高等教育出版社',
		'北京',
		'2015.7',
		6,
		1,
		16.8,
		NULL,
		'23 × 17',
		'平装',
		'K25',
		'中国历史－近现代－高等学校－教材',
		'本书是马克思主义理论研究和建设工程重点教材。此次修订在2013年版的基础上，重点贯彻习近平总书记系列重要讲话精神和党的十八届三中全会、四中全会精神。本书立足于大学生的思想实际和生活实际，立足于思想政治理论课的教学需要，通过对近现代中国社会发展和革命、建设、改革的历史进程及其内在规律性的梳理与归纳，让广大学生了解国史、国情，深刻领会历史和人民是怎样选择了马克思主义、选择了中国共产党，选择了社会主义道路，选择了改革开放。'
	),
	(
		'小王子',
		'英汉对照注释版',
		'(法) 安东尼·德·圣-埃克苏佩里著 ; 李鹏飞, 耿小辉, 徐长为编译.',
		'2017051506',
		'978-7-5015-9475-7',
		'世界经典文学名著双语系列',
		'知识出版社',
		'北京',
		'2017.3',
		1,
		1,
		29.8,
		'英汉对照',
		'21 × 15',
		'平装',
		'H319.4：I',
		'英语－汉语－对照读物；童话－法国－现代',
		'本书以一位飞行员的口吻讲述了小王子从自己星球出发前往地球的途中在六个星球的各种历险。整个旅途中，小王子结识了国王、爱慕虚荣的人、酒鬼、地理学家和狐狸等，在与他们的交流中领悟了一些人生及宇宙间的哲理。本书用小王子童真的视角，用浅显的语言描述出成人的空虚、盲目、愚妄、死板、教条以及他们的孤独与寂寞。'
	),
	(
		'高等数学',
		'上册',
		'同济大学数学系编.',
		'2014099713',
		'978-7-04-039663-8',
		NULL,
		'高等教育出版社',
		'北京',
		'2014.5',
		7,
		1,
		35.1,
		NULL,
		'23 × 17',
		'平装',
		'O13',
		'高等数学－高等学校－教材',
		'《高等数学》第7版是“十二五”普通高等教育本科国家级规划教材，在第6版的基础上作了进一步的修订。新版教材在保留原教材结构严谨，逻辑清晰、叙述详细、通俗易懂、例题较多、便于自学等优点的基础上，对教材深广度进行了适度的调整，使其更适合当前教学的需要；同时吸收了国外优秀教材的优点，对习题作了较多调整和充实；对全书内容作了进一步的锤炼和适当的调整， 使其能更好满足高等教育进入大众化的新要求。本书上册的主要内容包括函数与极限、导数与微分、微分中值定理与导数的应用、不定积分、定积分及其应用、微分方程等，主要供高等工科院校各专业本科生使用，也可供科技工作者阅读。'
	),
	(
		'高等数学',
		'下册',
		'同济大学数学系编.',
		'2014099714',
		'978-7-04-039662-1',
		NULL,
		'高等教育出版社',
		'北京',
		'2014.5',
		7,
		1,
		27.7,
		NULL,
		'23 × 17',
		'平装',
		'O13',
		'高等数学－高等学校－教材',
		'《高等数学》第7版是“十二五”普通高等教育本科国家级规划教材，在第6版的基础上作了进一步的修订。新版教材在保留原教材结构严谨，逻辑清晰、叙述详细、通俗易懂、例题较多、便于自学等优点的基础上，对教材深广度进行了适度的调整，使其更适合当前教学的需要；同时吸收了国外优秀教材的优点，对习题作了较多调整和充实；对全书内容作了进一步的锤炼和适当的调整， 使其能更好满足高等教育进入大众化的新要求。本书下册的主要内容包括空间解析几何与向量代数、多元函数微分法及其应用、重积分、曲线积分与曲面积分、无穷级数等内容，主要供高等工科院校各专业本科生使用，也可供科技工作者阅读。'
	),
	(
		'爱吃沙拉的狮子',
		'村上Radio',
		'(日) 村上春树著 ; (日) 大桥步图 ; 施小炜译.',
		'2015073267',
		'978-7-5442-7754-9',
		NULL,
		'南海出版公司',
		'海口',
		'2015.6',
		1,
		1,
		39.0,
		NULL,
		'22 × 15',
		'精装',
		'I313.65',
		'随笔－作品集－日本－现代',
		'本作品为日本现代随笔集。本书为村上春树在杂志《an·an》上的连载随笔“村上收音机系列”三部曲中的第三部，收录52篇连载随笔和52幅美丽有趣的插画。男人做西式煎蛋卷时，什么风景最搭？你们家的猫，挑不挑音乐？村上春树算命灵吗？椰子树为什么要长得那么高？饶有趣味的阅读体验，最令人肩膀放松的随笔结集，村上春树抽屉里珍藏的生命珍宝，联袂精彩呈现。'
	),
	(
		'吉安娜·普罗德摩尔',
		'战争之潮',
		'(美) 高登著 ; 江流译.',
		'2013083964',
		'978-7-5133-1206-6',
		NULL,
		'新星出版社',
		'北京',
		'2013.5',
		1,
		1,
		30.0,
		NULL,
		'22 × 14',
		'平装',
		'I712.45',
		'长篇小说－美国－现代',
		'本书为奇幻小说。对于散布在整个艾泽拉斯的各个王国来说，大灾变留下的尘埃终于落定。破碎的世界开始从灾难中恢复，受人敬仰的魔法师吉安娜·普罗德摩尔也一如往常地，修补着联盟与部落之间的关系。然而近来，不断升级的紧张局势似乎正将双方推向战火边缘，仅存的小小安稳恐怕……在吉安娜的钟爱之城塞拉摩，一个可怕的消息悄然抵达。聚焦之虹——蓝龙军团最为强大的神器之一，已被他人盗走。为了寻觅宝物的神秘影踪，吉安娜与曾经的守护巨龙卡雷苟斯携手合作。一路走来，两位辉煌的英雄似乎擦出了不太可能的火花，但此时，另一场灾难性的局势变化出现在眼前……'
	),
	(
		'假如给我三天光明',
		NULL,
		'(美) 凯勒 (Keller,H.) 著 ; 林海岑译.',
		'2016015831',
		'978-7-5447-6181-9',
		'译林名著精选',
		'译林出版社',
		'南京',
		'2017.4',
		1,
		1,
		18.0,
		NULL,
		'22 × 16',
		'精装',
		'K837.127=533',
		'凯勒，H.（1880～1968）－自传',
		'内容简介：《假如给我三天光明》这本书完整收录了《假如给我三天光明》、《我生命的故事》、《三论乐观》、《在芒特艾里的演讲》以及海伦·凯勒书信十封，英汉双语对照，讲述了海伦·凯勒一个没有光明、没有声音的传奇人生。'
	);