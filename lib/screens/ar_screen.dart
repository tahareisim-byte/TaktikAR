import 'package:flutter/material.dart';
import 'package:model_viewer_plus/model_viewer_plus.dart';

class ArScreen extends StatefulWidget {
  final Map<String, dynamic> modelData;

  const ArScreen({super.key, required this.modelData});

  @override
  State<ArScreen> createState() => _ArScreenState();
}

class _ArScreenState extends State<ArScreen> {
  // Panel ilk açıldığında kapalı olsun
  bool _showInfoPanel = false;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.black,
      body: SizedBox.expand(
        child: Stack(
          children: [
            // AR KAMERA VE KENDİ 3D MODELİMİZ
            Positioned.fill(
              child: ModelViewer(
                backgroundColor: Colors.black,
                // DİNAMİK LOKAL MODEL YOLU BURADA BAĞLANDI (Örn: assets/models/anka.glb)
                src: widget.modelData['modelPath'] ?? '',
                alt: widget.modelData['title'] ?? 'TaktikAR 3D Modeli',
                ar: true,
                arModes: const ['scene-viewer', 'webxr', 'quick-look'],
                autoRotate: true,
                cameraControls: true,
                disableZoom: false,
              ),
            ),

            // ÜST HUD MENÜSÜ
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Geri Butonu
                      Container(
                        decoration: const BoxDecoration(
                          color: Colors.black45,
                          shape: BoxShape.circle,
                        ),
                        child: IconButton(
                          icon: const Icon(Icons.arrow_back_ios_new, color: Color(0xFF00E5FF)),
                          onPressed: () => Navigator.pop(context),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(top: 12.0),
                        child: Text(
                          'AR VİZÖRÜ AKTİF',
                          style: TextStyle(
                            color: Colors.redAccent,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 2.0,
                            fontSize: 12,
                          ),
                        ),
                      ),
                      // İ (BİLGİ) BUTONU
                      Container(
                        decoration: const BoxDecoration(
                          color: Colors.black45,
                          shape: BoxShape.circle,
                        ),
                        child: IconButton(
                          icon: Icon(
                            _showInfoPanel ? Icons.info : Icons.info_outline,
                            color: const Color(0xFF00E5FF),
                            size: 28,
                          ),
                          onPressed: () {
                            setState(() {
                              _showInfoPanel = !_showInfoPanel;
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            // AÇILIR KAPANIR BİLGİ PANELİ (HUD)
            AnimatedPositioned(
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
              bottom: _showInfoPanel ? 20 : -size.height,
              left: 20,
              right: 20,
              child: AnimatedOpacity(
                duration: const Duration(milliseconds: 300),
                opacity: _showInfoPanel ? 1.0 : 0.0,
                child: Container(
                  constraints: BoxConstraints(
                    maxHeight: size.height * 0.6,
                  ),
                  padding: const EdgeInsets.all(24),
                  decoration: BoxDecoration(
                    color: const Color(0xFF1A1D21).withValues(alpha: 0.90),
                    borderRadius: BorderRadius.circular(24),
                    border: Border.all(color: const Color(0xFF00E5FF).withValues(alpha: 0.5), width: 1),
                    boxShadow: [
                      BoxShadow(
                        color: const Color(0xFF00E5FF).withValues(alpha: 0.2),
                        blurRadius: 20,
                        spreadRadius: 1,
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Başlık ve Kapat Butonu
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: RichText(
                              text: TextSpan(
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 1.5,
                                ),
                                children: [
                                  TextSpan(
                                    text: '${widget.modelData['prefix']} ',
                                    style: const TextStyle(color: Color(0xFF00E5FF)),
                                  ),
                                  TextSpan(
                                    text: widget.modelData['title'].toString().replaceAll(':', ''),
                                    style: const TextStyle(color: Colors.white),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                _showInfoPanel = false;
                              });
                            },
                            child: const Icon(Icons.close, color: Colors.white54, size: 24),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      const Divider(color: Colors.white24, thickness: 1),
                      const SizedBox(height: 10),

                      // Özellikler Metni
                      Flexible(
                        child: SingleChildScrollView(
                          physics: const BouncingScrollPhysics(),
                          child: Text(
                            widget.modelData['details'] ?? '',
                            style: const TextStyle(
                              color: Colors.white70,
                              fontSize: 13,
                              height: 1.6,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}