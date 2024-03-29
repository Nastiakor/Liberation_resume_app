import 'package:flutter/material.dart';
import 'package:cv_flutter_libe/views/components/bottom_navigation_bar.dart';
import 'package:cv_flutter_libe/models/train.dart';
import 'package:cv_flutter_libe/services/train_service.dart';
import 'package:cv_flutter_libe/services/services_info.dart';
import 'package:cv_flutter_libe/models/commune_info.dart';
import 'package:intl/intl.dart';

class SncfAPI extends StatefulWidget {
  const SncfAPI({Key? key}) : super(key: key);

  @override
  _SncfAPIState createState() => _SncfAPIState();
}

class _SncfAPIState extends State<SncfAPI> {
  List<Train> trains = [];
  List<CommuneInfo> _communeInfos = [];
  CommuneInfo? _selectedDepartureCommuneInfo;
  CommuneInfo? _selectedArrivalCommuneInfo;
  late DateTime _selectedDate;
  late TimeOfDay _selectedTime;

  @override
  void initState() {
    super.initState();
    _selectedDate = DateTime.now();
    _selectedTime = TimeOfDay.now();
    _loadCommuneInfos();
  }

  _loadCommuneInfos() async {
    var communeInfos = await CommuneInfoService.fetchCommuneInfo();
    setState(() {
      _communeInfos = communeInfos;
    });
  }

  _fetchTrains() async {
    if (_selectedDepartureCommuneInfo != null &&
        _selectedArrivalCommuneInfo != null) {
      var formattedDate = _formatDate(_selectedDate);
      var formattedTime = _formatTime(_selectedTime);
      var datetime = '$formattedDate$formattedTime';
      var fetchedTrains = await TrainService.fetchTrains(
        _selectedDepartureCommuneInfo!.codeConcatene,
        _selectedArrivalCommuneInfo!.codeConcatene,
        datetime,
      );

      setState(() {
        trains = fetchedTrains;
      });
    }
  }

  String _formatDate(DateTime date) {
    return DateFormat('yyyyMMdd').format(date);
  }

  String _formatTime(TimeOfDay time) {
    final hour = time.hour.toString().padLeft(2, '0');
    final minute = time.minute.toString().padLeft(2, '0');
    return 'T$hour$minute';
  }

  Widget _buildTrainCard(Train train) {

    String correspondancesCitiesString = '';
    List<String> correspondancesCities = List<String>.from(train.correspondenceCities ?? []);

    if (correspondancesCities.isNotEmpty) {
      if (correspondancesCities.length > 1) {
        correspondancesCities = correspondancesCities.sublist(0, correspondancesCities.length - 1);
      }
      correspondancesCitiesString = correspondancesCities.join(', ');
    }

    Widget correspondancesWidget = train.numberOfCorrespondences >= 1
        ? Column(
      crossAxisAlignment: CrossAxisAlignment.start, // Alignement à gauche
      children: [
        Text(
          'Nombre de Correspondances: ${train.numberOfCorrespondences}',
          style: const TextStyle(
            color: Colors.red,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 2),
        Text(
          'via : $correspondancesCitiesString',
          style: const TextStyle(
            color: Colors.pinkAccent,
            fontSize: 16,
            fontWeight: FontWeight.normal,
          ),
        ),
      ],
    )
        : Text(
      'Trajet direct',
      style: const TextStyle(
        color: Colors.green,
        fontSize: 18,
        fontWeight: FontWeight.bold,
      ),
    );


    return Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Gare de départ: ${train.departureGare}',
            style: const TextStyle(
              color: Colors.black,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Gare d\'arrivée: ${train.arrivalGare}',
            style: const TextStyle(
              color: Colors.black,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          correspondancesWidget,
          const SizedBox(height: 16),
          Text(
            'Jour de départ: ${train.departureDay}',
            style: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            'Heure de départ: ${train.departureTime}',
            style: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Jour d\'arrivée: ${train.arrivalDay}',
            style: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            'Heure d\'arrivée: ${train.arrivalTime}',
            style: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            'Durée du trajet: ${formatDuration(train.duration)}',
            style: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Émissions de CO2: ${train.co2Emission.toStringAsFixed(2)} kg',
            style: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  String removePostalCode(String station) {
    final startIndex = station.indexOf('(');
    final endIndex = station.indexOf(')');
    if (startIndex != -1 && endIndex != -1) {
      return station.substring(0, startIndex).trim();
    }
    return station;
  }

  String formatDuration(Duration duration) {
    final hours = duration.inHours;
    final minutes = duration.inMinutes.remainder(60);
    return '${hours.toString().padLeft(2, '0')}:${minutes.toString().padLeft(2, '0')}';
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 365)),
    );
    if (pickedDate != null && pickedDate != _selectedDate) {
      setState(() {
        _selectedDate = pickedDate;
      });
    }
  }

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: _selectedTime,
    );
    if (pickedTime != null && pickedTime != _selectedTime) {
      setState(() {
        _selectedTime = pickedTime;
      });
    }
  }

  String _formatSelectedDate() {
    final day = _selectedDate.day;
    final month = _selectedDate.month;
    final year = _selectedDate.year;
    final monthName = _getMonthName(month);

    return '$day $monthName $year';
  }

  String _getMonthName(int month) {
    switch (month) {
      case 1:
        return 'janvier';
      case 2:
        return 'février';
      case 3:
        return 'mars';
      case 4:
        return 'avril';
      case 5:
        return 'mai';
      case 6:
        return 'juin';
      case 7:
        return 'juillet';
      case 8:
        return 'août';
      case 9:
        return 'septembre';
      case 10:
        return 'octobre';
      case 11:
        return 'novembre';
      case 12:
        return 'décembre';
      default:
        return '';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: SingleChildScrollView(
          child: Container(
            width: double.infinity,
            child: Column(
              children: [
                const SizedBox(height: 100),
                Container(
                  child: Image.asset('img/entetesncf.png'),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Ville de départ :",
                            style: TextStyle(color: Colors.white, fontSize: 18),
                            textAlign: TextAlign.start,
                          ),
                        ],
                      ),
                    const SizedBox(height: 8),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.5,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Autocomplete<CommuneInfo>(
                          optionsBuilder: (TextEditingValue textEditingValue) {
                            if (textEditingValue.text.isEmpty) {
                              return const Iterable<CommuneInfo>.empty();
                            }
                            final query = textEditingValue.text.toLowerCase();
                            return _communeInfos.where((CommuneInfo option) {
                              return option.aliasLibelleNonContraint
                                  .toLowerCase()
                                  .contains(query);
                            });
                          },
                          displayStringForOption: (CommuneInfo option) =>
                              option.aliasLibelleNonContraint,
                          onSelected: (CommuneInfo? selection) {
                            setState(() {
                              _selectedDepartureCommuneInfo = selection;
                            });
                          },
                          fieldViewBuilder: (
                            BuildContext context,
                            TextEditingController textEditingController,
                            FocusNode focusNode,
                            VoidCallback onFieldSubmitted,
                            ) {
                          return TextField(
                            controller: textEditingController,
                            focusNode: focusNode,
                            onSubmitted: (String value) {
                            onFieldSubmitted();
                          },
                          decoration: InputDecoration(
                          contentPadding: const EdgeInsets.only(left: 16.0), // Marge à gauche à l'intérieur du champ
                          border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                          ),
                          ),
                          );
                          },

                        ),
                      ),
                      const SizedBox(height: 16),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Ville d'arrivée :",
                                style: TextStyle(color: Colors.white, fontSize: 18),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                          const SizedBox(height: 8),
                          Container(
                            width: MediaQuery.of(context).size.width * 0.5,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Autocomplete<CommuneInfo>(
                              optionsBuilder: (TextEditingValue textEditingValue) {
                                if (textEditingValue.text.isEmpty) {
                                  return const Iterable<CommuneInfo>.empty();
                                }
                                final query = textEditingValue.text.toLowerCase();
                                return _communeInfos.where((CommuneInfo option) {
                                  return option.aliasLibelleNonContraint
                                      .toLowerCase()
                                      .contains(query);
                                },
                                );
                              },
                              displayStringForOption: (CommuneInfo option) =>
                              option.aliasLibelleNonContraint,
                              onSelected: (CommuneInfo? selection) {
                                setState(() {
                                  _selectedArrivalCommuneInfo = selection;
                                });
                              },
                              fieldViewBuilder: (
                                  BuildContext context,
                                  TextEditingController textEditingController,
                                  FocusNode focusNode,
                                  VoidCallback onFieldSubmitted,
                                  ) {
                                return TextField(
                                  controller: textEditingController,
                                  focusNode: focusNode,
                                  onSubmitted: (String value) {
                                    onFieldSubmitted();
                                  },
                                  decoration: InputDecoration(
                                    contentPadding: const EdgeInsets.only(left: 16.0), // Marge à gauche à l'intérieur du champ
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'Date sélectionnée : ${_formatSelectedDate()}',
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                            ),
                          ),
              const SizedBox(height: 4),
                          ElevatedButton(
                            onPressed: () => _selectDate(context),
                            style: ElevatedButton.styleFrom(
                              primary: Colors.red,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                              padding: const EdgeInsets.symmetric(
                                vertical: 12,
                                horizontal: 24,
                              ),
                            ),
                            child: const Text(
                              'Sélectionner une date',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Heure sélectionnée : ${_selectedTime.format(context)}',
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                            ),
                          ),
                          const SizedBox(height: 4),
                          ElevatedButton(
                            onPressed: () => _selectTime(context),
                            style: ElevatedButton.styleFrom(
                              primary: Colors.blue,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                              padding: const EdgeInsets.symmetric(
                                vertical: 12,
                                horizontal: 24,
                              ),
                            ),
                            child: const Text(
                              'Sélectionner une heure',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      ElevatedButton(
                        onPressed: _fetchTrains,
                        style: ElevatedButton.styleFrom(
                          primary: Colors.green,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          padding: const EdgeInsets.symmetric(
                            vertical: 12,
                            horizontal: 24,
                          ),
                        ),
                        child: const Text(
                          'Rechercher',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                trains.isNotEmpty
                    ? ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: trains.length,
                        itemBuilder: (context, index) {
                          final train = trains[index];
                          return _buildTrainCard(train);
                        },
                      )
                    : const Center(
                        child: Text(
                          'Aucun train trouvé',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                          ),
                        ),
                      ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: MyBottomHomeNavigationBar(currentIndex: 1),
      ),
    );
  }
}
