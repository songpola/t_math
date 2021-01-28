import 'package:flutter/material.dart';
import 'package:t_math/unit_info_page.dart';

class HomePage extends StatefulWidget {
  static const routeName = "/home_page";

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
                        "T-Math",
                        style: Theme.of(context).textTheme.headline5,
                        textAlign: TextAlign.center,
                      ),
                    )),
              ),
              _UnitNameItem(
                title: "เซต",
                subtitle: "Set",
                isEnabled: false,
              ),
              _UnitNameItem(
                title: "ตรรกศาสตร์",
                subtitle: "Logic",
                isEnabled: false,
              ),
              _UnitNameItem(
                title: "จำนวนจริง",
                subtitle: "Real Number",
              ),
              _UnitNameItem(
                title: "ความสัมพันธ์และฟังก์ชัน",
                subtitle: "Relation & Function",
                isEnabled: false,
              ),
              _UnitNameItem(
                title: "เลขยกกำลัง และลอการิทึม",
                subtitle: "Exponential & Logarithm",
                pdfAsset: "ExponentialAndLogarithm",
              ),
              _UnitNameItem(
                title: "เรขาคณิตวิเคราะห์และภาคตัดกรวย",
                subtitle: "Analytic Geometry & Conic section",
                pdfAsset: "AnalyticGeometryAndConicSection",
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
                pdfAsset: "SequenceAndSeries",
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

class _UnitNameItem extends StatelessWidget {
  final String title;
  final String subtitle;
  final String pdfAsset;
  final bool isEnabled;

  const _UnitNameItem({
    Key key,
    this.title,
    this.subtitle,
    this.pdfAsset,
    this.isEnabled = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (isEnabled) {
          Navigator.pushNamed(
            context,
            UnitInfoPage.routeName,
            arguments: UnitInfoPageArguments(
              title,
              pdfAsset ?? subtitle.replaceAll(" ", ""),
            ),
          );
        }
      },
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
