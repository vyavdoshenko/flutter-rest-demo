import 'package:flutter/material.dart';
import 'package:flutter_simple_treeview/flutter_simple_treeview.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:provider/provider.dart';

import '../generated/l10n.dart';
import '../model/data.dart';
import '../model/spinner.dart';
import '../utils.dart';

class Presenter extends StatelessWidget {
  static const String navigatorId = 'presenter_screen';

  final TreeController _treeController =
      TreeController(allNodesExpanded: false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        title: Text(S.current.presenter_title),
      ),
      body: ModalProgressHUD(
        inAsyncCall: Provider.of<Spinner>(context).spinnerState,
        child: Container(
          decoration: buildGradientBoxDecoration(context),
          child: Row(
            children: [
              Expanded(
                child: Align(
                  alignment: Alignment.topLeft,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Column(
                      children: [
                        Expanded(
                          child: Align(
                            alignment: Alignment.topLeft,
                            child: SingleChildScrollView(
                              child: _buildTree(
                                  Provider.of<Data>(context, listen: false)
                                      .jsonData),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTree(jsonData) {
    try {
      return TreeView(
        nodes: _buildNodes(jsonData),
        treeController: _treeController,
      );
    } on FormatException catch (e) {
      return Text(e.message);
    }
  }

  List<TreeNode> _buildNodes(dynamic parsedJson) {
    if (parsedJson is Map<String, dynamic>) {
      return parsedJson.keys
          .map(
            (k) => _buildNode('$k', parsedJson[k]),
          )
          .toList();
    }

    if (parsedJson is List<dynamic>) {
      return parsedJson
          .asMap()
          .map(
            (i, element) => MapEntry(
              i,
              _buildNode('[$i]', element),
            ),
          )
          .values
          .toList();
    }

    return [TreeNode(content: Text(parsedJson.toString()))];
  }

  TreeNode _buildNode(String prefix, dynamic element) {
    if (element is List<dynamic> || element is Map<String, dynamic>) {
      return TreeNode(
        content: Text(prefix),
        children: _buildNodes(element),
      );
    }

    return TreeNode(
      content: Text(
        '$prefix: $element',
      ),
    );
  }
}
