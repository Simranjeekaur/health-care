import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class TreatmentPlanScreen extends StatefulWidget {
  final String disease;

  TreatmentPlanScreen({required this.disease});

  @override
  _TreatmentPlanScreenState createState() => _TreatmentPlanScreenState();
}

class _TreatmentPlanScreenState extends State<TreatmentPlanScreen> {
  String treatmentPlan = '';
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchDataFromAPI();
  }

  Future<void> fetchDataFromAPI() async {
    var url = Uri.parse("https://api.ai21.com/studio/v1/j2-ultra/chat");

    var payload = {
      "numResults": 1,
      "temperature": 0.7,
      "messages": [
        {
          "text": "Generate a treatment plan for a patient with ${widget.disease}.",
          "role": "user"
        }
      ],
      "system": "You are an AI assistant for healthcare. Your responses should be informative and concise."
    };

    var apiKey = "yxvekhuSAzfY85oY5SXFFwVzrP7MsqRc";
    var headers = {
      "accept": "application/json",
      "content-type": "application/json",
      "Authorization": "Bearer $apiKey"
    };

    try {
      var response = await http.post(url, headers: headers, body: jsonEncode(payload));

      if (response.statusCode == 200) {
        var responseBody = jsonDecode(response.body);
        print("Response body: $responseBody"); // Debugging statement to see the full response

        // Ensure the response structure matches what you're expecting
        if (responseBody != null && responseBody['outputs'] != null && responseBody['outputs'].isNotEmpty) {
          var treatmentPlanText = responseBody['outputs'][0]['text'];
          setState(() {
            treatmentPlan = treatmentPlanText;
            isLoading = false;
          });
        } else {
          throw Exception('Unexpected response structure: $responseBody');
        }
      } else {
        throw Exception('Failed to generate treatment plan: ${response.statusCode} ${response.body}');
      }
    } catch (e) {
      print('Error generating treatment plan: $e');
      setState(() {
        isLoading = false;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to generate treatment plan. Please try again later.')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Treatment Plan'),
        backgroundColor: Colors.teal,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: isLoading
            ? Center(child: CircularProgressIndicator())
            : SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: treatmentPlan.split('\n').map((line) {
              // Customize each line of the treatment plan
              if (line.contains('Step') || line.contains('step')) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Text(
                    line,
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.teal,
                    ),
                  ),
                );
              } else if (line.startsWith('- ')) {
                return Padding(
                  padding: const EdgeInsets.only(left: 16.0, bottom: 4.0),
                  child: Text(
                    line,
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                );
              } else {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4.0),
                  child: Text(
                    line,
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                );
              }
            }).toList(),
          ),
        ),
      ),
    );
  }
}
