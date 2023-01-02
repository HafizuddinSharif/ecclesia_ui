import 'package:ecclesia_ui/data/models/election_overview_model.dart';

class ElectionCardModel {
  final String electionTitle;
  final String electionDescription;
  final String electionOrganization;
  final ElectionStatusEnum status;

  ElectionCardModel(this.electionTitle, this.electionDescription, this.electionOrganization, this.status);
}
