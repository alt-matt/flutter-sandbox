import 'package:flutter/material.dart';
import 'package:fsa_viewer_flutter_application/api/apiService.dart';

class EstablishmentList extends StatefulWidget {
  const EstablishmentList({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<EstablishmentList> {
  late FsaApiModel? _establishmentModel = FsaApiModel();
  @override
  void initState() {
    super.initState();
    _getData();
  }

  void _getData() async {
    _establishmentModel = (await ApiService().getEstablishments());
    Future.delayed(const Duration(seconds: 1)).then((value) => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('REST API Example'),
      ),
      body: _establishmentModel == null || _establishmentModel!.establishments.isEmpty
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: _establishmentModel!.establishments.length,
              itemBuilder: (context, index) {
                return Card(
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(_establishmentModel!.establishments[index].id.toString()),
                        ],
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text('Row')
                          // Text(_establishmentModel![index].email),
                          // Text(_establishmentModel![index].website),
                        ],
                      ),
                    ],
                  ),
                );
              },
            ),
    );
  }
}