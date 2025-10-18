import 'package:flutter/material.dart';

class CustomDataTable extends StatefulWidget {
  final List<String> headers;
  final List<List<Widget>> rows;
  final List<String> sortable;

  const CustomDataTable({
    super.key,
    required this.headers,
    required this.rows,
    this.sortable = const [],
  });

  @override
  State<CustomDataTable> createState() => _CustomDataTableState();
}

class _CustomDataTableState extends State<CustomDataTable> {
  late List<List<Widget>> _sortedRows;
  int _sortColumnIndex = -1;
  bool _isAscending = true;

  @override
  void initState() {
    super.initState();
    _sortedRows = List.from(widget.rows);
  }

  void _onSort(int columnIndex, bool ascending) {
    setState(() {
      _sortColumnIndex = columnIndex;
      _isAscending = ascending;

      _sortedRows.sort((a, b) {
        final cellA = a[columnIndex];
        final cellB = b[columnIndex];
        final valA = (cellA is Text) ? cellA.data ?? '' : cellA.toString();
        final valB = (cellB is Text) ? cellB.data ?? '' : cellB.toString();
        final comparison = valA.toLowerCase().compareTo(valB.toLowerCase());
        return ascending ? comparison : -comparison;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_sortedRows.isEmpty) {
      return const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.warning_amber_rounded, color: Colors.amber, size: 40),
            SizedBox(height: 8),
            Text(
              'Tidak ada data, yuk isi dulu!',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      );
    }

    return DataTable(
      sortColumnIndex: _sortColumnIndex == -1 ? null : _sortColumnIndex,
      sortAscending: _isAscending,
      columns: List.generate(widget.headers.length, (index) {
        final header = widget.headers[index];
        final isSortable = widget.sortable.map((s) => s.toLowerCase()).contains(header.toLowerCase());
        return DataColumn(
          label: Text(header, style: const TextStyle(fontWeight: FontWeight.bold)),
          onSort: isSortable ? (columnIndex, ascending) => _onSort(columnIndex, ascending) : null,
        );
      }),
      rows: _sortedRows.map((row) => DataRow(cells: row.map((cell) => DataCell(cell)).toList())).toList(),
    );
  }
}