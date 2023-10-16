import 'package:flutter/material.dart';
import 'package:page_view_indicators/page_view_indicators.dart';
import 'package:tokoecommerce/authentication/login.dart';

class OnboardingPage extends StatefulWidget {
  @override
  _OnboardingPageState createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  final PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;
  final List<OnboardingItem> _onboardingItems = [
    OnboardingItem(
      title: 'Welcome In Lux\'s Store',
      description: ('Lux\'s Store adalah toko pakaian paling lengkap dan terpercaya'),
      image: 'assets/images/onboarding1.png',
    ),
    OnboardingItem(
      title: 'Banyak Kategori Produk',
      description: 'Tersedi berbagai produk, Pilih produk yang kamu inginkan sesuai kategorimu dan dapatkan ',
      image: 'assets/images/onboarding2.png',
      // image: 'assets/animasi/animasi5.json',
    ),
    OnboardingItem(
      title: 'Terpercaya',
      description: 'Produk yang kami sediakan terpercaya kualitasnya. ayo mulai belanja di sini',
      image: 'assets/images/onboarding3.png',
      // image: 'assets/animasi/animasi4.json',
    ),
  ];

  final _pageControllerNotifier = ValueNotifier<int>(0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(bottom: 30),
        color: Color.fromRGBO(0, 194, 255,255),
      //  decoration: BoxDecoration(
      //     image: DecorationImage(
      //       image: AssetImage('assets/images/background3.png'), //background
      //       fit: BoxFit.cover,
      //     ),
      //  ),
        child: Column(
            children: [
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                itemCount: _onboardingItems.length,
                onPageChanged: (int page) {
                  setState(() {
                    _currentPage = page;
                  });
                },
                itemBuilder: (context, index) {
                  return OnboardingItemWidget(_onboardingItems[index]);
                },
              ),
            ), 
    
            Container(
              padding: EdgeInsets.symmetric(vertical: 20.0),
              child: Center(
                child: CirclePageIndicator(
                  selectedDotColor: Colors.blue,
                  dotColor: Colors.grey,
                  itemCount: _onboardingItems.length,
                  currentPageNotifier: _pageControllerNotifier,
                  
                ),
                
              ),
            ),
            SizedBox(height: 20),
            _currentPage == _onboardingItems.length - 1
                ? Container(
                  margin: EdgeInsets.only(bottom: 50),
                  width: 150,
                  height: 50,
                  decoration: BoxDecoration(
                     color: Colors.red.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Center(
                    child: InkWell(
                        onTap: () {
                          Navigator.of(context).pushReplacement(
                            MaterialPageRoute(
                              builder: (_) => LoginPage(),
                            ),
                          );
                        },
                        child: Text('Let\'s Go', style: TextStyle(fontSize: 20),),
                      ),
                  ),
                )
                : Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                builder: (_) => LoginPage(),
                              ),
                            );
                          },
                          child: Text('Skip'),
                        ),
                        TextButton(
                          onPressed: () {
                            _pageController.nextPage(
                              duration: Duration(milliseconds: 500),
                              curve: Curves.ease,
                            );
                          },
                          child: Text('Next'),
                        ),
                      ],
                    ),
                ),
          ],
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _pageController.addListener(() {
      _pageControllerNotifier.value = _pageController.page!.round();
    });
  }
  
}

class OnboardingItem {
  final String title;
  final String description;
  final String image;

  OnboardingItem({
    required this.title,
    required this.description,
    required this.image,
  });
}

class OnboardingItemWidget extends StatelessWidget {
  final OnboardingItem item;

  OnboardingItemWidget(this.item);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(  
          item.image,
          height: 350,
        ),
        SizedBox(height: 20),
        Text(
          item.title,
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 10),
        Padding(
          padding: EdgeInsets.only(right:20, left:20),
          child: Text(
            item.description,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 16,
            ),
          ),
        ),
      ],
    );
  }
}
