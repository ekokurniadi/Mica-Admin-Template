import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mica/common/constants/constant.dart';
import 'package:mica/common/styles/app_color.styles.dart';
import 'package:mica/common/styles/app_text.styles.dart';
import 'package:mica/components/button/small_simple_button.dart';
import 'package:responsive_table/responsive_table.dart';

class TableProduct extends StatefulWidget {
  const TableProduct({Key? key}) : super(key: key);

  @override
  State<TableProduct> createState() => _TableProductState();
}

class _TableProductState extends State<TableProduct> {
  late List<DatatableHeader> _headers;

  final List<int> _perPages = [10, 20, 50, 100];
  int _total = 100;
  int? _currentPerPage = 10;
  List<bool>? _expanded;
  String? _searchKey = "name";

  int _currentPage = 1;
  final List<Map<String, dynamic>> _sourceOriginal = [];
  List<Map<String, dynamic>> _sourceFiltered = [];
  List<Map<String, dynamic>> _source = [];
  List<Map<String, dynamic>> _selecteds = [];

  String? _sortColumn;
  bool _sortAscending = true;
  bool _isLoading = true;
  var random = Random();

  List<Map<String, dynamic>> _generateData({int n = 100}) {
    final List source = List.filled(n, Random.secure());
    List<Map<String, dynamic>> temps = [];
    var i = 1;

    for (var _ in source) {
      temps.add({
        "id": i,
        "sku": "${i}000$i",
        "name": "Product $i",
        "price": i * 10.00,
        "in_stock": "${i}0",
      });
      i++;
    }
    return temps;
  }

  _initializeData() async {
    _mockPullData();
  }

  _mockPullData() async {
    _expanded = List.generate(_currentPerPage!, (index) => false);

    setState(() => _isLoading = true);
    Future.delayed(const Duration(seconds: 3)).then((value) {
      _sourceOriginal.clear();
      _sourceOriginal.addAll(_generateData(n: random.nextInt(10000)));
      _sourceFiltered = _sourceOriginal;
      _total = _sourceFiltered.length;
      _source = _sourceFiltered.getRange(0, _currentPerPage!).toList();
      setState(() => _isLoading = false);
    });
  }

  _resetData({start = 0}) async {
    setState(() => _isLoading = true);
    var expandedLen =
        _total - start < _currentPerPage! ? _total - start : _currentPerPage;
    Future.delayed(const Duration(seconds: 0)).then((value) {
      _expanded = List.generate(expandedLen as int, (index) => false);
      _source.clear();
      _source = _sourceFiltered.getRange(start, start + expandedLen).toList();
      setState(() => _isLoading = false);
    });
  }

  _filterData(value) {
    setState(() => _isLoading = true);

    try {
      if (value == "" || value == null) {
        _sourceFiltered = _sourceOriginal;
      } else {
        _sourceFiltered = _sourceOriginal
            .where((data) => data[_searchKey!]
                .toString()
                .toLowerCase()
                .contains(value.toString().toLowerCase()))
            .toList();
      }

      _total = _sourceFiltered.length;
      var rangeTop = _total < _currentPerPage! ? _total : _currentPerPage!;
      _expanded = List.generate(rangeTop, (index) => false);
      _source = _sourceFiltered.getRange(0, rangeTop).toList();
    } catch (e) {
      e;
    }
    setState(() => _isLoading = false);
  }

  @override
  void initState() {
    super.initState();
    _headers = [
      DatatableHeader(
          text: "ID",
          value: "id",
          show: true,
          sortable: true,
          textAlign: TextAlign.center),
      DatatableHeader(
        text: "Name",
        value: "name",
        show: true,
        sortable: true,
        editable: true,
        textAlign: TextAlign.left,
      ),
      DatatableHeader(
          text: "SKU",
          value: "sku",
          show: true,
          sortable: true,
          textAlign: TextAlign.center),
      DatatableHeader(
          text: "Price",
          value: "price",
          show: true,
          sortable: true,
          textAlign: TextAlign.center),
      DatatableHeader(
          text: "In Stock",
          value: "in_stock",
          show: true,
          sortable: true,
          textAlign: TextAlign.center),
      DatatableHeader(
        text: "Action",
        value: "id",
        show: true,
        sortable: true,
        textAlign: TextAlign.center,
        sourceBuilder: (value, row) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              PopupMenuButton(
                tooltip: 'Show Action',
                icon: const Icon(Icons.more_vert),
                position: PopupMenuPosition.under,
                itemBuilder: (context) {
                  return [
                    PopupMenuItem(
                      onTap: () {
                        if (kDebugMode) {
                          print(row['id']);
                        }
                      },
                      child: Row(
                        children: [
                          SmallSimpleButton(
                            iconColor: AppColors.blue,
                            onPress: () {},
                            icon: Icons.remove_red_eye_outlined,
                          ),
                          Text(
                            'View',
                            style: AppTextStyle.f14W400BlackText,
                          ),
                        ],
                      ),
                    ),
                    PopupMenuItem(
                      onTap: () {
                        if (kDebugMode) {
                          print(row['id']);
                        }
                      },
                      child: Row(
                        children: [
                          SmallSimpleButton(
                            iconColor: AppColors.yellow,
                            onPress: () {},
                            icon: Icons.edit,
                          ),
                          Text(
                            'Edit',
                            style: AppTextStyle.f14W400BlackText,
                          ),
                        ],
                      ),
                    ),
                    PopupMenuItem(
                      onTap: () {
                        if (kDebugMode) {
                          print(row['id']);
                        }
                      },
                      child: Row(
                        children: [
                          SmallSimpleButton(
                            iconColor: AppColors.purple,
                            onPress: () {},
                            icon: Icons.delete,
                          ),
                          Text(
                            'Delete',
                            style: AppTextStyle.f14W400BlackText,
                          ),
                        ],
                      ),
                    ),
                  ];
                },
              )
            ],
          );
        },
      ),
    ];

    _initializeData();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(defaultPadding),
      decoration: BoxDecoration(
        color: AppColors.primaryColor,
        borderRadius: defaultRadius,
      ),
      child: ResponsiveDatatable(
        rowTextStyle: AppTextStyle.f14W400BlackText,
        headerTextStyle: AppTextStyle.f14W700BlackBold,
        title: Expanded(
          flex: 3,
          child: Text(
            'Products',
            style: AppTextStyle.f14W700BlackBold,
          ),
        ),
        actions: [
          Expanded(
            child: TextField(
              style: AppTextStyle.f12W400Black,
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(horizontal: 16),
                hintText: 'Search',
                hintStyle: AppTextStyle.f12W400Black,
                border: OutlineInputBorder(
                  borderRadius: defaultRadius,
                  borderSide: BorderSide(
                    color: AppColors.borderColor,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: defaultRadius,
                  borderSide: BorderSide(
                    color: AppColors.borderColor,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: defaultRadius,
                  borderSide: BorderSide(
                    color: AppColors.borderColor,
                  ),
                ),
              ),
              onChanged: (value) {
                _filterData(value);
              },
            ),
          ),
        ],
        headers: _headers,
        source: _source,
        selecteds: _selecteds,
        showSelect: false,
        autoHeight: true,
        isExpandRows: true,
        dropContainer: (data) {
          if (int.tryParse(data['id'].toString())!.isEven) {
            return const Text("is Even");
          }
          return _DropDownContainer(data: data);
        },
        onChangedRow: (value, header) {
          /// print(value);
          /// print(header);
        },
        onSubmittedRow: (value, header) {
          /// print(value);
          /// print(header);
        },
        onTabRow: (data) {},
        onSort: (value) {
          setState(() => _isLoading = true);

          setState(() {
            _sortColumn = value;
            _sortAscending = !_sortAscending;
            if (_sortAscending) {
              _sourceFiltered.sort(
                  (a, b) => b["$_sortColumn"].compareTo(a["$_sortColumn"]));
            } else {
              _sourceFiltered.sort(
                  (a, b) => a["$_sortColumn"].compareTo(b["$_sortColumn"]));
            }
            var rangeTop = _currentPerPage! < _sourceFiltered.length
                ? _currentPerPage!
                : _sourceFiltered.length;
            _source = _sourceFiltered.getRange(0, rangeTop).toList();
            _searchKey = value;

            _isLoading = false;
          });
        },
        expanded: _expanded,
        sortAscending: _sortAscending,
        sortColumn: _sortColumn,
        isLoading: _isLoading,
        onSelect: (value, item) {
          if (value!) {
            setState(() => _selecteds.add(item));
          } else {
            setState(() => _selecteds.removeAt(_selecteds.indexOf(item)));
          }
        },
        onSelectAll: (value) {
          if (value!) {
            setState(() =>
                _selecteds = _source.map((entry) => entry).toList().cast());
          } else {
            setState(() => _selecteds.clear());
          }
        },
        footers: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: const Text("Rows per page:"),
          ),
          if (_perPages.isNotEmpty)
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: DropdownButton<int>(
                value: _currentPerPage,
                items: _perPages
                    .map((e) => DropdownMenuItem<int>(
                          value: e,
                          child: Text("$e"),
                        ))
                    .toList(),
                onChanged: (dynamic value) {
                  setState(() {
                    _currentPerPage = value;
                    _currentPage = 1;
                    _resetData();
                  });
                },
                isExpanded: false,
              ),
            ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Text("$_currentPage - $_currentPerPage of $_total"),
          ),
          IconButton(
            icon: const Icon(
              Icons.arrow_back_ios,
              size: 16,
            ),
            onPressed: _currentPage == 1
                ? null
                : () {
                    var nextSet = _currentPage - _currentPerPage!;
                    setState(() {
                      _currentPage = nextSet > 1 ? nextSet : 1;
                      _resetData(start: _currentPage - 1);
                    });
                  },
            padding: const EdgeInsets.symmetric(horizontal: 15),
          ),
          IconButton(
            icon: const Icon(Icons.arrow_forward_ios, size: 16),
            onPressed: _currentPage + _currentPerPage! - 1 > _total
                ? null
                : () {
                    var nextSet = _currentPage + _currentPerPage!;

                    setState(() {
                      _currentPage = nextSet < _total
                          ? nextSet
                          : _total - _currentPerPage!;
                      _resetData(start: nextSet - 1);
                    });
                  },
            padding: const EdgeInsets.symmetric(horizontal: 15),
          )
        ],
      ),
    );
  }
}

class _DropDownContainer extends StatelessWidget {
  final Map<String, dynamic> data;
  const _DropDownContainer({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> children = data.entries.map<Widget>((entry) {
      Widget w = Row(
        children: [
          Text(entry.key.toString()),
          const Spacer(),
          Text(entry.value.toString()),
        ],
      );
      return w;
    }).toList();

    return Column(
      children: children,
    );
  }
}




// class TableProduct extends StatelessWidget {
//   const TableProduct({
//     Key? key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: BoxDecoration(
//         borderRadius: defaultRadius,
//         color: AppColors.primaryColor,
//       ),
//       padding: const EdgeInsets.all(defaultPadding),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(
//             "Recent Files",
//             style: Theme.of(context).textTheme.subtitle1,
//           ),
//           SizedBox(
//             width: Responsive.isMobile(context)
//                 ? MediaQuery.of(context).size.width - 32
//                 : double.infinity,
//             child: DataTable(
//               columnSpacing: 3,
//               columns: [
//                 const DataColumn(
//                   label: Text('ID'),
//                 ),
//                 const DataColumn(
//                   label: Text('Name'),
//                 ),
//                 const DataColumn(
//                   label: Text('Code'),
//                 ),
//                 const DataColumn(
//                   label: Text('Quantity'),
//                 ),
//                 const DataColumn(
//                   label: Text('Amount'),
//                 ),
//                 DataColumn(
//                   label: Expanded(
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: const [
//                         Text(
//                           'Action',
//                           textAlign: TextAlign.center,
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ],
//               rows: [
//                 DataRow(
//                   cells: [
//                     const DataCell(Text('1')),
//                     const DataCell(Text('Arshik')),
//                     const DataCell(Text('5644645')),
//                     const DataCell(Text(
//                       '3',
//                       textAlign: TextAlign.center,
//                     )),
//                     const DataCell(Text('265\$')),
//                     DataCell(
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           SmallSimpleButton(
//                             iconColor: AppColors.blue,
//                             onPress: () {},
//                             icon: Icons.remove_red_eye_outlined,
//                           ),
//                           SmallSimpleButton(
//                             iconColor: Colors.yellow,
//                             onPress: () {},
//                             icon: Icons.edit,
//                           ),
//                           SmallSimpleButton(
//                             iconColor: Colors.red,
//                             onPress: () {},
//                             icon: Icons.delete_outlined,
//                           ),
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//                 DataRow(
//                   cells: [
//                     const DataCell(Text('1')),
//                     const DataCell(Text('Arshik')),
//                     const DataCell(Text('5644645')),
//                     const DataCell(Text(
//                       '3',
//                       textAlign: TextAlign.center,
//                     )),
//                     const DataCell(Text('265\$')),
//                     DataCell(
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           SmallSimpleButton(
//                             iconColor: AppColors.blue,
//                             onPress: () {},
//                             icon: Icons.remove_red_eye_outlined,
//                           ),
//                           SmallSimpleButton(
//                             iconColor: Colors.yellow,
//                             onPress: () {},
//                             icon: Icons.edit,
//                           ),
//                           SmallSimpleButton(
//                             iconColor: Colors.red,
//                             onPress: () {},
//                             icon: Icons.delete_outlined,
//                           ),
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//                 DataRow(
//                   cells: [
//                     const DataCell(Text('1')),
//                     const DataCell(Text('Arshik')),
//                     const DataCell(Text('5644645')),
//                     const DataCell(Text(
//                       '3',
//                       textAlign: TextAlign.center,
//                     )),
//                     const DataCell(Text('265\$')),
//                     DataCell(
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           SmallSimpleButton(
//                             iconColor: AppColors.blue,
//                             onPress: () {},
//                             icon: Icons.remove_red_eye_outlined,
//                           ),
//                           SmallSimpleButton(
//                             iconColor: Colors.yellow,
//                             onPress: () {},
//                             icon: Icons.edit,
//                           ),
//                           SmallSimpleButton(
//                             iconColor: Colors.red,
//                             onPress: () {},
//                             icon: Icons.delete_outlined,
//                           ),
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//                 DataRow(
//                   cells: [
//                     const DataCell(Text('1')),
//                     const DataCell(Text('Arshik')),
//                     const DataCell(Text('5644645')),
//                     const DataCell(Text(
//                       '3',
//                       textAlign: TextAlign.center,
//                     )),
//                     const DataCell(Text('265\$')),
//                     DataCell(
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           SmallSimpleButton(
//                             iconColor: AppColors.blue,
//                             onPress: () {},
//                             icon: Icons.remove_red_eye_outlined,
//                           ),
//                           SmallSimpleButton(
//                             iconColor: Colors.yellow,
//                             onPress: () {},
//                             icon: Icons.edit,
//                           ),
//                           SmallSimpleButton(
//                             iconColor: Colors.red,
//                             onPress: () {},
//                             icon: Icons.delete_outlined,
//                           ),
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//                 DataRow(
//                   cells: [
//                     const DataCell(Text('1')),
//                     const DataCell(Text('Arshik')),
//                     const DataCell(Text('5644645')),
//                     const DataCell(Text(
//                       '3',
//                       textAlign: TextAlign.center,
//                     )),
//                     const DataCell(Text('265\$')),
//                     DataCell(
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           SmallSimpleButton(
//                             iconColor: AppColors.blue,
//                             onPress: () {},
//                             icon: Icons.remove_red_eye_outlined,
//                           ),
//                           SmallSimpleButton(
//                             iconColor: Colors.yellow,
//                             onPress: () {},
//                             icon: Icons.edit,
//                           ),
//                           SmallSimpleButton(
//                             iconColor: Colors.red,
//                             onPress: () {},
//                             icon: Icons.delete_outlined,
//                           ),
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// DataRow recentFileDataRow(RecentFile fileInfo) {
//   return DataRow(
//     cells: [
//       DataCell(
//         Row(
//           children: [
//             SvgPicture.asset(
//               fileInfo.icon!,
//               height: 30,
//               width: 30,
//             ),
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
//               child: Text(fileInfo.title!),
//             ),
//           ],
//         ),
//       ),
//       DataCell(Text(fileInfo.date!)),
//       DataCell(Text(fileInfo.size!)),
//     ],
//   );
// }

// class RecentFile {
//   final String? icon, title, date, size;

//   RecentFile({this.icon, this.title, this.date, this.size});
// }

// List demoRecentFiles = [
//   RecentFile(
//     icon: "assets/icons/xd_file.svg",
//     title: "XD File",
//     date: "01-03-2021",
//     size: "3.5mb",
//   ),
//   RecentFile(
//     icon: "assets/icons/Figma_file.svg",
//     title: "Figma File",
//     date: "27-02-2021",
//     size: "19.0mb",
//   ),
//   RecentFile(
//     icon: "assets/icons/doc_file.svg",
//     title: "Document",
//     date: "23-02-2021",
//     size: "32.5mb",
//   ),
//   RecentFile(
//     icon: "assets/icons/sound_file.svg",
//     title: "Sound File",
//     date: "21-02-2021",
//     size: "3.5mb",
//   ),
//   RecentFile(
//     icon: "assets/icons/media_file.svg",
//     title: "Media File",
//     date: "23-02-2021",
//     size: "2.5gb",
//   ),
//   RecentFile(
//     icon: "assets/icons/pdf_file.svg",
//     title: "Sales PDF",
//     date: "25-02-2021",
//     size: "3.5mb",
//   ),
//   RecentFile(
//     icon: "assets/icons/excle_file.svg",
//     title: "Excel File",
//     date: "25-02-2021",
//     size: "34.5mb",
//   ),
// ];
