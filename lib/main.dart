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
        cardColor: Color(0xFF63A4FF),
        brightness: Brightness.dark,
        primaryColor: Colors.blue[700],
        scaffoldBackgroundColor: Colors.white,
        floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: Theme.of(context).primaryColor,
          foregroundColor: Colors.white,
        ),
        textTheme: GoogleFonts.kanitTextTheme(
          Theme.of(context).textTheme.copyWith(
                headline5: TextStyle(
                  color: Colors.white,
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
                headline4: TextStyle(
                  color: Colors.black,
                  fontSize: 18.0,
                ),
                headline3: TextStyle(
                  color: Colors.black,
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
      appBar: AppBar(
        title: Center(
          child: Text(
            widget.title,
            style: Theme.of(context).textTheme.headline5,
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
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
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: 'Back to Top',
        child: Icon(Icons.arrow_upward),
      ),
    );
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
    return Container(
      margin: const EdgeInsets.symmetric(
        vertical: 8.0,
        horizontal: 16.0,
      ),
      padding: const EdgeInsets.all(24.0),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
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
            color: Colors.black,
          )
        ],
      ),
    );
  }
}
