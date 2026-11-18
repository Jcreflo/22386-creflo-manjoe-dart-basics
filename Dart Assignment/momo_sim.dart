// Student: Creflo Johnson Manjoe
// Reg no: 22386
const String regNo = '22386';
final int d = int.parse(regNo[regNo.length - 1]);
final int t = int.parse(regNo.substring(regNo.length - 2));

// by CJM
String formatRwf(int amount) {
  // by CJM
  final isNegative = amount < 0;
  var digits = amount.abs().toString();
  String grouped = '';
  int remaining = digits.length;

  while (remaining > 0) {
    final start = remaining > 3 ? remaining - 3 : 0;
    final group = digits.substring(start, remaining);
    grouped = grouped.isEmpty ? group : '$group,$grouped';
    remaining = start;
  }

  final formatted = (isNegative ? '-' : '') + grouped;
  return amount == 0 ? '0RWF' : '$formatted RWF';
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
bool isValidPin(String pin) {
  // by CJM
  if (pin.length != 5) return false;
  if (pin == '12345') return false;

  int i = 0;
  while (i < pin.length) {
    if (pin.codeUnitAt(i) < 48 || pin.codeUnitAt(i) > 57) {
      return false;
    }
    i++;
  }

  i = 1;
  while (i < pin.length) {
    if (pin[i] != pin[0]) return true;
    i++;
  }
  return false;
}

// by CJM
int sendMoney(int balance, int amount) {
  // by CJM
  final fee = momoFee(amount);
  if (fee == -1) {
    print('Failed: invalid amount');
    return balance;
  }
  if (amount + fee > balance) {
    print('Failed: insufficient balance');
    return balance;
  }

  final newBalance = balance - amount - fee;
  print(
    'Sent ${formatRwf(amount)} (fee ${formatRwf(fee)}). '
    'New balance: ${formatRwf(newBalance)}',
  );
  return newBalance;
}

// by CJM
int buyAirtime(int balance, int amount) {
  // by CJM
  if (amount < 100 || amount > 50000) {
    print('Failed: invalid airtime amount');
    return balance;
  }
  if (amount > balance) {
    print('Failed: insufficient balance');
    return balance;
  }

  final newBalance = balance - amount;
  print(
    'Bought airtime ${formatRwf(amount)}. '
    'New balance: ${formatRwf(newBalance)}',
  );
  return newBalance;
}

// by CJM
void main() {
  print('Reg no: $regNo | D = $d | T = $t');

  print(isValidPin('12345')); // false: forbidden PIN
  print(isValidPin('77777')); // false: repeated digit
  print(isValidPin('4821')); // false: too short
  print(isValidPin('4821${d}')); // true: 48216
  print(isValidPin('48a21')); // false: not digits

  int balance = 20000 + t * 500;
  print(formatRwf(balance));

  int sendCount = 0;
  while (sendCount < 3) {
    balance = sendMoney(balance, (d + 1) * 3000);
    sendCount++;
  }
  balance = buyAirtime(balance, 1000);
  balance = sendMoney(balance, 200000);

  print('Final balance: ${formatRwf(balance)}');

  print(formatRwf(0)); // 0RWF
  print(formatRwf(-5000)); // -5,000 RWF
  print(formatRwf(1250000)); // 1,250,000 RWF
  print(isValidPin('48216')); // true
  print(isValidPin('00000')); // false
  print(isValidPin('12-45')); // false
}
