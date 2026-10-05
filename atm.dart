import 'dart:io';

// CATATAN: dua nilai ini tidak bisa dibaca dari atm.exe (tersimpan di kode mesin).
// Samakan dengan yang ada di program aslinya.
const int pinBenar = 1234;
int saldo = 2000000;

void main() {
  print('==========================================');
  print('BANK SERBA ADA');
  print('==========================================');
  if (login()) {
    tampilmenu();
  }
}

bool login() {
  while (true) {
    stdout.write('Masukan Pin Anda : ');
    int? pin = int.tryParse(stdin.readLineSync() ?? '');
    if (pin == pinBenar) {
      print('Selamat Datang');
      return true;
    }
    print('Pin Anda Salah');
  }
}

void tampilmenu() {
  while (true) {
    print('1. Cek Saldo');
    print('2. Setor Tunai');
    print('3. Tarik Tunai');
    stdout.write('Pilih Menu (1/2/3) : ');
    int? menu = int.tryParse(stdin.readLineSync() ?? '');
    if (menu == 1) {
      cek();
    } else if (menu == 2) {
      setor();
    } else if (menu == 3) {
      tarik();
    }
  }
}

void cek() {
  print('SALDO SAAT INI : $saldo');
}

void setor() {
  stdout.write('Jumlah yang disetor : ');
  int jumlah = int.parse(stdin.readLineSync()!);
  saldo += jumlah;
}

void tarik() {
  stdout.write('Jumlah yang ditarik : ');
  int nominal = int.parse(stdin.readLineSync()!);
  print(' 1. pecahan 50.000');
  print(' 2. pecahan 100.000');
  stdout.write('Pilih pecahan (1/2) : ');
  int pilihan = int.parse(stdin.readLineSync()!);
  if (saldo < nominal) {
    print('Maaf, Saldo anda tidak cukup');
    return;
  }
  int lembar100 = 0;
  int sisa = nominal;
  if (pilihan == 2) {
    lembar100 = sisa ~/ 100000;
    sisa -= lembar100 * 100000;
  }
  int lembar50 = sisa ~/ 50000;
  saldo -= lembar100 * 100000 + lembar50 * 50000;
  if (lembar100 > 0) {
    print(' Rp. 100.000 x $lembar100 Lembar');
  }
  if (lembar50 > 0) {
    print(' Rp. 50.000 x $lembar50 Lembar');
  }
}