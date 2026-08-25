import 'package:flutter/material.dart';
import 'second_page.dart';


void main() => runApp(MyApp()); //RunsApp

class MyApp extends StatelessWidget{ //AppisWidget 
//Overall App Structure
  const MyApp({super.key});

  @override
  Widget build(BuildContext context){ //AppBuild
    return MaterialApp(
      title: "Indige", //AppName
      theme: ThemeData( //AppTheme
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.amber),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.amber,
          foregroundColor: Colors.black,
        ),
      ),
      home: MyHomePage(),//AppHomePage
    );
  }
}

class MyHomePage extends StatelessWidget { //HomePageisWidget
  @override
  Widget build(BuildContext context) {
    
    return Scaffold( //ScaffoldWidget
      appBar: AppBar(
        title: Text("Indige"),
      ),
      body: Center( //Parent //CentersFollowing
        child:Column( 
          mainAxisAlignment: MainAxisAlignment.center, // centers vertically
          crossAxisAlignment: CrossAxisAlignment.center, // centers horizontally
            children: [
              Text('Idioma'), //TextinColumn
              ElevatedButton( //ButtoninColumn //NestedParent
                onPressed: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const SecondPage()),
                  );
                }, 
                child: Text('Purepecha'), //NestedChild
              ),
              ElevatedButton( //ButtoninColumn //NestedParent
                onPressed: (){
                  print('button pressed');
                }, 
                child: Text('Nahuatl'), //NestedChild
              ),
              ElevatedButton( //ButtoninColumn //NestedParent
                onPressed: (){
                  print('button pressed');
                }, 
                child: Text('Maya'), //NestedChild
              ),
          ],
        ),
      ),
    );
  }
}

class SecondPage extends StatelessWidget{
  const SecondPage({super.key});

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Text('Diccionario Purepecha')
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: (){
            Navigator.pop(context);
          },
          child: const Text('Regresar')
        ),
    ),
    );
  }

}