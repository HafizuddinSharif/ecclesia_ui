class Organization {
  final String id;
  final String name;

  const Organization({required this.id, required this.name});
}

List<Organization> organizations = [
  const Organization(id: '0', name: 'Edinburgh Baking Society'),
  const Organization(id: '1', name: 'Edinburgh University Sports Union (EUSU)'),
  const Organization(id: '2', name: 'Informatics 19/23'),
  const Organization(id: '3', name: 'Edinburgh University Students\' Association (EUSA)'),
];
