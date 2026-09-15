import 'package:flutter/material.dart';

class RuangPraktikum extends StatelessWidget {
  const RuangPraktikum({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(32),
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(
                maxWidth: 1050,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Ruang Praktikum Hari Ini',
                    style: TextStyle(
                      fontSize: 38,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF101B35),
                    ),
                  ),

                  const SizedBox(height: 16),

                  Row(
                    children: [
                      _summary(
                        icon: Icons.calendar_month,
                        text: '3 sesi',
                        color: const Color(0xFFE3F1FF),
                        iconColor: const Color(0xFF1684D8),
                      ),
                      const SizedBox(width: 18),
                      _summary(
                        icon: Icons.meeting_room,
                        text: '1 ruang tersedia',
                        color: const Color(0xFFE0F4E9),
                        iconColor: const Color(0xFF218B5B),
                      ),
                    ],
                  ),

                  const SizedBox(height: 22),

                  GridView.count(
                    crossAxisCount: 2,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                    mainAxisExtent: 265,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    children: [
                      _roomCard(
                        title: 'Mobile Programming',
                        status: 'Berlangsung',
                        statusColor: const Color(0xFF1489D8),
                        statusTextColor: Colors.white,
                        time: '08.00 – 10.00',
                        room: 'Lab 1',
                        icon: Icons.groups,
                        message: 'Sedang digunakan\noleh praktikan',
                        messageColor: const Color(0xFFE1F1FF),
                        messageIconColor: const Color(0xFF1684D8),
                      ),
                      _roomCard(
                        title: 'Rekayasa Perangkat Lunak',
                        status: 'Akan datang',
                        statusColor: const Color(0xFFFFE6AE),
                        statusTextColor: const Color(0xFF82530C),
                        time: '10.00 – 12.00',
                        room: 'Lab 2',
                        icon: Icons.access_time,
                        message: 'Sesi akan dimulai\nsebentar lagi',
                        messageColor: const Color(0xFFFFF5DE),
                        messageIconColor: const Color(0xFF70480C),
                      ),
                      _roomCard(
                        title: 'Basis Data',
                        status: 'Selesai',
                        statusColor: const Color(0xFFE4E7EB),
                        statusTextColor: const Color(0xFF344054),
                        time: '13.00 – 15.00',
                        room: 'Lab 3',
                        icon: Icons.check_circle,
                        message: 'Sesi telah selesai',
                        messageColor: const Color(0xFFEEF1F4),
                        messageIconColor: const Color(0xFF344054),
                      ),
                      _roomCard(
                        title: 'Lab 2',
                        status: 'Tersedia',
                        statusColor: const Color(0xFF2FA56F),
                        statusTextColor: Colors.white,
                        time: '',
                        room: 'Ruang tersedia\ndi luar jadwal sesi',
                        icon: Icons.meeting_room,
                        message: 'Siap digunakan\nuntuk praktikum lain',
                        messageColor: const Color(0xFFDFF4E8),
                        messageIconColor: const Color(0xFF218B5B),
                        available: true,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _summary({
    required IconData icon,
    required String text,
    required Color color,
    required Color iconColor,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 12,
      ),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(28),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            size: 24,
            color: iconColor,
          ),
          const SizedBox(width: 10),
          Text(
            text,
            style: TextStyle(
              fontSize: 18,
              color: iconColor,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  Widget _roomCard({
    required String title,
    required String status,
    required Color statusColor,
    required Color statusTextColor,
    required String time,
    required String room,
    required IconData icon,
    required String message,
    required Color messageColor,
    required Color messageIconColor,
    bool available = false,
  }) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: available ? const Color(0xFFF7FCF9) : Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: available
              ? const Color(0xFFCFE9DB)
              : const Color(0xFFDCE2E9),
          width: 1.3,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Text(
                  title,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 23,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF101B35),
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 9,
                ),
                decoration: BoxDecoration(
                  color: statusColor,
                  borderRadius: BorderRadius.circular(24),
                ),
                child: Text(
                  status,
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    color: statusTextColor,
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 16),

          if (time.isNotEmpty)
            Row(
              children: [
                const Icon(
                  Icons.access_time_outlined,
                  size: 28,
                  color: Color(0xFF344054),
                ),
                const SizedBox(width: 14),
                Text(
                  time,
                  style: const TextStyle(
                    fontSize: 18,
                    color: Color(0xFF263754),
                  ),
                ),
              ],
            ),

          if (time.isNotEmpty) const SizedBox(height: 13),

          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(
                available
                    ? Icons.meeting_room_outlined
                    : Icons.location_on_outlined,
                size: 28,
                color: const Color(0xFF344054),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Text(
                  room,
                  style: const TextStyle(
                    fontSize: 18,
                    color: Color(0xFF263754),
                    height: 1.3,
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 16),

          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(
              horizontal: 18,
              vertical: 14,
            ),
            decoration: BoxDecoration(
              color: messageColor,
              borderRadius: BorderRadius.circular(13),
            ),
            child: Row(
              children: [
                Icon(
                  icon,
                  size: 30,
                  color: messageIconColor,
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Text(
                    message,
                    maxLines: 2,
                    overflow: TextOverflow.visible,
                    style: const TextStyle(
                      fontSize: 17,
                      color: Color(0xFF263754),
                      height: 1.25,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}