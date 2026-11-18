// Student: Creflo Johnson Manjoe
// Reg no: 22386
const String regNo = '22386';
final int d = int.parse(regNo[regNo.length - 1]);
final int t = int.parse(regNo.substring(regNo.length - 2));

// by CJM
int countVowels(String text) {
  // by CJM
  int count = 0;
  final lower = text.toLowerCase();
  for (int i = 0; i < lower.length; i++) {
    if ('aeiou'.contains(lower[i])) {
      count++;
    }
  }
  return count;
}

// by CJM
String initials(String fullName) {
  // by CJM
  final names = fullName.trim().split(RegExp(r'\s+'));
  if (fullName.trim().isEmpty) return '';

  String result = '';
  for (int i = 0; i < names.length; i++) {
    if (names[i].isNotEmpty) {
      result += names[i][0].toUpperCase() + '.';
    }
  }
  return result;
}

// by CJM
void drawTriangle(int height) {
  // by CJM
  if (height <= 0) return;

  int row = 1;
  while (row <= height) {
    print(' ' * (height - row) + (row.isOdd ? '*' : '#') * row);
    row++;
  }
}

// by CJM
int momoFee(int amount) {
  // by CJM
  if (amount <= 0) return -1;
  if (amount <= 1000) return 20;
  if (amount <= 10000) return 100;
  if (amount <= 150000) return 250;
  return 1500;
}

// by CJM
String maskPhone(String phone) {
  // by CJM
  if (phone.length != 10) return 'INVALID';
  return phone.substring(0, 3) +
      '*' * (phone.length - 5) +
      phone.substring(phone.length - 2);
}

// by CJM
String grade(int mark) {
  // by CJM
  if (mark >= 80) return 'A';
  if (mark >= 70) return 'B';
  if (mark >= 50) return 'C';
  return 'F';
}

// by CJM
bool isPalindrome(String word) {
  // by CJM
  final normalized = word.toLowerCase();
  int i = 0;
  while (i < normalized.length ~/ 2) {
    if (normalized[i] != normalized[normalized.length - 1 - i]) {
      return false;
    }
    i++;
  }
  return true;
}

// First-draft versions retained for the Part G debugging log.
/*
// by CJM
String gradeDraft(int mark) {
  if (mark >= 50) return 'C';
  if (mark >= 70) return 'B';
  if (mark >= 80) return 'A';
  return 'F';
}

// by CJM
bool palindromeDraft(String word) {
  int i = 0;
  while (i < word.length) {
    if (word[i] != word[word.length - i]) return false;
    i++;
  }
  return true;
}
*/

// by CJM
void main() {
  print('Reg no: $regNo | D = $d | T = $t');
  final name = 'Creflo Johnson Manjoe';
  print('$name has ${countVowels(name)} vowels');
  print(initials('Creflo Johnson Manjoe'));
  print(initials(' ana uwase '));
  print(initials(' '));

  drawTriangle(d + 3);
  drawTriangle(0);
  drawTriangle(-2);

  const phone = '0788123456';
  int i = 1;
  int totalFees = 0;
  while (i <= d + 3) {
    final amount = i * 4000 + t * 100;
    final fee = momoFee(amount);
    totalFees += fee;
    print('Receipt $i | $amount RWF | fee $fee RWF | to ${maskPhone(phone)}');
    i++;
  }
  print('Total fees: $totalFees RWF');

  print(grade(85));
  print(isPalindrome('level'));
  print(isPalindrome('Level'));
}
