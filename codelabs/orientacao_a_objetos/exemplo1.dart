import 'package:meta/meta.dart';
import 'dart:convert';
import 'dart:mirrors';

// Test t = new Test();
//   InstanceMirror instance_mirror = reflect(t);
//   var class_mirror = instance_mirror.type;
//   for(var v in class_mirror.variables.values)
//   {
//     var name = MirrorSystem.getName(v.simpleName);
//     print("$name => S: ${v.isStatic}, P: ${v.isPrivate}, F: ${v.isFinal}");
//   }

// um componente em flutter é qualuer coisa que herde 
// da classe widget

// StatelessWidget e StatefullWidget extendem widget

abstract class Widget {}

abstract class StatelessWidget extends Widget {

  Widget build();
}

abstract class StatefullWidget extends Widget {

}

class NativeText extends Widget {}

class Text extends StatelessWidget {

  @override
  Widget build() {
    return NativeText();
  }
}

class GestureDetector extends StatelessWidget {
  GestureDetector({
    @required this.onTap,
    @required this.child,
  });

  final Widget child;
  final Function onTap;
  
  @override
  Widget build() { }
}

class WhiteButton extends StatelessWidget {

  WhiteButton({
    @required this.onTap,
    @required this.title,
  });

  final Function onTap;
  final String title;

  @override
  Widget build() {
    return GestureDetector(child: Text());
  }


}


void mount(Widget component) {

  // print("  ${component.runtimeType}")
  // component()
  // print(objectToMap(component));
  

}

/**
   * Uses refection (mirrors) to produce a Map (array) from an object's
   * variables. Making the variable name the key, and it's value the
   * value.
   */
  // Map objectToMap(Object object)
  // {
  //   // Mirror the particular instance (rather than the class itself)
  //   InstanceMirror instanceMirror = reflect(object);
  //   Map dataMapped = new Map();

  //   // Mirror the instance's class (type) to get the declarations
  //   for (var declaration in instanceMirror.type.declarations.values)
  //   {
  //     // If declaration is a type of variable, map variable name and value
  //     if (declaration is VariableMirror)
  //     {
  //       String variableName = MirrorSystem.getName(declaration.simpleName);
  //       String variableValue = instanceMirror.getField(declaration.simpleName).reflectee;

  //       dataMapped[variableName] = variableValue;
  //     }
  //   }

  //   return dataMapped;
  // }


void main() {
  final button = WhiteButton(
    onTap: () => {
      print("Clicou aqui")
    },
    title: "Adriano"
  );


  // button.
  //  Test t = new Test();

  InstanceMirror instance_mirror = reflect(button);

    var class_mirror = instance_mirror.type;


    print(class_mirror.declarations.values.map((e) {
      var name = MirrorSystem.getName(e.simpleName);
      // Typedef

      // TypeMirror(e);
      // if(e is VariableMirror) {
      //   e.
      // }

      // e.
      // MirrorSystem
      // MirrorSystem
      print(name);

      // print(e.type);
    }));

    // for (var v in class_mirror.declarations.values) {

    //     var name = MirrorSystem.getName(v.simpleName);



    //     // if (v is VariableMirror) {
    //     //     print("Variable: $name => S: ${v.isStatic}, P: ${v.isPrivate}, F: ${v.isFinal}, C: ${v.isConst}");
    //     // } else if (v is MethodMirror) {
    //     //     print("Method: $name => S: ${v.isStatic}, P: ${v.isPrivate}, A: ${v.isAbstract}");
    //     // }

    // }
  
  // for(var v in class_mirror.variables.values)
  // {
  //   var name = MirrorSystem.getName(v.simpleName);
  //   print("$name => S: ${v.isStatic}, P: ${v.isPrivate}, F: ${v.isFinal}");
  // }

  // mount(button);
}
