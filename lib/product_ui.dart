import 'package:flutter/material.dart';

class ProudctUi extends StatefulWidget {
  ProudctUi({Key key}) : super(key: key);

  @override
  _ProudctUiState createState() => _ProudctUiState();
}

class _ProudctUiState extends State<ProudctUi> {
  List<Color> listColors = [Colors.red, Colors.black, Colors.green, Colors.grey, Colors.yellow, Colors.pink];

  int _index = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultTabController(
        length: 2,
        initialIndex: 0,
        child: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              title: Text("Grovie Elmo Tee"),
              actions: <Widget>[
                IconButton(
                  icon: Icon(Icons.share),
                  onPressed: () {},
                ),
                SizedBox(
                  width: 20,
                ),
                IconButton(
                  icon: Icon(Icons.shopping_cart),
                  onPressed: () {},
                ),
                SizedBox(
                  width: 20,
                ),
              ],
              expandedHeight: 300,
              flexibleSpace: Container(
                color: listColors[_index],
              ),
            ),
            SliverToBoxAdapter(
              child: Container(
                margin: EdgeInsets.symmetric(vertical: 10),
                height: 80,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: listColors.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        setState(() {
                          _index = index;
                        });
                      },
                      child: Container(
                        margin: EdgeInsets.only(right: 10),
                        width: 80,
                        height: 80,
                        color: listColors[index],
                      ),
                    );
                  },
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    "Grovie Elmo Tee",
                    style: TextStyle(fontSize: 20, color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "Rp. 72.000",
                    style: TextStyle(fontSize: 20, color: Colors.red, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            SliverToBoxAdapter(
              child: Divider(),
            ),
            SliverToBoxAdapter(
              child: Container(
                  child: TabBar(
                labelColor: Colors.red,
                labelStyle: TextStyle(fontSize: 18),
                labelPadding: EdgeInsets.symmetric(vertical: 10),
                unselectedLabelColor: Colors.black,
                tabs: <Widget>[
                  Text(
                    "Details",
                  ),
                  Text(
                    "Deskripsi",
                  ),
                ],
              )),
            ),
            SliverToBoxAdapter(
              child: Divider(),
            ),
            SliverToBoxAdapter(
              child: Container(
                height: 200,
                child: TabBarView(
                  children: <Widget>[DetailsWidget(), DeskripsiWidget()],
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Container(
                              child: Row(
                  children: <Widget>[
                    Expanded(
                      flex: 1,
                      child: Container(
                         margin: EdgeInsets.symmetric(horizontal: 10),
                        child: FlatButton(
                          shape: Border.all(color: Colors.red),
                          onPressed: (){},
                          color: Colors.white,
                          child: Text("Beli")),
                      )), 
                    Expanded(
                      flex: 2,
                      child: Container(
                        margin: EdgeInsets.symmetric(horizontal: 10),
                        child: FlatButton(
                          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                          onPressed: (){},
                          color: Colors.red,
                          child: Text("Tambah ke keranjang", style: TextStyle(color: Colors.white),),),
                      ))
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class DeskripsiWidget extends StatelessWidget {
  const DeskripsiWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(child: Text("Grovie Elmo Tee IDR 72,000\nAvailable in Black\nMaterial Kaos Import\nLD : 96 cm\nLength : 60 cm "));
  }
}

class DetailsWidget extends StatelessWidget {
  const DetailsWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        _detailsColourVariant(),
        SizedBox(
          height: 10,
        ),
        _detailsKategoriVariant(),
        SizedBox(
          height: 10,
        ),
        _detailsBeratVariant()
      ],
    );
  }

  Container _detailsColourVariant() {
    return Container(
      child: Row(
        children: <Widget>[
          Expanded(
            child: Container(child: Text("Colour")),
          ),
          Expanded(
            child: Container(
                child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                _circleColors(
                  Colors.red,
                ),
                _circleColors(
                  Colors.blue,
                ),
                _circleColors(
                  Colors.pink,
                ),
              ],
            )),
          ),
        ],
      ),
    );
  }

  CircleAvatar _circleColors(Color color) {
    return CircleAvatar(
      backgroundColor: color,
      maxRadius: 10,
      minRadius: 10,
    );
  }

  Container _detailsKategoriVariant() {
    return Container(
      child: Row(
        children: <Widget>[
          Expanded(
            child: Container(child: Text("Kategori")),
          ),
          Expanded(
            child: Container(child: Text("Tee/Kaos")),
          ),
        ],
      ),
    );
  }

  Container _detailsBeratVariant() {
    return Container(
      child: Row(
        children: <Widget>[
          Expanded(
            child: Container(child: Text("Berat")),
          ),
          Expanded(
            child: Container(child: Text("0.20Kg")),
          ),
        ],
      ),
    );
  }
}
