# How to customize the color of the checkbox in Flutter DataGrid.

In this article, you can learn about how to customize the color of the checkbox in Flutter DataGrid.

Initialize the [SfDataGrid](https://pub.dev/documentation/syncfusion_flutter_datagrid/latest/datagrid/SfDataGrid-class.html) widget with all the required properties. You can customize the fillColor and checkColor of the Checkbox by using the [CheckboxTheme](https://api.flutter.dev/flutter/material/CheckboxTheme-class.html) widget. To achieve this, wrap the DataGrid as a child of the CheckboxTheme widget. Set the desired values for fillColor and checkColor in the [CheckboxThemeData](https://api.flutter.dev/flutter/material/CheckboxThemeData-class.html) class based on the MaterialStateProperty, and then assign the CheckboxThemeData to the [data](https://api.flutter.dev/flutter/material/CheckboxTheme/data.html) property of the CheckboxTheme.

``` dart
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
```
Download the example from [GitHub](https://github.com/SyncfusionExamples/How-to-customize-the-color-of-the-checkbox-in-Flutter-DataGrid)