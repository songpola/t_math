import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'T-Math',
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Color(0xFFD32F2F),
        scaffoldBackgroundColor: Colors.white,
        floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: Theme.of(context).primaryColor,
          foregroundColor: Colors.white,
        ),
        textTheme: GoogleFonts.kanitTextTheme(
          Theme.of(context).textTheme.copyWith(
                headline5: TextStyle(
                  color: Colors.white,
                  fontSize: 48.0,
                  fontWeight: FontWeight.bold,
                ),
                headline4: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 16.0,
                ),
                headline3: TextStyle(
                  color: Colors.white,
                  fontSize: 14.0,
                ),
              ),
        ),
      ),
      home: HomePage(title: 'T-Math'),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              ClipPath(
                clipper: _HeaderClipper(),
                child: Container(
                  height: 176.0,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        const Color(0xFF9A0007),
                        const Color(0xFFFF6659),
                      ],
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: Text(
                      widget.title,
                      style: Theme.of(context).textTheme.headline5,
                      textAlign: TextAlign.center,
                    ),
                  )
                ),
              ),
              _UnitNameItem(
                title: "เซต",
                subtitle: "Set",
              ),
              _UnitNameItem(
                title: "ตรรกศาสตร์",
                subtitle: "Logic",
              ),
              _UnitNameItem(
                title: "จำนวนจริง",
                subtitle: "Real Number",
              ),
              _UnitNameItem(
                title: "ความสัมพันธ์และฟังก์ชัน",
                subtitle: "Relation & Function",
              ),
              _UnitNameItem(
                title: "เลขยกกำลัง และลอการิทึม",
                subtitle: "Exponential & Logarithm",
              ),
              _UnitNameItem(
                title: "เรขาคณิตวิเคราะห์และภาคตัดกรวย",
                subtitle: "Analytic Geometry & Conic section",
              ),
              _UnitNameItem(
                title: "จำนวนเชิงซ้อน",
                subtitle: "Complex Number",
              ),
              _UnitNameItem(
                title: "ตรีโกณมิติ",
                subtitle: "Trigonometry",
              ),
              _UnitNameItem(
                title: "เมทริกซ์",
                subtitle: "Matrix",
              ),
              _UnitNameItem(
                title: "เวกเตอร์",
                subtitle: "Vector",
              ),
              _UnitNameItem(
                title: "ความน่าจะเป็น",
                subtitle: "Probability",
              ),
              _UnitNameItem(
                title: "ลำดับอนุกรม",
                subtitle: "Sequence & Series",
              ),
              _UnitNameItem(
                title: "แคลคูลัส",
                subtitle: "Calculus",
              ),
              _UnitNameItem(
                title: "สถิติ",
                subtitle: "Statistics",
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _HeaderClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height - 80);
    path.quadraticBezierTo(
      size.width / 2,
      size.height,
      size.width,
      size.height - 80,
    );
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}

class _UnitNameItem extends StatelessWidget {
  final String title;
  final String subtitle;
  final String imageAsset;

  const _UnitNameItem({
    Key key,
    this.title,
    this.subtitle,
    this.imageAsset,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        margin: const EdgeInsets.symmetric(
          vertical: 8.0,
          horizontal: 16.0,
        ),
        padding: const EdgeInsets.all(24.0),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.bottomRight,
            end: Alignment.topLeft,
            colors: [
              const Color(0xFF3383CD),
              const Color(0xFF11249F),
            ],
          ),
          borderRadius: const BorderRadius.all(
            const Radius.circular(8.0),
          ),
          boxShadow: [
            BoxShadow(
              color: Color(0xFFAAAAAA),
              offset: const Offset(4.0, 4.0),
              blurRadius: 4.0,
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: Theme.of(context).textTheme.headline4,
                ),
                Text(
                  "($subtitle)",
                  style: Theme.of(context).textTheme.headline3,
                ),
              ],
            ),
            Icon(
              Icons.keyboard_arrow_right,
              color: Colors.white,
            )
          ],
        ),
      ),
    );
  }
}
