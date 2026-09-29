import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:poliwangi_mobile_starter/modul_04/models/announcement.dart';
import 'package:poliwangi_mobile_starter/modul_04/screens/announcement_list_screen.dart';
import 'package:poliwangi_mobile_starter/modul_04/services/announcement_api.dart';

class FailingAnnouncementApi extends AnnouncementApi {
  FailingAnnouncementApi() : super(modeSimulasi: false);

  @override
  Future<List<Announcement>> ambilPengumuman() async {
    throw Exception(
      'Gagal terhubung ke server. Periksa koneksi data atau Wi-Fi Anda.',
    );
  }
}

void main() {
  group('Modul 04: Networking & REST API Dasar — Fase A', () {
    test(
      '1. Model Announcement mem-parsing payload JSON dan serialisasi toJson',
      () {
        final jsonPayload = {
          'id': 101,
          'title': 'Uji Coba Pengumuman',
          'content': 'Ini adalah isi pengumuman uji coba.',
          'author': 'Dosen Penguji',
          'category': 'Akademik',
          'date': '2026-09-03',
          'readCount': 42,
        };

        final announcement = Announcement.fromJson(jsonPayload);

        expect(announcement.id, equals(101));
        expect(announcement.title, equals('Uji Coba Pengumuman'));
        expect(announcement.author, equals('Dosen Penguji'));
        expect(announcement.category, equals('Akademik'));
        expect(announcement.readCount, equals(42));

        final serialized = announcement.toJson();

        expect(serialized['id'], equals(101));
        expect(serialized['title'], equals('Uji Coba Pengumuman'));
      },
    );

    test(
      '2. AnnouncementApi mode simulasi mengembalikan data sampel',
      () async {
        final api = AnnouncementApi(modeSimulasi: true);

        final data = await api.ambilPengumuman();

        expect(data, isNotEmpty);
        expect(data.length, greaterThan(0));
        expect(
          data.every((item) => item.category.isNotEmpty),
          isTrue,
        );

        api.tutup();
      },
    );

    testWidgets(
      '3. AnnouncementListScreen menampilkan loading lalu daftar data',
      (WidgetTester tester) async {
        final api = AnnouncementApi(modeSimulasi: true);

        await tester.pumpWidget(
          MaterialApp(
            home: AnnouncementListScreen(api: api),
          ),
        );

        expect(
          find.byType(CircularProgressIndicator),
          findsOneWidget,
        );

        await tester.pump(const Duration(seconds: 1));
        await tester.pumpAndSettle();

        expect(
          find.text('Portal Pengumuman TRPL'),
          findsOneWidget,
        );

        expect(
          find.byType(ChoiceChip),
          findsNWidgets(5),
        );

        expect(
          find.byType(Card),
          findsWidgets,
        );
      },
    );

    testWidgets(
      '4. AnnouncementListScreen menampilkan Error State dan Coba Lagi',
      (WidgetTester tester) async {
        final api = FailingAnnouncementApi();

        await tester.pumpWidget(
          MaterialApp(
            home: AnnouncementListScreen(api: api),
          ),
        );

        await tester.pumpAndSettle();

        expect(
          find.text('Gagal Memuat Data'),
          findsOneWidget,
        );

        expect(
          find.text('Coba Lagi'),
          findsOneWidget,
        );

        expect(
          find.byIcon(Icons.cloud_off_rounded),
          findsOneWidget,
        );
      },
    );
  });
}
