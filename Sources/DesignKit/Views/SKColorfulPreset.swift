import ColorfulX
import SwiftUI
import DesignKit

public enum SKColorfulPreset: String, CaseIterable, ColorfulColors {
    case sunrise
    case sunset
    case love
    case ocean
    case barbie
    case starry
    case jelly
    case lavandula
    case watermelon
    case dandelion
    case lemon
    case spring
    case summer
    case autumn
    case winter
    case neon
    case aurora
    
    case appleIntelligence
    
    case colorful
    
    case forest
    case cosmic
    case desert
    case tropical
    case cherry
    case glacier
    case neonNight
    case mint
    case pastel
    case fire
    case cyber
    
    // 新增颜色预设
    case cotton
    case wine
    case matcha
    case galaxy
    case candy
    case mocha
    case emerald
    case misty
    case vintage
    case royalty
    case beachDay
    case midnight
    
    public var localizedName: String {
        switch self {
        case .sunrise: return "日出 / Sunrise"
        case .sunset: return "日落 / Sunset"
        case .love: return "恋爱 / Love"
        case .ocean: return "海洋 / Ocean"
        case .barbie: return "芭比 / Barbie"
        case .starry: return "星空 / Starry"
        case .jelly: return "果冻 / Jelly"
        case .lavandula: return "薰衣草 / Lavandula"
        case .watermelon: return "西瓜 / Watermelon"
        case .dandelion: return "蒲公英 / Dandelion"
        case .lemon: return "柠檬 / Lemon"
        case .spring: return "春天 / Spring"
        case .summer: return "夏天 / Summer"
        case .autumn: return "秋天 / Autumn"
        case .winter: return "冬天 / Winter"
        case .neon: return "霓虹 / Neon"
        case .aurora: return "极光 / Aurora"
        case .appleIntelligence: return "苹果智能 / Apple Intelligence"
        case .colorful: return "多彩 / Colorful"
        case .forest: return "森林 / Forest"
        case .cosmic: return "宇宙 / Cosmic"
        case .desert: return "沙漠 / Desert"
        case .tropical: return "热带 / Tropical"
        case .cherry: return "樱桃 / Cherry"
        case .glacier: return "冰川 / Glacier"
        case .neonNight: return "霓虹之夜 / Neon Night"
        case .mint: return "薄荷 / Mint"
        case .pastel: return "粉彩 / Pastel"
        case .fire: return "火焰 / Fire"
        case .cyber: return "赛博 / Cyber"
        case .cotton: return "棉花 / Cotton"
        case .wine: return "红酒 / Wine"
        case .matcha: return "抹茶 / Matcha"
        case .galaxy: return "银河 / Galaxy"
        case .candy: return "糖果 / Candy"
        case .mocha: return "摩卡 / Mocha"
        case .emerald: return "翡翠 / Emerald"
        case .misty: return "薄雾 / Misty"
        case .vintage: return "复古 / Vintage"
        case .royalty: return "皇室 / Royalty"
        case .beachDay: return "海滩日 / Beach Day"
        case .midnight: return "午夜 / Midnight"
        }
    }
    
    public var colors: [ColorElement] {
        switch self {
        case .sunrise: [
            make(186, 143, 181),
            make(231, 157, 175),
            make(248, 181, 169),
            make(254, 227, 169),
        ]
        case .sunset: [
            make(233, 129, 28),
            make(244, 172, 86),
            make(169, 31, 43),
            make(208, 63, 29),
        ]
        case .love: [
            make(254, 116, 97),
            make(243, 8, 32),
            make(250, 193, 208),
            make(193, 123, 126),
        ]
        case .ocean: [
            make(224, 244, 233),
            make(128, 193, 184),
            make(14, 179, 171),
            make(3, 144, 150),
        ]
        case .barbie: [
            make(254, 143, 229),
            make(255, 126, 179),
            make(254, 144, 195),
            make(230, 96, 160),
        ]
        case .starry: [
            make(244, 245, 168),
            make(108, 137, 198),
            make(44, 59, 108),
            make(22, 30, 45),
        ]
        case .jelly: [
            make(54, 151, 174),
            make(19, 49, 75),
            make(178, 133, 193),
            make(237, 210, 233),
        ]
        case .lavandula: [
            make(164, 149, 211),
            make(190, 138, 198),
            make(67, 15, 129),
            make(168, 144, 181),
        ]
        case .watermelon: [
            make(203, 18, 25),
            make(255, 103, 112),
            make(233, 167, 80),
            make(162, 183, 4),
        ]
        case .dandelion: [
            make(227, 213, 186),
            make(240, 242, 230),
            make(181, 230, 220),
            make(104, 154, 141),
        ]
        case .lemon: [
            make(233, 227, 140),
            make(207, 217, 187),
            make(212, 231, 238),
            make(127, 186, 216),
        ]
        case .spring: [
            make(254, 109, 170),
            make(254, 169, 199),
            make(252, 250, 246),
            make(99, 147, 164),
        ]
        case .summer: [
            make(65, 71, 42),
            make(232, 222, 106),
            make(105, 129, 70),
            make(79, 100, 52),
        ]
        case .autumn: [
            make(251, 176, 57),
            make(239, 122, 51),
            make(231, 82, 44),
            make(189, 60, 43),
        ]
        case .winter: [
            make(190, 212, 240),
            make(129, 152, 205),
            make(196, 181, 215),
            make(243, 243, 243),
        ]
        case .neon: [
            make(22, 4, 74),
            make(240, 54, 248),
            make(79, 216, 248),
            make(74, 0, 217),
        ]
        case .aurora: [
            make(0, 209, 172),
            make(0, 150, 150),
            make(4, 76, 112),
            make(23, 38, 69),
        ]
        case .appleIntelligence: [
            make(239, 176, 76),
            make(233, 128, 86),
            make(234, 75, 107),
            make(230, 97, 165),
            make(223, 138, 233),
            make(192, 160, 245),
            make(100, 181, 245),
            make(126, 201, 238),
        ]
                .map { $0.withAlphaComponent(.random(in: 0.75 ... 1.0)) }
        case .colorful: [
            #colorLiteral(red: 0.9586862922, green: 0.660125792, blue: 0.8447988033, alpha: 1),
            #colorLiteral(red: 0.8714533448, green: 0.723166883, blue: 0.9342088699, alpha: 1),
            #colorLiteral(red: 0.7458761334, green: 0.7851135731, blue: 0.9899476171, alpha: 1),
            #colorLiteral(red: 0.4398113191, green: 0.8953480721, blue: 0.9796616435, alpha: 1),
            #colorLiteral(red: 0.3484552801, green: 0.933657825, blue: 0.9058339596, alpha: 1),
            #colorLiteral(red: 0.5567936897, green: 0.9780793786, blue: 0.6893508434, alpha: 1),
        ]
                .map { $0.withAlphaComponent(0.5) }
        case .forest: [
            make(34, 139, 34),   // 森林绿
            make(85, 107, 47),   // 暗橄榄绿
            make(107, 142, 35),  // 橄榄土褐色
            make(76, 187, 23),   // 明亮绿
        ]
        case .cosmic: [
            make(16, 6, 41),     // 深空蓝
            make(61, 21, 95),    // 深紫色
            make(144, 96, 183),  // 紫色
            make(187, 196, 243), // 淡蓝色
        ]
        case .desert: [
            make(193, 154, 107), // 沙色
            make(213, 176, 136), // 浅沙色
            make(153, 101, 21),  // 棕色
            make(233, 221, 175), // 米色
        ]
        case .tropical: [
            make(255, 87, 51),   // 热带橙
            make(255, 189, 51),  // 芒果黄
            make(24, 196, 145),  // 翠绿
            make(255, 34, 102),  // 热带粉
        ]
        case .cherry: [
            make(255, 183, 197), // 浅粉
            make(254, 127, 156), // 樱花粉
            make(247, 231, 231), // 近白色
            make(216, 87, 108),  // 深粉
        ]
        case .glacier: [
            make(225, 242, 254), // 冰白
            make(176, 222, 245), // 浅冰蓝
            make(115, 188, 224), // 冰湖蓝
            make(45, 137, 180),  // 深冰蓝
        ]
        case .neonNight: [
            make(13, 2, 33),     // 暗夜
            make(255, 16, 240),  // 霓虹粉
            make(0, 255, 200),   // 霓虹绿
            make(101, 26, 204),  // 霓虹紫
        ]
        case .mint: [
            make(245, 255, 250), // 薄荷白
            make(152, 255, 213), // 浅薄荷
            make(88, 232, 188),  // 薄荷绿
            make(48, 191, 151),  // 深薄荷
        ]
        case .pastel: [
            make(255, 209, 220), // 粉彩粉
            make(189, 224, 254), // 粉彩蓝
            make(174, 255, 231), // 粉彩绿
            make(255, 255, 210), // 粉彩黄
        ]
        case .fire: [
            make(254, 67, 0),    // 火红
            make(252, 157, 3),   // 火橙
            make(249, 214, 22),  // 火黄
            make(128, 9, 9),     // 暗红
        ]
        case .cyber: [
            make(47, 7, 67),     // 赛博暗紫
            make(8, 212, 196),   // 赛博蓝绿
            make(255, 52, 165),  // 赛博粉
            make(14, 48, 117),   // 赛博蓝
        ]
        case .cotton: [
            make(252, 246, 245), // 棉白
            make(242, 233, 228), // 米白
            make(235, 227, 223), // 象牙白
            make(226, 220, 214), // 浅灰棕
        ]
        case .wine: [
            make(88, 7, 37),     // 深酒红
            make(128, 24, 56),   // 波尔多红
            make(183, 49, 91),   // 中红
            make(226, 88, 119),  // 浅红
        ]
        case .matcha: [
            make(208, 222, 179), // 浅抹茶
            make(149, 171, 99),  // 抹茶绿
            make(104, 130, 61),  // 深抹茶
            make(236, 240, 214), // 抹茶奶泡
        ]
        case .galaxy: [
            make(7, 11, 30),     // 深空黑
            make(33, 37, 80),    // 深蓝紫
            make(105, 96, 175),  // 星云紫
            make(221, 193, 248), // 星尘粉
        ]
        case .candy: [
            make(255, 186, 206), // 粉红糖
            make(102, 245, 240), // 薄荷糖
            make(255, 225, 148), // 柠檬糖
            make(190, 129, 255), // 葡萄糖
        ]
        case .mocha: [
            make(89, 47, 33),    // 深咖啡
            make(133, 90, 69),   // 中咖啡
            make(205, 179, 159), // 奶泡色
            make(225, 208, 191), // 浅奶泡
        ]
        case .emerald: [
            make(0, 105, 65),    // 深祖母绿
            make(47, 158, 116),  // 祖母绿
            make(85, 217, 171),  // 浅祖母绿
            make(201, 244, 227), // 祖母绿珠光
        ]
        case .misty: [
            make(233, 241, 244), // 雾白
            make(211, 226, 229), // 浅灰蓝
            make(183, 205, 213), // 雾蓝
            make(152, 175, 188), // 深雾蓝
        ]
        case .vintage: [
            make(211, 196, 175), // 老纸色
            make(177, 156, 129), // 牛皮纸
            make(142, 122, 98),  // 棕褐色
            make(107, 87, 67),   // 深棕
        ]
        case .royalty: [
            make(77, 29, 110),   // 深紫
            make(144, 55, 181),  // 紫色
            make(226, 201, 52),  // 金色
            make(245, 233, 154), // 浅金
        ]
        case .beachDay: [
            make(77, 197, 233),  // 海水蓝
            make(248, 211, 160), // 沙滩
            make(244, 241, 227), // 贝壳白
            make(255, 170, 95),  // 日落橙
        ]
        case .midnight: [
            make(6, 15, 42),     // 午夜蓝
            make(20, 41, 82),    // 深蓝
            make(42, 75, 124),   // 蓝色
            make(117, 157, 203), // 浅蓝
        ]
        }
    }
}

#Preview {
    
    let columns = Array(repeating: GridItem(.flexible(), spacing: 12), count: 2)
    let items = SKColorfulPreset.allCases
    
    ScrollView {
        LazyVGrid(columns: columns, spacing: 12) {
            ForEach(items, id: \.rawValue) { item in
                ZStack(alignment: .bottom) {
                    ColorfulView(color: item)
                        .aspectRatio(1, contentMode: .fit)
                        .clipShape(RoundedRectangle(cornerRadius: 16))
                    Text(item.localizedName)
                        .font(.system(size: 14, weight: .bold))
                        .frame(height: 44)
                }
                    
            }
        }
        .padding(8)
    }
}
