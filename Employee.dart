import 'dart:io';

class Employee {
  int id;
  String fullName;
  DateTime birthday;
  String address;
  String phoneNumber;

  Employee({
    required this.id,
    required this.fullName,
    required this.birthday,
    required this.address,
    required this.phoneNumber,
  });
}

void main() {
  List<Employee> employees = [];

  while (true) {
    print("Choose an operation:");
    print("1. Add Employee");
    print("2. Get All Employees");
    print("3. Update Employee");
    print("4. Exit");
    String choice = stdin.readLineSync()!;

    switch (choice) {
      case '1':
        // Adding an employee
        Employee newEmployee = addEmployee();
        employees.add(newEmployee);
        break;
      case '2':
        // Getting all employees
        getAllEmployees(employees);
        break;
      case '3':
        // Updating an employee
        updateEmployee(employees);
        break;
      case '4':
        // Exit the program
        exit(0);
        break;
      default:
        print("Invalid choice. Please try again.");
        break;
    }
  }
}

Employee addEmployee() {
  print("Enter employee information:");
  print("Employee ID:");
  int id = int.parse(stdin.readLineSync()!);
  print("Full Name:");
  String fullName = stdin.readLineSync()!;
  print("Birthday (YYYY-MM-DD):");
  String birthdayStr = stdin.readLineSync()!;
  DateTime birthday = DateTime.parse(birthdayStr);
  print("Address:");
  String address = stdin.readLineSync()!;
  print("Phone Number:");
  String phoneNumber = stdin.readLineSync()!;

  return Employee(
    id: id,
    fullName: fullName,
    birthday: birthday,
    address: address,
    phoneNumber: phoneNumber,
  );
}

void getAllEmployees(List<Employee> employees) {
  if (employees.isEmpty) {
    print("No employees in the list.");
  } else {
    print("List of employees:");
    for (var employee in employees) {
      print("Employee ID: ${employee.id}");
      print("Full Name: ${employee.fullName}");
      print("Birthday: ${employee.birthday}");
      print("Address: ${employee.address}");
      print("Phone Number: ${employee.phoneNumber}");
      print("----------");
    }
  }
}

void updateEmployee(List<Employee> employees) {
  if (employees.isEmpty) {
    print("No employees in the list to update.");
  } else {
    print("Enter the ID of the employee to update:");
    int idToUpdate = int.parse(stdin.readLineSync()!);

    int index = employees.indexWhere((e) => e.id == idToUpdate);

    if (index == -1) {
      print("Employee with ID $idToUpdate not found.");
    } else {
      print("Enter updated information for employee with ID $idToUpdate:");
      Employee updatedEmployee = addEmployee();
      employees[index] = updatedEmployee;
      print("Employee with ID $idToUpdate has been updated.");
    }
  }
}
