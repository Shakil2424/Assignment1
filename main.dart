
abstract class Role {
  void displayRole();
}

class Person implements Role {

  String name;
  int age;
  String address;

  Person(this.name, this.age, this.address);

  String getName() => name;
  int getAge() => age;
  String getAddress() => address;

  @override
  void displayRole() {
    print('Role: Person');
  }
}

class Student extends Person {

  List<int> courseScores = [];

  Student(String name, int age, String address)
      : super(name, age, address);

  double calculateAverageScore() {
    if (courseScores.isEmpty) {
      return 0.0;
    }

    var totalScore = 0;
    for (var score in courseScores) {
      totalScore += score;
    }

    return totalScore / courseScores.length;
  }

  @override
  void displayRole() {
    print('Role: Student');
  }
}

class Teacher extends Person {
  List<String> coursesTaught = [];

  Teacher(String name, int age, String address)
      : super(name, age, address);

  void displayCoursesTaught() {
    if (coursesTaught.isEmpty) {
      print('This teacher has not taken any course');
    } else {
      print('Courses Taught:');
      for (var course in coursesTaught) {
        print('- $course');
      }
    }
  }

  @override
  void displayRole() {
    print('Role: Teacher');
  }
}

class StudentManagementSystem {

  static void main() {

    var student = Student('John Doe', 20, '123 Main St');
    var teacher = Teacher('Mrs. Smith', 35, '456 Oak St');

    student.courseScores = [90, 85, 82];
    teacher.coursesTaught = ['Math', 'English', 'Bangla'];

    print('\nStudent Information:');
    student.displayRole();
    print('Name: ${student.getName()}');
    print('Age: ${student.getAge()}');
    print('Address: ${student.getAddress()}');
    print('Average Score: ${student.calculateAverageScore().toStringAsFixed(1)}');

    print('\nTeacher Information:');
    teacher.displayRole();
    print('Name: ${teacher.getName()}');
    print('Age: ${teacher.getAge()}');
    print('Address: ${teacher.getAddress()}');
    teacher.displayCoursesTaught();
  }
}

void main() {

  StudentManagementSystem.main();
}
