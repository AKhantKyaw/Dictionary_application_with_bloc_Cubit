import 'package:dictionaryappwith_bloc/Component/textfileconstant.dart';
import 'package:dictionaryappwith_bloc/Controller/BlocproviderServices/Autofill_bloc_Cubit_provider/cubit/autocompletecubit_cubit.dart';
import 'package:dictionaryappwith_bloc/Model/datamuse_model.dart';
import 'package:dictionaryappwith_bloc/View/Dictionaryresult/dictionary_resultscreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _DictionaryScreenState();
}

class _DictionaryScreenState extends State<SearchScreen> {
  TextEditingController editingController = TextEditingController();
  @override
  void dispose() {
    editingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color(0xfffb7883),
        bottom: PreferredSize(
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                    padding: const EdgeInsets.only(top: 5, left: 15),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white),
                    height: 55,
                    width: MediaQuery.of(context).size.width / 1.2,
                    child: TextFormField(
                      cursorColor: Colors.red,
                      controller: editingController,
                      decoration: const InputDecoration(
                          border: InputBorder.none, hintText: 'Search words'),
                      onChanged: (val) {
                        BlocProvider.of<AutocompleteCubit>(context)
                            .getdata(val);
                      },
                    )),
              ),
              IconButton(
                  onPressed: () {
                    editingController.clear();
                  },
                  icon: const Icon(
                    Icons.close,
                    color: Colors.white,
                    size: 32,
                  ))
            ],
          ),
          preferredSize: const Size.fromHeight(50),
        ),
      ),
      body: BlocBuilder<AutocompleteCubit, AutocompletecubitState>(
          builder: (context, state) {
        if (state is AutocompleteSuccess) {
          final List<AutoCompleteModel> userInputquery = state.userInputword;
          return ListView.builder(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            itemCount: state.userInputword.length,
            itemBuilder: (context, index) => ListTile(
              onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => DictionaryScreen(
                          userquery: userInputquery[index].word))),
              title: Text(
                userInputquery[index].word,
                style: Styleconstant.namestyle,
              ),
            ),
          );
        } else if (state is Autocompletefail) {
          return Center(child: Text(state.error));
        }
        return  Center(child: Lottie.asset('images/77218-search-imm.json'));
      }),
    );
  }
}
