import 'dart:io';
abstract class Person {
  void displayInfo();
}

class Student extends Person {
  String _id;
  String _name;
  int _age;
  double _gpa;

  Student(this._id, this._name, this._age, this._gpa);

  String get id => _id;
  String get name => 
  _name;
  int get age => _age;
  double get gpa => _gpa;
  set name(String value) => _name = value;
  set age(int value) => _age = value;
  set gpa(double value) => _gpa = value;

  @override
  void displayInfo() {
    print("ID   : $_id");
    print("Name : $_name");
    print("Age  : $_age");
    print("GPA  : $_gpa");
  }
}

  void addStudent(List<Student> students){
    stdout.write("Enter student name: ");
    String name = stdin.readLineSync()!;
    stdout.write("Enter student age: ");
    int age = int.parse(stdin.readLineSync()!);
    stdout.write("Enter student GPA: ");
    double gpa = double.parse(stdin.readLineSync()!);

    stdout.write("Enter student ID: ");
    String id = stdin.readLineSync()!;

    Student newStudent = Student(id, name, age, gpa);
    students.add(newStudent);
    print("Student added successfully!");
  }

  void viewAllStudents(List<Student> students) {
    if (students.isEmpty) {
      print("No students found.");
    } else {
      print("All Students:");
      for (var student in students) {
        student.displayInfo();
        print("--------------------");
      }
    }
  }

  void searchStudent(List<Student> students) {
    stdout.write("Enter student Id to search: ");
    String id = stdin.readLineSync()!;
    bool found = false;

    for (var student in students) {
      if (student.id == id) {
        print("Student found:");
        student.displayInfo();
        found = true;
        break;
      }
    }

    if (!found) {
      print("Student not found.");
    }
  }

  void deleteStudent(List<Student> students) {
    stdout.write("Enter student Id to delete: ");
    String id = stdin.readLineSync()!;
    bool found = false;

    for (var student in students) {
      if (student.id == id) {
        students.remove(student);
        print("Student deleted successfully!");
        found = true;
        break;
      }
    }

    if (!found) {
      print("Student not found.");
    }
  }

  void exitProgram() {
    print("Exiting the program. Goodbye!");
    exit(0);
  }


  void main() {
    
    List<Student> students = [];

    print("\nMenu:");
    print("1. Add Student");
    print("2. View All Students");
    print("3. Search Student");
    print("4. Delete Student");
    print("5. Exit");
    print("\Choose  : ");

    int menu = int.parse(stdin.readLineSync()!);
    switch (menu) {
      case 1:
        print("1: Add Student");
        addStudent(students);
        break;
      case 2:
        print("2: View All Students");
        viewAllStudents(students);
        break;
      case 3:
        print("3. Search Student");
        searchStudent(students);
        break;
      case 4:
        print("4. Delete Student");
        deleteStudent(students);
        break;
      case 5:
        print("5. Exit");
        exitProgram();
        break;
      default:
        print("Invalid choice");
    }
  }



