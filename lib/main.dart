// ignore_for_file: depend_on_referenced_packages,, avoid_print

import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

void main() {
  runApp(const MaterialApp(home: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: false),
      home: const SfDataGridDemo(),
    );
  }
}

class SfDataGridDemo extends StatefulWidget {
  const SfDataGridDemo({super.key});

  @override
  SfDataGridDemoState createState() => SfDataGridDemoState();
}

class SfDataGridDemoState extends State<SfDataGridDemo> {
  List<Employee> _employees = <Employee>[];
  late EmployeeDataSource _employeeDataSource;

  @override
  void initState() {
    super.initState();
    _employees = getEmployeeData();
    _employeeDataSource = EmployeeDataSource(_employees);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Syncfusion Flutter DataGrid')),
      body: CheckboxTheme(
        data: CheckboxThemeData(
          fillColor: MaterialStateProperty.resolveWith((states) {
            if (!states.contains(MaterialState.selected)) {
              return Colors.transparent;
            }
            return Colors.green;
          }),
          checkColor: MaterialStateProperty.resolveWith((states) {
            if (states.contains(MaterialState.selected)) {
              return Colors.red;
            }
            return null;
          }),
        ),
        child: SfDataGrid(
            source: _employeeDataSource,
            selectionMode: SelectionMode.multiple,
            showCheckboxColumn: true,
            columns: getColumns),
      ),
    );
  }

  List<GridColumn> get getColumns {
    return <GridColumn>[
      GridColumn(
          columnName: 'ID',
          label: Container(
              padding: const EdgeInsets.all(8.0),
              alignment: Alignment.center,
              child: const Text('ID'))),
      GridColumn(
          columnName: 'Name',
          label: Container(
              padding: const EdgeInsets.all(8.0),
              alignment: Alignment.center,
              child: const Text('Name'))),
      GridColumn(
          columnName: 'Designation',
          label: Container(
              padding: const EdgeInsets.all(8.0),
              alignment: Alignment.center,
              child:
                  const Text('Designation', overflow: TextOverflow.ellipsis))),
      GridColumn(
          columnName: 'Salary',
          label: Container(
              padding: const EdgeInsets.all(8.0),
              alignment: Alignment.center,
              child: const Text('Salary'))),
    ];
  }

  List<Employee> getEmployeeData() {
    return [
      Employee(10001, 'Jack', 'Manager', 150000),
      Employee(10002, 'Perry', 'Project Lead', 80000),
      Employee(10003, 'James', 'Developer', 55000),
      Employee(10004, 'Michael', 'Designer', 39000),
      Employee(10005, 'Roland Mendel', 'Developer', 45000)
    ];
  }
}

class EmployeeDataSource extends DataGridSource {
  EmployeeDataSource(List<Employee> employees) {
    buildDataGridRows(employees);
  }

  List<DataGridRow> datagridRows = [];

  @override
  List<DataGridRow> get rows => datagridRows;

  void buildDataGridRows(List<Employee> employeesData) {
    datagridRows = employeesData
        .map<DataGridRow>((e) => DataGridRow(cells: [
              DataGridCell<int>(columnName: 'ID', value: e.id),
              DataGridCell<String>(columnName: 'Name', value: e.name),
              DataGridCell<String>(
                  columnName: 'Designation', value: e.designation),
              DataGridCell<int>(columnName: 'Salary', value: e.salary),
            ]))
        .toList();
  }

  @override
  DataGridRowAdapter buildRow(DataGridRow row) {
    return DataGridRowAdapter(
        cells: row.getCells().map<Widget>((dataGridCell) {
      return Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Text(dataGridCell.value.toString()),
      );
    }).toList());
  }
}

class Employee {
  Employee(this.id, this.name, this.designation, this.salary);
  final int id;
  final String name;
  final String designation;
  final int salary;
}
