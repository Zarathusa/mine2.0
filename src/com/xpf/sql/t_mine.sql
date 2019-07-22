/*
Navicat MySQL Data Transfer

Source Server         : MineMysql
Source Server Version : 50644
Source Host           : localhost:3306
Source Database       : mine

Target Server Type    : MYSQL
Target Server Version : 50644
File Encoding         : 65001

Date: 2019-05-28 19:46:18
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for t_mine
-- ----------------------------
DROP TABLE IF EXISTS `t_mine`;
CREATE TABLE `t_mine` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_name` varchar(255) DEFAULT NULL,
  `mine_name` varchar(255) DEFAULT NULL,
  `project_effect` text,
  `mine_status` text,
  `gas_grade` text,
  `geo_cond` text,
  `coal_seam_give` text,
  `exploit` text,
  `gas_give` text,
  `staff_comp` text,
  `staff_tech` text,
  `tech_cond` text,
  `impl_period` text,
  `impl_area` text,
  `tech_grade` text,
  `mine_impact` text,
  `tech_desc` text,
  `tech_feature` text,
  `quan_effect` text,
  `organ` varchar(255) DEFAULT NULL,
  `manage_resp` text,
  `manage_resp_file` varchar(255) DEFAULT NULL,
  `resource_support` text,
  `work_link` text,
  `tech_file` text,
  `work_proce` varchar(255) DEFAULT NULL,
  `work_file` varchar(255) DEFAULT NULL,
  `oper_proce` varchar(255) DEFAULT NULL,
  `tech_standard` text,
  `time_standard` text,
  `work_amount` text,
  `project_report` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_mine
-- ----------------------------
INSERT INTO `t_mine` VALUES ('2', '大采长、双尾巷综放面瓦斯治理和自燃防治', '阳煤集团三矿', '高瓦斯易自燃煤层瓦斯和自然发火防治。', '生产矿井', '高瓦斯、煤易自燃，自然发火期16天。', 'K8202工作面地质结构复杂，煤层产状变化大，波状起伏明显，整体为向背斜组成的复杂褶皱构造形态。预计还存在几条小型断裂构造和挠曲，并位于陷落柱密集区域，特别是工作面中部陷落柱异常发育。水文地质条件简单，上部各煤层均未开采，不受采空积水威胁。\r\nK8205工作面地质结构复杂，工作面东部断裂构造异常发育。揭露8条断层（2条正断层、6条逆断层），落差0.8～2.4m；进风巷2条挠曲，煤层倾角分别为22°和23°。还存在几条小型断裂构造和挠曲，对回采有一定影响。水文地质条件简单。', 'K8202工作面位于三矿15#煤层，平均煤厚6.39m，煤层总厚6.60m，净煤厚6.39m，属于稳定的厚煤层。煤样自燃倾向性等级属Ⅰ类，容易自燃，吸氧量为1.13cm3/g干煤。K8205工作面位于三矿15#煤层，煤层总厚6.52m，净煤厚6.27m，属于稳定的厚煤层。', '15#煤层采用下行开采顺序，回采工作面采用后退式开采，回采巷道采用“U+II”形式布置，一进一回加两条内错尾巷，工作面布置顶板岩石走向高抽巷对邻近层瓦斯进行卸压抽放，工作面采用放顶煤综采工艺，低位放顶煤支架和“两采一放”工序，K8202走向长1334m，倾斜长260.4m，分别布置进风顺槽、回风顺槽、内错尾巷、高抽巷以及切巷。进、回风顺槽沿15#煤层底板布置，一尾巷沿15#煤层顶板平行于回风顺槽28m布置，二尾巷沿15#煤层顶板平行于回风顺槽90m布置。高抽巷沿11#煤层底板平行于回风顺槽45m布置，距15#煤层间距约48m。\r\nK8205工作面走向长1579m，倾斜长260.8m。分别布置进风顺槽、回风顺槽、内错尾巷、高抽巷以及切巷，进、回风顺槽沿15#煤层底板布置，一尾巷沿15#煤层顶板平行于回风顺槽28m布置，二尾巷沿15#煤层顶板平行于回风顺槽90m布置。高抽巷沿11#煤层底板平行于回风顺槽45m布置，距15#煤层间距约48m。', '15#煤层的瓦斯含量为7.13 m3/t，瓦斯压力为0.2～0.3 MPa。\r\n三矿瓦斯绝对涌出量为97.61m3/min、相对涌出量为17.32m3/t；二氧化碳绝对涌出量为1.02m3/min、相对涌出量为0.18m3/t，属高瓦斯矿井。\r\n15#煤层回风巷有0.4%的瓦斯来源于上邻近层，内错尾巷有2.75%的瓦斯来源于上邻近层。工作面风排上邻近层的瓦斯量为22.17m3/min，工作面风排瓦斯量为29.68 m3/min。\r\n15#煤层经鉴定自燃等级Ⅰ类（容易自燃）。自然发火期16天。', '1、矿长具有5年以上高瓦斯、易自燃发火矿井的管理工作经历，或具有5年以上高瓦斯易自燃发火矿井的煤矿管理工作经历；\r\n2、总工程师具有5年以上高瓦斯易自燃发火矿井安全生产管理经历，或有高瓦斯、易自燃发火矿井的煤矿安全生产管理经历；\r\n3、通风副总工程师具有5年以上高瓦斯易自燃发火矿井相关业务工作经历，或有高瓦斯、易自燃发火矿井的煤矿相关业务工作经历；\r\n4、从事防治瓦斯、自然发火等业务的技术人员具有煤矿主体专业技术职称；\r\n5、专业队伍人员上岗前通过业务培训，在岗期间按有关规定定期复训，特种作业人员持证上岗。', '1、矿长、总工程师应具有煤矿大学以上学历，掌握煤矿采掘、通风防火、瓦斯等专业技术，熟悉煤矿相关专业的技术知识；\r\n2、通风副总工程师应具有煤矿大专以上学历，掌握煤矿通风防火、瓦斯等专业技术，熟悉煤矿相关专业的技术知识；\r\n3、采掘等副矿长应具有煤矿大专以上学历，掌握采掘等专业技术，熟悉煤矿相关专业的技术知识；\r\n4、通防科、通防（队）负责人及技术人员应具有煤矿中专以上学历，熟练掌握本专业技术知识，了解相关专业知识；\r\n5、“一通三防”等施工作业人员应具有初中以上学历，上岗前通过业务培训，熟悉通风防火、瓦斯防治的的基本知识，掌握防治技能。', '煤厚6.39m，煤层总厚6.60m，净煤厚6.39m稳定的厚煤层。采用综放开采方式，支撑掩护式低位放顶煤支架管理顶板。工作面走向长1334~1579m，倾斜长260.4~260.8m。\r\n瓦斯含量7.13 m3/t，瓦斯压力为0.2～0.3 MPa。\r\n自燃等级Ⅰ类（容易自燃）。自然发火期16天。', '顶板高位巷及尾巷在生产准备时即施工，在采面投产时完成。', '需在煤、岩层中分别掘进施工巷道，以及施工钻孔。', '技术复杂程度为煤矿开采的综合技术。工程技术人员需掌握煤矿地质及煤层、瓦斯赋存条件等；具备矿井、采区、工作面瓦斯抽采设计、瓦斯抽采管理和矿井自然发火治理能力；熟练掌握自然发火规律和防治手段。\r\n施工作业人员具有防治瓦斯、自然发火知识，并熟练相关操作技能。', '治理瓦斯和自然发火相关巷道在矿井和采区设计中与生产系统一并考虑，同时施工、同时投入生产，对采掘施工的无影响，但由于采掘巷道增加，采区和工作面投产周期延长。在实施过程中与生产并行对采掘施工无大的影响和干扰。', '综放工作面的瓦斯和自燃的综合防治，实行“预防为主、预测预报、防治结合”的自燃防治原则，从工作面设计和通风系统设计开始考虑瓦斯和自燃防治因素，通过煤样实验考察煤层自燃特性，指导自燃防治技术方案制定。布置走向高抽巷和双内错尾巷有效解决长大综放工作面采空区瓦斯和上隅角瓦斯超限问题，在综放面回采过程中，进行科学、有效的自燃预测预报，采用注氮为主的综合防火措施，根据实际条件使用注浆、凝胶、阻化剂和泡沫等灭火措施和均压通风等技术，为综放面安全生产提供了必要的安全技术保证。', '解决大采长、布置双尾巷后的高瓦斯综放面瓦斯治理和自燃防治的关键技术问题，有效保证了K8202、K8205综放工作面的安全顺利回采，形成瓦斯治理和自燃防治综合技术体系。布置走向高抽巷和双内错尾巷有效解决长大综放工作面采空区瓦斯和上隅角瓦斯超限问题，采用以注氮为主的自燃综合防治技术，可以有效预防综放面采空区和尾巷口发生自燃。双内错尾巷技术在类似条件的矿井的广泛推广和应用，将有效提高工作面产量，降低准备巷道掘进工作量，必将带来良好的经济效益和广泛的社会效益。', '工作面采用U+II型通风方式回风巷风流中的瓦斯浓度为0.61%，较U+I型通风方式瓦斯浓度降低了45%；\r\n采用U+II通风方式时，尾巷1与尾巷2风排瓦斯量之和为25.28 m3/min，较U+I型通风方式增加2.66 m3/min；\r\n采用U+II通风方式时高抽巷瓦斯抽采量为152.28 m3/min；较U+I型增加15.08 m3/min。\r\nU+II型通风方式可从根本上解决了回风巷瓦斯浓度超限的问题。\r\n经约30天在瓦斯抽采与注氮的影响下，及顶板垮落等原因，上回风隅角CO浓度在正常的范围值（0～20 PPm）之内。', '/organUpload/1558973083314-organUpload', '矿长岗位责任制\r\n总工程师（技术负责人）岗位责任制\r\n通风副总工程师岗位责任制\r\n通防科长岗位责任制\r\n通防区（队）长岗位责任制\r\n区（队）技术主管岗位责任制\r\n抽采队长岗位责任制', null, '1、应设置防灭火、防治瓦斯专门机构（通风副总工程师、通防科、区（队）等），配备专业人员（抽采、通风、防灭火、地质、采掘等技术员），专业施工队伍（采掘队、通防队等），作业人员（防灭火工、瓦检工、瓦斯泵司机、监测工等）；\r\n2、建立地面瓦斯式抽采泵站（必要时还应设置井下移动式抽采泵）及相应的配套设施（“三防”装置、瓦斯抽采监控系统、抽采管路等）；\r\n3、矿井通风系统稳定，需要局部通风机供风的地点供风可靠。\r\n4、建立防灭火灌注浆系统（包括：注浆泵、管路、泥浆池、灌注材料等）；\r\n5、束管监测系统（包括防火化验室等）；\r\n6、建立注氮系统（包括注氮机、氮气源、管路等）\r\n10、矿井应有可靠的资金支持，保证抽采设备、设施、仪器仪表等的采购配置，提取的煤炭生产安全费用用于瓦斯、自然发火防治的比例不低于30%。', '1、采区设计\r\n2、抽采设计；\r\n3、设计审核；\r\n4、工程施工： \r\n5、施工质量验收\r\n6、抽采瓦斯\r\n7、采空区灌注浆、注氮\r\n8、效果检验', '采区及抽采设计（生产技术科、通防科或区）：包括巷道布置、施工设备与进度计划、有效抽采瓦斯时间、注氮量、灌注浆量、预期效果以及组织管理、安全技术措施等）→→设计审核（技术负责人批准）；→→工程施工（采掘队、通防队）：掘进施工巷道、接设抽采瓦斯、注氮、灌注浆管路、风（水）管路、接设电缆（电源）等设备设施）；→→抽采瓦斯（监测队、通防队：配备瓦斯抽采监控系统，实时监控管网瓦斯浓度、压力或压差、流量、温度参数及设备的开停状态，在泵站、主管、干管、支管、钻场等布置测点。）→→瓦斯抽采效果检验（通防科（区）、安检科、调度室） 。→→灌注浆、注氮→→效果检验（通防科（区）、安检科、调度室）。', '/workProceUpload/1558973083807-workProceUpload', null, '/operProceUpload/1559005051572-operProceUpload', 'K8202工作面风量：进风巷960m3/min、瓦斯浓度0%，回风巷558m3/min、瓦斯浓度0.7%，尾巷1 风量1601m3/min、瓦斯浓度2%，尾巷2风量160m3/min、瓦斯2%，高抽巷185m3/min、瓦斯50%；\r\nK8205工作面风量:进风巷1759m3/min、瓦斯浓度0%，回风巷1038m3/min、瓦斯浓度0.7%，尾巷1风量293m3/min、瓦斯浓度2%，尾巷2风量293m3/min、瓦斯浓度2%，高抽巷307m3/min、瓦斯50%；\r\n根据注浆灭火效果检验。上隅角CO浓度恢复到100PPm以下，或回风CO浓度恢复到20PPm以下。', '完成效果的最佳时间段标准为6个月。', '每个采面掘岩巷1224~1489m（高抽巷），掘煤巷1334~1579m（尾巷1、尾巷2）。', null);
