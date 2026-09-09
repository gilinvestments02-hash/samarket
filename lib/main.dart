import 'package:flutter/material.dart';
void main() => runApp(SAMarketApp());
class SAMarketApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'SA MARKET',
      theme: ThemeData(primarySwatch: Colors.green, useMaterial3: true),
      home: HomePage(),
    );
  }
}
class Product {
  final String title; final String price; final String location; final String category; final IconData icon;
  Product(this.title, this.price, this.location, this.category, this.icon);
}
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}
class _HomePageState extends State<HomePage> {
  String selectedCat = 'All';
  final cats = ['All', 'Phones', 'Cars', 'Fashion', 'Home', 'Jobs'];
  final products = [
    Product('iPhone 14 Pro 256GB', 'R15,500', 'Johannesburg, GP', 'Phones', Icons.phone_iphone),
    Product('Toyota Hilux 2022', 'R385,000', 'Pretoria, GP', 'Cars', Icons.directions_car),
    Product('Nike Air Max Shoes', 'R1,899', 'Cape Town, WC', 'Fashion', Icons.checkroom),
    Product('4-Bedroom House', 'R1,250,000', 'Durban, KZN', 'Home', Icons.home),
    Product('Samsung S23 Ultra', 'R18,000', 'Polokwane, Limpopo', 'Phones', Icons.smartphone),
    Product('Waiter Needed', 'R4,500/mo', 'Lephalale, Limpopo', 'Jobs', Icons.work),
    Product('Leather Sofa 3-Seater', 'R6,500', 'Bloemfontein, FS', 'Home', Icons.weekend),
    Product('Toyota Corolla Quest', 'R195,000', 'Giyani, Limpopo', 'Cars', Icons.car_rental),
  ];
  List<Product> get filtered => selectedCat == 'All'? products : products.where((p) => p.category == selectedCat).toList();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(children: [Icon(Icons.storefront, color: Colors.white), SizedBox(width: 8), Text('SA MARKET', style: TextStyle(fontWeight: FontWeight.bold))]),
        backgroundColor: Colors.green[700], foregroundColor: Colors.white,
        actions: [IconButton(icon: Icon(Icons.search), onPressed: (){}), IconButton(icon: Icon(Icons.person), onPressed: (){})],
      ),
      body: Column(children: [
          Container(color: Colors.green[700], padding: EdgeInsets.fromLTRB(16, 0, 16, 16),
            child: TextField(decoration: InputDecoration(hintText: 'Search in South Africa...', filled: true, fillColor: Colors.white, prefixIcon: Icon(Icons.search), border: OutlineInputBorder(borderRadius: BorderRadius.circular(30), borderSide: BorderSide.none), contentPadding: EdgeInsets.zero))),
          Container(height: 50, child: ListView(scrollDirection: Axis.horizontal, padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
              children: cats.map((c) { bool sel = c == selectedCat; return GestureDetector(onTap: () => setState(() => selectedCat = c),
                  child: Container(margin: EdgeInsets.only(right: 8), padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8), decoration: BoxDecoration(color: sel? Colors.green[700] : Colors.grey[200], borderRadius: BorderRadius.circular(20)),
                    child: Text(c, style: TextStyle(color: sel? Colors.white : Colors.black, fontWeight: FontWeight.bold)))); }).toList())),
          Expanded(child: GridView.builder(padding: EdgeInsets.all(10), gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, childAspectRatio: 0.78, crossAxisSpacing: 10, mainAxisSpacing: 10), itemCount: filtered.length,
              itemBuilder: (ctx, i) { var p = filtered[i]; return Card(elevation: 3, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                    Expanded(child: Container(decoration: BoxDecoration(color: Colors.green[50], borderRadius: BorderRadius.vertical(top: Radius.circular(12))), child: Center(child: Icon(p.icon, size: 50, color: Colors.green[700])))),
                    Padding(padding: EdgeInsets.all(8), child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                          Text(p.title, maxLines: 1, overflow: TextOverflow.ellipsis, style: TextStyle(fontWeight: FontWeight.bold)),
                          SizedBox(height: 2), Text(p.price, style: TextStyle(color: Colors.green[700], fontWeight: FontWeight.bold, fontSize: 16)),
                          SizedBox(height: 2), Row(children: [Icon(Icons.location_on, size: 12, color: Colors.grey), SizedBox(width: 2), Expanded(child: Text(p.location, style: TextStyle(fontSize: 11, color: Colors.grey[600]), maxLines: 1))])]))])); })),
        ]),
      floatingActionButton: FloatingActionButton.extended(onPressed: () { ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Sell feature coming soon!'))); }, backgroundColor: Colors.orange[800], icon: Icon(Icons.add), label: Text('SELL')),
      bottomNavigationBar: BottomNavigationBar(selectedItemColor: Colors.green[700], unselectedItemColor: Colors.grey, type: BottomNavigationBarType.fixed,
        items: [BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'), BottomNavigationBarItem(icon: Icon(Icons.favorite), label: 'Saved'), BottomNavigationBarItem(icon: Icon(Icons.chat), label: 'Chats'), BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Account')]),
    );
  }
}
