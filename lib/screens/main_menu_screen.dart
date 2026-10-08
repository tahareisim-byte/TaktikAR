import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'ar_screen.dart';

class MainMenuScreen extends StatefulWidget {
  const MainMenuScreen({super.key});

  @override
  State<MainMenuScreen> createState() => _MainMenuScreenState();
}

class _MainMenuScreenState extends State<MainMenuScreen> {
  final PageController _pageController = PageController(viewportFraction: 0.75);
  int _currentPage = 0;

  String _selectedCategory = 'TÜMÜ';

  final List<Map<String, dynamic>> _categories = [
    {'name': 'TÜMÜ', 'isLocked': false},
    {'name': 'HAVA ARAÇLARI', 'isLocked': false},
    {'name': 'KARA ARAÇLARI', 'isLocked': false},
    {'name': 'DENİZ ARAÇLARI', 'isLocked': true},
    {'name': 'SİLAHLAR', 'isLocked': false}, // Mızrak-U eklendiği için kilit açıldı
    {'name': 'DONANIMLAR', 'isLocked': true},
  ];

  final List<Map<String, dynamic>> _allModels = [
    {
      'category': 'HAVA ARAÇLARI',
      'prefix': 'BAYKAR',
      'title': ' AKINCI (TİHA)',
      'stats': 'Yüksek faydalı yük kapasitesi, gelişmiş yapay zeka aviyonikleri ve ağır mühimmat taşıma kabiliyetiyle sınıfında lider Taarruzi İnsansız Hava Aracı.',
      'details': 'Bayraktar AKINCI Taarruzi İnsansız Hava Aracı (TİHA, yüksek görev saati, faydalı yük kapasitesi ve havadan havaya, havadan karaya taarruz kabiliyeti ile gökyüzündeki stratejik caydırıcı gücümüzdür.\n\nTEKNİK ÖZELLİKLER:\n• Sınıf: Yüksek İrtifa Uzun Havada Kalış (HALE)\n• Uzunluk: 12.2 m | Kanat Açıklığı: 20.0 m | Yükseklik: 4.1 m\n• Maksimum Kalkış Ağırlığı: 6.000 kg\n• Faydalı Yük Kapasitesi: 1.500 kg (Dahili: 400 kg, Harici: 1.100 kg)\n• Maksimum İrtifa: 40.000 ft\n• Havada Kalış Süresi: 24+ Saat\n• Seyir Hızı: 150 - 195 Knot\n• Motor: Çift Turboprop (2x450 HP veya 2x750 HP)\n• Sistemler: AESA Radar, Aselsan CATS, Çarpışma Önleyici Radar\n• Mühimmat Entegrasyonu: MAM-L, MAM-C, MAM-T, Cirit, L-UMTAS, Bozok, MK-81/82/83, SOM Füzesi, Gökdoğan, Bozdoğan.',
      'icon': Icons.flight_takeoff,
      'image': 'assets/images/akinci.png',
      'modelPath': 'assets/models/akinci.glb',
      'cardScale': 1.7, // Kanatları geniş olduğu için ideal taşıma oranı
      'isLocked': false,
    },
    {
      'category': 'HAVA ARAÇLARI',
      'prefix': 'TUSAŞ ANKA-S',
      'title': ': UYDU KONTROLLÜ SİHA',
      'stats': 'Uydu haberleşme (SATCOM) yeteneği sayesinde görüş hattı ötesi (BLOS) operasyon kabiliyetine sahip, stratejik sınıf Silahlı İnsansız Hava Aracı.',
      'details': 'TUSAŞ tarafından milli imkanlarla geliştirilen Anka-S, barındırdığı uydu haberleşme (SATCOM) yeteneği sayesinde hiçbir menzil veya coğrafi engele takılmadan dünyanın herhangi bir noktasından güvenle yönetilebilir.\n\nTEKNİK ÖZELLİKLER:\n• Sınıf: Orta İrtifa Uzun Havada Kalış (MALE)\n• Uzunluk: 8.6 m | Kanat Açıklığı: 17.5 m | Yükseklik: 3.25 m\n• Maksimum Kalkış Ağırlığı: 1.700 kg\n• Faydalı Yük Kapasitesi: 350+ kg\n• Havada Kalış Süresi: 30+ Saat\n• Servis Tavanı: 30.000 ft (9.144 m)\n• İletişim: SATCOM (Görüş Hattı Ötesi - BLOS) ve C-Bant Veri Bağı\n• Motor: TEI-PD170 Turbo Dizel (170 bg)\n• Seyir Hızı: 204 km/s (110 knot)\n• Görev Tipi: İstihbarat, Keşif, Gözetleme, Hedef İşaretleme ve Hassas Taarruz\n• Mühimmat: MAM-L, MAM-C, Cirit, L-UMTAS.',
      'icon': Icons.flight,
      'image': 'assets/images/anka-s.png',
      'modelPath': 'assets/models/anka.glb',
      'cardScale': 2.7,
      'isLocked': false,
    },
    {
      'category': 'HAVA ARAÇLARI',
      'prefix': 'BAYKAR',
      'title': ' K2 (Kamikaze İHA)',
      'stats': 'Yapay zeka destekli optik güdüm sistemine sahip, yüksek hassasiyetli yeni nesil otonom hava aracı ve akıllı mühimmat platformu.',
      'details': 'Baykar K2 (Kemankeş 2), yüksek hızda hedefe dalış yaparak imha görevini icra eden, yapay zeka destekli optik güdüm sistemine sahip yeni nesil dolanan mühimmattır (loitering munition).\n\nTEKNİK ÖZELLİKLER:\n• Sınıf: Otonom Taktik Kamikaze Sistem\n• Görev Tipi: Nokta Atışı Hassas Taarruz / Dolanan Mühimmat\n• Güdüm: Yapay Zeka (AI) Destekli Optik Kamera ve Otonom Hedef Tanıma\n• Motor: Jet Motoru\n• Operasyonel Menzil: 200+ km\n• Havada Kalış Süresi: 1+ Saat\n• Seyir Hızı: Yüksek Ses Altı (Subsonic)\n• İrtifa: Düşük irtifa gizli sızma ve yüksek irtifadan ani dalış kabiliyeti\n• Platform Entegrasyonu: Akıncı, Bayraktar TB2 ve TB3 gibi insansız platformlardan havadayken ateşlenebilir.',
      'icon': Icons.airplanemode_active,
      'image': 'assets/images/k2.png',
      'modelPath': 'assets/models/k2.glb',
      'cardScale': 3.7,
      'isLocked': false,
    },
    {
      'category': 'HAVA ARAÇLARI',
      'prefix': 'BAYKAR',
      'title': ' KALKAN (DİHA)',
      'stats': 'Dikey iniş-kalkış yapabilen, zorlu arazi ve deniz şartlarında pist ihtiyacı duymadan görev yapabilen taktik sınıf İHA.',
      'details': 'Bayraktar Kalkan DİHA (Dikey İniş Kalkışlı İnsansız Hava Aracı), askeri birliklerin ve donanma gemilerinin piste ihtiyaç duymadan bulundukları noktadan uçurabileceği, uzun menzilli uçuş ve dikey manevra kabiliyetlerini tek gövdede birleştiren bir keşif-gözetleme sistemidir.\n\nTEKNİK ÖZELLİKLER:\n• Sınıf: Dikey İniş Kalkışlı Taktik İHA (VTOL)\n• Kalkış/İniş Tipi: Tam Otonom Dikey (Pist gerektirmez)\n• İletişim Menzili: 150 km\n• Maksimum Kalkış Ağırlığı: 50 kg\n• Faydalı Yük Kapasitesi: 5 kg (Elektro Optik / Kızılötesi Kamera ve Lazer İşaretleyici)\n• Havada Kalış Süresi: 12+ Saat\n• Operasyonel İrtifa: 9.000 ft (Maksimum: 15.000 ft)\n• Seyir Hızı: 45 - 50 Knot\n• Motor Tipi: Elektrik motorları (Kalkış için) ve İçten Yanmalı İtici Motor (Seyir için)\n• Kullanım Alanları: Sınır güvenliği, donanma karakol görevleri, topçu atış tanzimi ve hedef tespiti.',
      'icon': Icons.publish,
      'image': 'assets/images/kalkan_diha.png',
      'modelPath': 'assets/models/kalkan_diha.glb',
      'cardScale': 1.6,
      'isLocked': false,
    },
    {
      'category': 'HAVA ARAÇLARI',
      'prefix': 'STM',
      'title': ' SİVRİSİNEK',
      'stats': 'Meskun mahal ve dar alan operasyonları için tasarlanmış, düşük görünürlüğe sahip döner kanatlı taktik vurucu İHA.',
      'details': 'Sivrisinek Vurucu İnsansız Hava Aracı, piyade birliklerinin çantasında taşıyabileceği, hedefe sessizce sızıp anlık istihbarat aktarabilen veya barındırdığı harp başlığıyla düşman sığınaklarına dalarak imha görevi gerçekleştiren taktik kamikaze platformudur.\n\nTEKNİK ÖZELLİKLER:\n• Sınıf: Döner Kanatlı Vurucu/Kamikaze İHA\n• Görev Tipi: Keşif, Gözetleme, Bina İçi İstihbarat ve Hedef İmhası\n• İletişim Menzili: ~15 km (Görüş Hattı - LOS)\n• Havada Kalış Süresi: 30 - 45 Dakika\n• Güdüm Sistemi: Yapay Zeka destekli otonom uçuş, engel aşma ve hedef tanıma algoritmaları\n• Kontrol: Gündüz ve Termal gece görüş sistemleri ile anlık şifreli video aktarımı\n• Harp Başlığı: Anti-personel, hafif zırh delici veya termobarik mikro mühimmat\n• Avantajlar: Sessiz elektrik motoru, çok düşük radar/termal iz, meskun mahalde pencereden veya sığınaktan içeri girerek patlama yeteneği.',
      'icon': Icons.gps_fixed,
      'image': 'assets/images/sivrisinek.png',
      'modelPath': 'assets/models/sivrisinek_iha.glb',
      'cardScale': 2.0,
      'isLocked': false,
    },
    {
      'category': 'KARA ARAÇLARI',
      'prefix': 'BMC',
      'title': ' KİRPİ',
      'stats': 'Mayına ve pusulara karşı üstün koruma sağlayan, zorlu arazi şartlarında güvenli personel taşıma amaçlı taktik tekerlekli zırhlı araç.',
      'details': 'BMC tarafından üretilen ve Mayına Karşı Korumalı Araç (MRAP) sınıfında yer alan zırhlı personel taşıyıcıdır. Üstün balistik zırhı ve V şeklindeki alt gövde yapısı sayesinde el yapımı patlayıcılara (EYP) ve mayınlara karşı personeli maksimum seviyede korur. Taktik sahada güvenli asker sevkiyatının bel kemiğidir.\n\nTEKNİK ÖZELLİKLER:\n• Sınıf: Mayına Karşı Korumalı Zırhlı Personel Taşıyıcı (MRAP)\n• Ağırlık: 19.050 kg (Boş) / 20.830 kg (Yüklü)\n• Boyutlar: Uzunluk: 7.35 m | Genişlik: 2.64 m | Yükseklik: 3.20 m\n• Personel Kapasitesi: 13 Personel (3 Mürettebat + 10 Tam Teçhizatlı Asker)\n• Zırh Koruması: STANAG 4569 Seviye 3 (Balistik ve Mayın)\n• Motor: Cummins ISL9E3 375 PS Turbo Dizel (275 kW)\n• Maksimum Hız: 100 km/s\n• Operasyonel Menzil: 800 km\n• Savunma ve Karşı Tedbirler: Otomatik yangın söndürme, KBRN koruma filtreleri, içten kumandalı sis havanları\n• Silah Sistemleri: Manuel kule veya Aselsan SARP Uzaktan Komutalı Silah Sistemi (UKSS) entegrasyonu (7.62 mm veya 12.7 mm makinalı tüfek).',
      'icon': Icons.shield,
      'image': 'assets/images/kirpi.png',
      'modelPath': 'assets/models/kirpi.glb',
      'cardScale': 1.7,
      'isLocked': false,
    },
    {
      'category': 'SİLAHLAR',
      'prefix': 'ROKETSAN',
      'title': ' MIZRAK-U (UMTAS)',
      'stats': 'Ağır zırhlı kara hedeflerine karşı etkili, taarruz helikopterleri ve SİHA\'lar için tasarlanmış uzun menzilli tanksavar füze sistemi.',
      'details': 'Roketsan tarafından T129 ATAK helikopterinin ana tanksavar gücü olarak geliştirilen UMTAS (Uzun Menzilli Tanksavar Sistemi / Mızrak-U), tepki zırhlarıyla (ERA) donatılmış en modern ana muharebe tanklarını bile yok edebilecek kapasitede, hassas güdümlü bir taarruz sistemidir.\n\nTEKNİK ÖZELLİKLER:\n• Sınıf: Havadan Karaya / Karadan Karaya Uzun Menzilli Tanksavar Füzesi (ATGM)\n• Çap: 160 mm\n• Uzunluk: 1.75 m\n• Ağırlık: 37.5 kg\n• Operasyonel Menzil: 500 m - 8.000 m (8 km)\n• Güdüm Seçenekleri: Görüntüleyici Kızılötesi (IIR) veya Yarı Aktif Lazer Güdüm (L-UMTAS varyantı)\n• Harp Başlığı: Reaktif zırhlara karşı yüksek tahrip güçlü Tandem (çift aşamalı) Zırh Delici Başlık\n• Operasyon Tipi: At-Unut ve At-Güncelle (Uçuş sırasında hedef değiştirme veya iptal imkanı sağlayan çift yönlü RF veri bağı)\n• Vuruş Modu: Doğrudan vuruş veya tankların en zayıf noktası olan tepe zırhından dalış (Top-Attack) kabiliyeti\n• Entegre Platformlar: T129 ATAK Helikopteri, Akıncı TİHA, Anka SİHA, Bayraktar TB2, Hürkuş-C ve taktik kara araçları kuleleri.',
      'icon': Icons.rocket_launch,
      'image': 'assets/images/mizrak_u.png',
      'modelPath': 'assets/models/mizrak_u.glb',
      'cardScale': 3.7,
      'isLocked': false,
    },
    {
      'category': 'DENİZ ARAÇLARI',
      'prefix': '',
      'title': '',
      'stats': '',
      'details': '',
      'icon': Icons.lock_outline,
      'isLocked': true,
    },
    {
      'category': 'DONANIMLAR',
      'prefix': '',
      'title': '',
      'stats': '',
      'details': '',
      'icon': Icons.lock_outline,
      'isLocked': true,
    },
  ];

  List<Map<String, dynamic>> get _filteredModels {
    if (_selectedCategory == 'TÜMÜ') {
      return _allModels;
    }
    return _allModels.where((model) => model['category'] == _selectedCategory).toList();
  }

  void _onCategoryTapped(String categoryName, bool isLocked) {
    if (isLocked) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Text(
            'ERİŞİM REDDEDİLDİ: Bu kategori Demo sürümünde kilitlidir.',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, letterSpacing: 1.0),
          ),
          backgroundColor: Colors.redAccent.shade700,
          duration: const Duration(seconds: 2),
          behavior: SnackBarBehavior.floating,
        ),
      );
      return;
    }

    setState(() {
      _selectedCategory = categoryName;
      _currentPage = 0;
    });

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_pageController.hasClients) {
        _pageController.jumpToPage(0);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final currentModels = _filteredModels;

    bool isCurrentLocked = false;
    if (currentModels.isNotEmpty && _currentPage < currentModels.length) {
      isCurrentLocked = currentModels[_currentPage]['isLocked'];
    }

    return Scaffold(
      backgroundColor: const Color(0xFF111111),
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 430),
          child: Stack(
            alignment: Alignment.center,
            children: [
              Positioned(
                top: size.height * 0.25,
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  width: 300,
                  height: 300,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: RadialGradient(
                      colors: [
                        isCurrentLocked
                            ? Colors.redAccent.withValues(alpha: 0.15)
                            : const Color(0xFF00E5FF).withValues(alpha: 0.15),
                        Colors.transparent,
                      ],
                      stops: const [0.1, 1.0],
                    ),
                  ),
                ),
              ),

              SafeArea(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 20),

                    const Center(
                      child: Text(
                        'TaktikAR',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF00E5FF),
                          letterSpacing: 1.5,
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),

                    ScrollConfiguration(
                      behavior: ScrollConfiguration.of(context).copyWith(
                        dragDevices: {PointerDeviceKind.touch, PointerDeviceKind.mouse},
                      ),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: Row(
                          children: _categories.map((cat) {
                            return Padding(
                              padding: const EdgeInsets.only(right: 10.0),
                              child: _buildCategoryChip(
                                cat['name'],
                                isActive: _selectedCategory == cat['name'],
                                isLocked: cat['isLocked'],
                                onTap: () => _onCategoryTapped(cat['name'], cat['isLocked']),
                              ),
                            );
                          }).toList(),
                        ),
                      ),
                    ),
                    const Spacer(),

                    SizedBox(
                      height: 460,
                      child: ScrollConfiguration(
                        behavior: ScrollConfiguration.of(context).copyWith(
                          dragDevices: {PointerDeviceKind.touch, PointerDeviceKind.mouse},
                        ),
                        child: AnimatedBuilder(
                          animation: _pageController,
                          builder: (context, child) {
                            return PageView.builder(
                              clipBehavior: Clip.none,
                              controller: _pageController,
                              onPageChanged: (index) {
                                setState(() {
                                  _currentPage = index;
                                });
                              },
                              itemCount: currentModels.length,
                              itemBuilder: (context, index) {
                                double pageOffset = 0;
                                if (_pageController.position.haveDimensions) {
                                  pageOffset = _pageController.page! - index;
                                } else {
                                  pageOffset = (0.0 - index);
                                }

                                double scale = 1 - (pageOffset.abs() * 0.15);
                                scale = scale.clamp(0.85, 1.0);

                                double opacity = 1 - (pageOffset.abs() * 0.6);
                                opacity = opacity.clamp(0.4, 1.0);

                                bool isActive = (pageOffset.abs() < 0.1);
                                bool isCardLocked = currentModels[index]['isLocked'];

                                Color cardNeon = isCardLocked ? Colors.redAccent : const Color(0xFF00E5FF);

                                return Transform.scale(
                                  scale: scale,
                                  child: Opacity(
                                    opacity: opacity,
                                    child: Container(
                                      margin: const EdgeInsets.symmetric(horizontal: 5),
                                      padding: const EdgeInsets.all(24),
                                      decoration: BoxDecoration(
                                        color: const Color(0xFF1A1D21).withValues(alpha: isActive ? 1.0 : 0.6),
                                        borderRadius: BorderRadius.circular(24),
                                        border: Border.all(
                                          color: isActive ? cardNeon : Colors.white12,
                                          width: isActive ? 2 : 1,
                                        ),
                                        boxShadow: isActive
                                            ? [
                                          BoxShadow(
                                            color: cardNeon.withValues(alpha: 0.35),
                                            blurRadius: 25,
                                            spreadRadius: 2,
                                          ),
                                        ]
                                            : [],
                                      ),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          if (!isCardLocked) ...[
                                            RichText(
                                              textAlign: TextAlign.center,
                                              text: TextSpan(
                                                style: TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.bold,
                                                  letterSpacing: 1.0,
                                                  color: isActive ? Colors.white : Colors.white54,
                                                ),
                                                children: [
                                                  TextSpan(
                                                    text: currentModels[index]['prefix'],
                                                    style: TextStyle(
                                                        color: isActive ? cardNeon : Colors.white38),
                                                  ),
                                                  TextSpan(text: currentModels[index]['title']),
                                                ],
                                              ),
                                            ),
                                            const Spacer(),
                                          ],

                                          Center(
                                            child: isCardLocked
                                                ? Icon(
                                              Icons.lock_outline,
                                              size: isActive ? 110 : 80,
                                              color: isActive ? Colors.redAccent : Colors.white24,
                                            )
                                                : Transform.scale(
                                              // YENİ DİNAMİK ÖLÇEKLEME (Eski karmaşık kodu sildik)
                                              scale: currentModels[index]['cardScale'] ?? 1.0,
                                              child: Image.asset(
                                                currentModels[index]['image'],
                                                height: isActive ? 140 : 90,
                                                fit: BoxFit.contain,
                                                color: isActive ? null : Colors.white.withValues(alpha: 0.2),
                                                colorBlendMode: isActive ? null : BlendMode.modulate,
                                              ),
                                            ),
                                          ),

                                          if (!isCardLocked) ...[
                                            const Spacer(),
                                            SizedBox(
                                              width: double.infinity,
                                              child: Text(
                                                currentModels[index]['stats'],
                                                textAlign: TextAlign.left,
                                                style: TextStyle(
                                                  color: isActive ? Colors.white : Colors.transparent,
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.bold,
                                                  height: 1.5,
                                                  letterSpacing: 0.5,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              },
                            );
                          },
                        ),
                      ),
                    ),
                    const Spacer(),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        currentModels.length,
                            (index) => AnimatedContainer(
                          duration: const Duration(milliseconds: 300),
                          margin: const EdgeInsets.symmetric(horizontal: 5),
                          width: 8,
                          height: 8,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: _currentPage == index
                                ? (currentModels[index]['isLocked'] ? Colors.redAccent : const Color(0xFF00E5FF))
                                : Colors.grey.shade700,
                          ),
                        ),
                      ),
                    ),
                    const Spacer(),

                    Center(
                      child: GestureDetector(
                        onTap: () {
                          if (!isCurrentLocked) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ArScreen(
                                  modelData: currentModels[_currentPage],
                                ),
                              ),
                            );
                          }
                        },
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 300),
                          padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 16),
                          decoration: BoxDecoration(
                            color: isCurrentLocked ? Colors.redAccent : const Color(0xFF00E5FF),
                            borderRadius: BorderRadius.circular(30),
                            boxShadow: [
                              BoxShadow(
                                color: isCurrentLocked
                                    ? Colors.redAccent.withValues(alpha: 0.4)
                                    : const Color(0xFF00E5FF).withValues(alpha: 0.4),
                                blurRadius: 20,
                                spreadRadius: 1,
                                offset: const Offset(0, 4),
                              ),
                            ],
                          ),
                          child: Text(
                            isCurrentLocked ? 'YETKİ REDDEDİLDİ' : 'AR ORTAMINDA\nİNCELE',
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.w900,
                              letterSpacing: 1.0,
                              height: 1.2,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: size.height * 0.05),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCategoryChip(String title, {required bool isActive, required bool isLocked, required VoidCallback onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
        decoration: BoxDecoration(
          color: isActive ? const Color(0xFF00E5FF).withValues(alpha: 0.15) : Colors.transparent,
          border: Border.all(
            color: isActive ? const Color(0xFF00E5FF) : Colors.white24,
            width: isActive ? 1.5 : 1,
          ),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          children: [
            if (isLocked) ...[
              const Icon(Icons.lock, size: 14, color: Colors.redAccent),
              const SizedBox(width: 8),
            ],
            Text(
              title,
              style: TextStyle(
                color: isActive
                    ? const Color(0xFF00E5FF)
                    : (isLocked ? Colors.white38 : Colors.white70),
                fontSize: 12,
                fontWeight: FontWeight.bold,
                letterSpacing: 1.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}