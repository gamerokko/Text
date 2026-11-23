import 'package:flutter/material.dart';

void main() => runApp(const VibeApp());

const ink = Color(0xFF20212A);
const yellow = Color(0xFFFFD84D);
const green = Color(0xFFB8E986);
const muted = Color(0xFF858796);
const canvas = Color(0xFFF7F7FA);

class VibeApp extends StatelessWidget {
  const VibeApp({super.key});
  @override
  Widget build(BuildContext context) => MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'Vibe',
    theme: ThemeData(useMaterial3: true, scaffoldBackgroundColor: canvas, colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF8567E8))),
    home: const MainShell(),
  );
}

class MainShell extends StatefulWidget {
  const MainShell({super.key});
  @override
  State<MainShell> createState() => _MainShellState();
}
class _MainShellState extends State<MainShell> {
  int index = 0;
  final pages = const [HomePage(), MomentsPage(), PartyPage(), MessagesPage(), ProfilePage()];
  @override
  Widget build(BuildContext context) => Scaffold(
    body: SafeArea(child: IndexedStack(index: index, children: pages)),
    bottomNavigationBar: NavigationBar(
      selectedIndex: index,
      onDestinationSelected: (v) => setState(() => index = v),
      backgroundColor: Colors.white,
      indicatorColor: const Color(0xFFECE6FF),
      destinations: const [
        NavigationDestination(icon: Icon(Icons.home_outlined), selectedIcon: Icon(Icons.home), label: 'Ana Sayfa'),
        NavigationDestination(icon: Icon(Icons.photo_library_outlined), selectedIcon: Icon(Icons.photo_library), label: 'Anlar'),
        NavigationDestination(icon: Icon(Icons.mic_none), selectedIcon: Icon(Icons.mic), label: 'Parti'),
        NavigationDestination(icon: Icon(Icons.chat_bubble_outline), selectedIcon: Icon(Icons.chat_bubble), label: 'Mesaj'),
        NavigationDestination(icon: Icon(Icons.person_outline), selectedIcon: Icon(Icons.person), label: 'Ben'),
      ],
    ),
  );
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  @override
  Widget build(BuildContext context) => ListView(padding: const EdgeInsets.fromLTRB(18, 14, 18, 24), children: [
    Row(children: [const Text('VIBE', style: TextStyle(fontSize: 25, fontWeight: FontWeight.w900, letterSpacing: 2, color: ink)), const Spacer(), _roundIcon(Icons.search), const SizedBox(width: 10), _roundIcon(Icons.notifications_none)]),
    const SizedBox(height: 20),
    Row(children: [
      Expanded(child: _featureCard('Sesli Sohbet', 'Yeni arkadaşlar keşfet', yellow, Icons.headset_mic)),
      const SizedBox(width: 12),
      Expanded(child: _featureCard('Görevler', 'Ödüller seni bekliyor', green, Icons.card_giftcard)),
    ]),
    const SizedBox(height: 22),
    Row(children: [const Text('Öne Çıkanlar', style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold, color: ink)), const Spacer(), const Text('Tümünü gör', style: TextStyle(color: muted))]),
    const SizedBox(height: 12),
    Container(height: 112, decoration: BoxDecoration(gradient: const LinearGradient(colors: [Color(0xFF7662D9), Color(0xFFB7A5F5)]), borderRadius: BorderRadius.circular(20)), padding: const EdgeInsets.all(18), child: const Column(crossAxisAlignment: CrossAxisAlignment.start, mainAxisAlignment: MainAxisAlignment.center, children: [Text('VIBE ETKİNLİKLERİ', style: TextStyle(color: Colors.white70, fontWeight: FontWeight.bold, fontSize: 11)), SizedBox(height: 5), Text('Sohbete katıl, eğlenceyi yakala!', style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold))])),
    const SizedBox(height: 22),
    const Text('Senin için önerilenler', style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold, color: ink)),
    const SizedBox(height: 8),
    ...['Lara', 'Mert', 'Elif', 'Deniz'].map(_userTile),
  ]);
}
Widget _featureCard(String title, String sub, Color color, IconData icon) => Container(height: 132, padding: const EdgeInsets.all(15), decoration: BoxDecoration(color: color, borderRadius: BorderRadius.circular(22)), child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Icon(icon, size: 27, color: ink), const Spacer(), Text(title, style: const TextStyle(fontWeight: FontWeight.w900, fontSize: 17, color: ink)), Text(sub, style: TextStyle(fontSize: 11, color: ink.withOpacity(.7)))]));
Widget _roundIcon(IconData icon) => Container(width: 40, height: 40, decoration: const BoxDecoration(color: Colors.white, shape: BoxShape.circle), child: Icon(icon, color: ink));
Widget _avatar(String name, {double size = 48}) => CircleAvatar(radius: size / 2, backgroundColor: const Color(0xFFE8E1FF), child: Text(name.substring(0, 1), style: TextStyle(color: const Color(0xFF7055C8), fontWeight: FontWeight.bold, fontSize: size * .38)));
Widget _userTile(String name) => Container(margin: const EdgeInsets.only(top: 9), padding: const EdgeInsets.all(11), decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(16)), child: Row(children: [_avatar(name), const SizedBox(width: 12), Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text(name, style: const TextStyle(fontWeight: FontWeight.bold, color: ink)), const Text('Çevrimiçi · Yeni arkadaşlar keşfet', style: TextStyle(fontSize: 11, color: muted))])), OutlinedButton(onPressed: () {}, child: const Text('Selam'))]));

class MomentsPage extends StatelessWidget {
  const MomentsPage({super.key});
  @override
  Widget build(BuildContext context) => _emptyPage('Anlar', 'Paylaşımları keşfet', Icons.photo_library_outlined, 'Henüz gönderi yok', 'Arkadaşlarının fotoğraf ve videoları burada görünecek.');
}
class PartyPage extends StatelessWidget {
  const PartyPage({super.key});
  @override
  Widget build(BuildContext context) => ListView(padding: const EdgeInsets.all(18), children: [
    const Text('Parti', style: TextStyle(fontSize: 26, fontWeight: FontWeight.w900, color: ink)),
    const SizedBox(height: 6), const Text('Canlı sohbet odalarını keşfet', style: TextStyle(color: muted)),
    const SizedBox(height: 18),
    for (final room in ['Tanışma Odası', 'Müzik Keyfi', 'Gece Sohbeti', 'Yeni Arkadaşlar'])
      Card(color: Colors.white, child: ListTile(leading: const CircleAvatar(backgroundColor: Color(0xFFFFE9A6), child: Icon(Icons.mic, color: ink)), title: Text(room, style: const TextStyle(fontWeight: FontWeight.bold)), subtitle: const Text('Oda · Demo görünüm'), trailing: const Icon(Icons.chevron_right), onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const RoomPage())))),
  ]);
}
class RoomPage extends StatefulWidget {
  const RoomPage({super.key});
  @override
  State<RoomPage> createState() => _RoomPageState();
}
class _RoomPageState extends State<RoomPage> {
  bool mic = false;
  @override
  Widget build(BuildContext context) => Scaffold(
    backgroundColor: const Color(0xFF29233F),
    appBar: AppBar(backgroundColor: Colors.transparent, foregroundColor: Colors.white, title: const Text('Sesli Oda')),
    body: Column(children: [
      const SizedBox(height: 30),
      const Text('Tanışma Odası', style: TextStyle(color: Colors.white, fontSize: 23, fontWeight: FontWeight.bold)),
      const SizedBox(height: 30),
      Wrap(spacing: 22, runSpacing: 22, alignment: WrapAlignment.center, children: List.generate(8, (i) => Column(children: [CircleAvatar(radius: 31, backgroundColor: const Color(0xFF7565A8), child: Text('${i + 1}', style: const TextStyle(color: Colors.white))), const SizedBox(height: 5), Text(i == 0 ? 'Sunucu' : 'Koltuk', style: const TextStyle(color: Colors.white70))]))),
      const Spacer(),
      const Text('Demo ekranı: canlı ses bağlantısı henüz eklenmedi.', style: TextStyle(color: Colors.white70, fontSize: 12)),
      const SizedBox(height: 16),
      FilledButton.icon(onPressed: () => setState(() => mic = !mic), icon: Icon(mic ? Icons.mic : Icons.mic_off), label: Text(mic ? 'Mikrofonu kapat' : 'Mikrofonu aç')),
      const SizedBox(height: 35),
    ]),
  );
}
class MessagesPage extends StatelessWidget {
  const MessagesPage({super.key});
  @override
  Widget build(BuildContext context) => _emptyPage('Mesajlar', 'Sohbetlerin', Icons.chat_bubble_outline, 'Henüz mesajın yok', 'Yeni bir sohbet başladığında burada görünecek.');
}
class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});
  @override
  Widget build(BuildContext context) => ListView(padding: const EdgeInsets.all(20), children: [
    const SizedBox(height: 20), Center(child: _avatar('V', size: 90)), const SizedBox(height: 12),
    const Center(child: Text('Vibe Kullanıcısı', style: TextStyle(fontSize: 21, fontWeight: FontWeight.bold, color: ink))),
    const Center(child: Text('ID: 10000001', style: TextStyle(color: muted))), const SizedBox(height: 25),
    for (final item in ['Cüzdan ve Coin', 'VIP Üyelik', 'Görevlerim', 'Arkadaşlarım', 'Ayarlar'])
      Card(color: Colors.white, child: ListTile(title: Text(item), trailing: const Icon(Icons.chevron_right), onTap: () {})),
  ]);
}
Widget _emptyPage(String title, String subtitle, IconData icon, String empty, String detail) => Center(child: Padding(padding: const EdgeInsets.all(28), child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [Icon(icon, size: 58, color: const Color(0xFF9A85E8)), const SizedBox(height: 18), Text(title, style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: ink)), Text(subtitle, style: const TextStyle(color: muted)), const SizedBox(height: 35), Text(empty, style: const TextStyle(fontWeight: FontWeight.bold, color: ink)), const SizedBox(height: 6), Text(detail, textAlign: TextAlign.center, style: const TextStyle(color: muted))])));
