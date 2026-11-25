class NormalScreen extends StatelessWidget {NormalScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Normal Screen'),
      ),
      body: Center(
        child: Text('This is the normal screen.'),
      ),
    );
  }
}