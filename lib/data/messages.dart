import 'package:jawara/models/message.dart';

final List<CitizenMessage> dummyCitizenMessages = [
  CitizenMessage(
    id: 1,
    senderName: 'Varizky Naldiba Rimra',
    title: 'Perbaikan Lampu Jalan di Blok C',
    status: Status.accepted,
    createdAt: DateTime(2025, 10, 16),
  ),
  CitizenMessage(
    id: 2,
    senderName: 'Habibie Ed Dien',
    title: 'Laporan Kebersihan Taman Komplek',
    status: Status.pending,
    createdAt: DateTime(2025, 9, 28),
  ),
  CitizenMessage(
    id: 3,
    senderName: 'Rendha Putra Rahmadya',
    title: 'Usulan Kegiatan 17 Agustus',
    status: Status.accepted,
    createdAt: DateTime(2025, 9, 25),
  ),
  CitizenMessage(
    id: 4,
    senderName: 'Safiro Alfarisi Haraya',
    title: 'Izin Penggunaan Fasilitas Umum',
    status: Status.pending,
    createdAt: DateTime(2025, 9, 22),
  ),
  CitizenMessage(
    id: 5,
    senderName: 'Citra Lestari',
    title: 'Keluhan Saluran Air Mampet',
    status: Status.pending,
    createdAt: DateTime(2025, 9, 20),
  ),
];