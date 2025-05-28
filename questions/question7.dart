void main() {
  List data = [
    1,
    'ahmed',
    2,
    'elbelehy',
    3,
    'mohammed',
    4,
    'alaa',
    5,
    'yasser'
  ];

  print(data);

  data.add('malak');
  print(data);

  data.remove('alaa');
  print(data);

  data[1] = 'mohamed';
  print(data);

  data.add([10,9,8]);
  print(data);

  data[10].sort();
  print(data);

}
