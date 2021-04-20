import 'package:flutter/material.dart';

class Term extends StatefulWidget {
  final Function() next;
  final Function() previous;

  Term({
    Key key,
    this.next,
    this.previous,
  }) : super(key: key);

  @override
  _TermState createState() => _TermState();
}

class _TermState extends State<Term> {
  ScrollController _scrollController;
  bool _termsReaded = false;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();

    _scrollController.addListener(() {
      if (_scrollController.offset >=
          _scrollController.position.maxScrollExtent) {
        setState(() => _termsReaded = true);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          titleSpacing: 0,
          centerTitle: false,
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          elevation: 0,
          title: Text(
            'Terms & Conditions',
            style: TextStyle(color: Colors.black),
          ),
          leading: IconButton(
              icon: Icon(
                Icons.arrow_back,
                color: Colors.black,
              ),
              onPressed: () => widget.previous()),
        ),
        body: Center(
          child: Padding(
            padding: EdgeInsets.only(
              left: 20,
              right: 20,
              bottom: 15,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    controller: _scrollController,
                    physics: AlwaysScrollableScrollPhysics(),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce sit amet odio vel libero laoreet molestie nec non tellus. Maecenas blandit efficitur lectus quis ultricies. Morbi ut accumsan metus. Duis ac purus dignissim felis porttitor aliquam. Praesent hendrerit tortor elit, venenatis convallis mauris mollis id. Donec viverra sagittis ultricies. Integer varius porta tellus, in faucibus sapien gravida vitae. Cras rutrum pretium mauris vel tristique. Quisque imperdiet dui non urna volutpat, quis gravida tortor placerat. Aliquam eu scelerisque nulla. Aliquam porta eros nulla, id venenatis felis laoreet at. Proin rhoncus tellus eu ultricies dapibus. Vivamus elementum neque tristique magna pellentesque dignissim. Proin lobortis, erat porta molestie finibus, justo felis interdum justo, vitae porttitor nisi est eu nulla.\nIn libero erat, suscipit ut erat eu, lobortis elementum nunc. Mauris ut massa justo. Aliquam erat volutpat. Sed sed ante vitae sem vehicula porttitor ac quis orci. Pellentesque vestibulum tortor tellus, non consequat quam elementum ac. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque et turpis sed orci congue mollis sit amet ut velit. Aliquam cursus, lorem eu dignissim malesuada, nibh purus elementum tortor, vitae ultrices augue nunc quis nunc. Pellentesque lectus neque, euismod eu vestibulum sed, hendrerit vitae orci. Aliquam rutrum diam nec ultrices sollicitudin. Donec in volutpat lectus, in blandit risus. Donec id euismod lorem, nec faucibus mauris. Vestibulum accumsan erat nibh, a euismod quam pulvinar vel. Curabitur ex lacus, posuere quis tempus quis, varius id odio. Mauris non lobortis velit. Mauris interdum, erat nec tempor rhoncus, dui tortor fringilla elit, et pellentesque turpis quam sed nisi.\nFusce egestas metus nec dui consequat, vel porttitor turpis rutrum. Interdum et malesuada fames ac ante ipsum primis in faucibus. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec convallis libero sit amet vehicula sodales. Curabitur porttitor hendrerit mauris, vel fringilla enim finibus sed. Cras a arcu ac metus fringilla porta nec a felis. Nam malesuada dui sit amet aliquet congue. Aenean vulputate rhoncus lectus eu malesuada. Aenean egestas eros in gravida congue. Nullam elementum efficitur sapien, lobortis accumsan sapien interdum sit amet.',
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Theme.of(context).primaryColor,
                    elevation: 0,
                    shape:
                        RoundedRectangleBorder(borderRadius: BorderRadius.zero),
                    padding: EdgeInsets.symmetric(vertical: 15),
                  ),
                  onPressed: _termsReaded
                      ? () {
                          widget.next();
                        }
                      : null,
                  child: Text(
                    'Accept & continue'.toUpperCase(),
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
