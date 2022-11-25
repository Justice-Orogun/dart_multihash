import 'package:flutter/foundation.dart';

class HashInfo {
  final int code;
  final int length;
  final String hashName;

  const HashInfo(
      {required this.code, required this.length, required this.hashName});
}

class Multihash extends HashInfo {
  final List<int> digest;

  const Multihash(
      {required code, required length, required hashName, required this.digest})
      : super(code: code, length: length, hashName: hashName);
}

class DecodedVarInt {
  final int res;
  final int byteLength;

  DecodedVarInt({required this.res, required this.byteLength});
}

// This hash table is based on the official `multiformats` convention
// https://github.com/multiformats/multicodec/blob/master/table.csv
const List<HashInfo> hashTable = [
  HashInfo(code: 0x12, length: 0x20, hashName: 'sha2-256'),
  HashInfo(code: 0x13, length: 0x40, hashName: 'sha2-512'),
  HashInfo(code: 0x14, length: 0x40, hashName: 'sha3-512'),
  HashInfo(code: 0x15, length: 0x30, hashName: 'sha3-384'),
  HashInfo(code: 0x16, length: 0x20, hashName: 'sha3-256'),
  HashInfo(code: 0x17, length: 0x1c, hashName: 'sha3-224'),
  HashInfo(code: 0x18, length: 0x20, hashName: 'shake-128'),
  HashInfo(code: 0x19, length: 0x40, hashName: 'shake-256'),
  HashInfo(code: 0x1a, length: 0x1c, hashName: 'keccak-224'),
  HashInfo(code: 0x1b, length: 0x20, hashName: 'keccak-256'),
  HashInfo(code: 0x1c, length: 0x30, hashName: 'keccak-384'),
  HashInfo(code: 0x1d, length: 0x40, hashName: 'keccak-512'),
  HashInfo(code: 0x22, length: 0x20, hashName: 'murmur3-128'),
  HashInfo(code: 0x56, length: 0x20, hashName: 'dbl-sha2-256'),
  HashInfo(code: 0xb201, length: 0x1, hashName: 'blake2b-8'),
  HashInfo(code: 0xb202, length: 0x2, hashName: 'blake2b-16'),
  HashInfo(code: 0xb203, length: 0x3, hashName: 'blake2b-24'),
  HashInfo(code: 0xb204, length: 0x4, hashName: 'blake2b-32'),
  HashInfo(code: 0xb205, length: 0x5, hashName: 'blake2b-40'),
  HashInfo(code: 0xb206, length: 0x6, hashName: 'blake2b-48'),
  HashInfo(code: 0xb207, length: 0x7, hashName: 'blake2b-56'),
  HashInfo(code: 0xb208, length: 0x8, hashName: 'blake2b-64'),
  HashInfo(code: 0xb209, length: 0x9, hashName: 'blake2b-72'),
  HashInfo(code: 0xb20a, length: 0xa, hashName: 'blake2b-80'),
  HashInfo(code: 0xb20b, length: 0xb, hashName: 'blake2b-88'),
  HashInfo(code: 0xb20c, length: 0xc, hashName: 'blake2b-96'),
  HashInfo(code: 0xb20d, length: 0xd, hashName: 'blake2b-104'),
  HashInfo(code: 0xb20e, length: 0xe, hashName: 'blake2b-112'),
  HashInfo(code: 0xb20f, length: 0xf, hashName: 'blake2b-120'),
  HashInfo(code: 0xb210, length: 0x10, hashName: 'blake2b-128'),
  HashInfo(code: 0xb211, length: 0x11, hashName: 'blake2b-136'),
  HashInfo(code: 0xb212, length: 0x12, hashName: 'blake2b-144'),
  HashInfo(code: 0xb213, length: 0x13, hashName: 'blake2b-152'),
  HashInfo(code: 0xb214, length: 0x14, hashName: 'blake2b-160'),
  HashInfo(code: 0xb215, length: 0x15, hashName: 'blake2b-168'),
  HashInfo(code: 0xb216, length: 0x16, hashName: 'blake2b-176'),
  HashInfo(code: 0xb217, length: 0x17, hashName: 'blake2b-184'),
  HashInfo(code: 0xb218, length: 0x18, hashName: 'blake2b-192'),
  HashInfo(code: 0xb219, length: 0x19, hashName: 'blake2b-200'),
  HashInfo(code: 0xb21a, length: 0x1a, hashName: 'blake2b-208'),
  HashInfo(code: 0xb21b, length: 0x1b, hashName: 'blake2b-216'),
  HashInfo(code: 0xb21c, length: 0x1c, hashName: 'blake2b-224'),
  HashInfo(code: 0xb21d, length: 0x1d, hashName: 'blake2b-232'),
  HashInfo(code: 0xb21e, length: 0x1e, hashName: 'blake2b-240'),
  HashInfo(code: 0xb21f, length: 0x1f, hashName: 'blake2b-248'),
  HashInfo(code: 0xb220, length: 0x20, hashName: 'blake2b-256'),
  HashInfo(code: 0xb221, length: 0x21, hashName: 'blake2b-264'),
  HashInfo(code: 0xb222, length: 0x22, hashName: 'blake2b-272'),
  HashInfo(code: 0xb223, length: 0x23, hashName: 'blake2b-280'),
  HashInfo(code: 0xb224, length: 0x24, hashName: 'blake2b-288'),
  HashInfo(code: 0xb225, length: 0x25, hashName: 'blake2b-296'),
  HashInfo(code: 0xb226, length: 0x26, hashName: 'blake2b-304'),
  HashInfo(code: 0xb227, length: 0x27, hashName: 'blake2b-312'),
  HashInfo(code: 0xb228, length: 0x28, hashName: 'blake2b-320'),
  HashInfo(code: 0xb229, length: 0x29, hashName: 'blake2b-328'),
  HashInfo(code: 0xb22a, length: 0x2a, hashName: 'blake2b-336'),
  HashInfo(code: 0xb22b, length: 0x2b, hashName: 'blake2b-344'),
  HashInfo(code: 0xb22c, length: 0x2c, hashName: 'blake2b-352'),
  HashInfo(code: 0xb22d, length: 0x2d, hashName: 'blake2b-360'),
  HashInfo(code: 0xb22e, length: 0x2e, hashName: 'blake2b-368'),
  HashInfo(code: 0xb22f, length: 0x2f, hashName: 'blake2b-376'),
  HashInfo(code: 0xb230, length: 0x30, hashName: 'blake2b-384'),
  HashInfo(code: 0xb231, length: 0x31, hashName: 'blake2b-392'),
  HashInfo(code: 0xb232, length: 0x32, hashName: 'blake2b-400'),
  HashInfo(code: 0xb233, length: 0x33, hashName: 'blake2b-408'),
  HashInfo(code: 0xb234, length: 0x34, hashName: 'blake2b-416'),
  HashInfo(code: 0xb235, length: 0x35, hashName: 'blake2b-424'),
  HashInfo(code: 0xb236, length: 0x36, hashName: 'blake2b-432'),
  HashInfo(code: 0xb237, length: 0x37, hashName: 'blake2b-440'),
  HashInfo(code: 0xb238, length: 0x38, hashName: 'blake2b-448'),
  HashInfo(code: 0xb239, length: 0x39, hashName: 'blake2b-456'),
  HashInfo(code: 0xb23a, length: 0x3a, hashName: 'blake2b-464'),
  HashInfo(code: 0xb23b, length: 0x3b, hashName: 'blake2b-472'),
  HashInfo(code: 0xb23c, length: 0x3c, hashName: 'blake2b-480'),
  HashInfo(code: 0xb23d, length: 0x3d, hashName: 'blake2b-488'),
  HashInfo(code: 0xb23e, length: 0x3e, hashName: 'blake2b-496'),
  HashInfo(code: 0xb23f, length: 0x3f, hashName: 'blake2b-504'),
  HashInfo(code: 0xb240, length: 0x40, hashName: 'blake2b-512'),
  HashInfo(code: 0xb241, length: 0x1, hashName: 'blake2s-8'),
  HashInfo(code: 0xb242, length: 0x2, hashName: 'blake2s-16'),
  HashInfo(code: 0xb243, length: 0x3, hashName: 'blake2s-24'),
  HashInfo(code: 0xb244, length: 0x4, hashName: 'blake2s-32'),
  HashInfo(code: 0xb245, length: 0x5, hashName: 'blake2s-40'),
  HashInfo(code: 0xb246, length: 0x6, hashName: 'blake2s-48'),
  HashInfo(code: 0xb247, length: 0x7, hashName: 'blake2s-56'),
  HashInfo(code: 0xb248, length: 0x8, hashName: 'blake2s-64'),
  HashInfo(code: 0xb249, length: 0x9, hashName: 'blake2s-72'),
  HashInfo(code: 0xb24a, length: 0xa, hashName: 'blake2s-80'),
  HashInfo(code: 0xb24b, length: 0xb, hashName: 'blake2s-88'),
  HashInfo(code: 0xb24c, length: 0xc, hashName: 'blake2s-96'),
  HashInfo(code: 0xb24d, length: 0xd, hashName: 'blake2s-104'),
  HashInfo(code: 0xb24e, length: 0xe, hashName: 'blake2s-112'),
  HashInfo(code: 0xb24f, length: 0xf, hashName: 'blake2s-120'),
  HashInfo(code: 0xb250, length: 0x10, hashName: 'blake2s-128'),
  HashInfo(code: 0xb251, length: 0x11, hashName: 'blake2s-136'),
  HashInfo(code: 0xb252, length: 0x12, hashName: 'blake2s-144'),
  HashInfo(code: 0xb253, length: 0x13, hashName: 'blake2s-152'),
  HashInfo(code: 0xb254, length: 0x14, hashName: 'blake2s-160'),
  HashInfo(code: 0xb255, length: 0x15, hashName: 'blake2s-168'),
  HashInfo(code: 0xb256, length: 0x16, hashName: 'blake2s-176'),
  HashInfo(code: 0xb257, length: 0x17, hashName: 'blake2s-184'),
  HashInfo(code: 0xb258, length: 0x18, hashName: 'blake2s-192'),
  HashInfo(code: 0xb259, length: 0x19, hashName: 'blake2s-200'),
  HashInfo(code: 0xb25a, length: 0x1a, hashName: 'blake2s-208'),
  HashInfo(code: 0xb25b, length: 0x1b, hashName: 'blake2s-216'),
  HashInfo(code: 0xb25c, length: 0x1c, hashName: 'blake2s-224'),
  HashInfo(code: 0xb25d, length: 0x1d, hashName: 'blake2s-232'),
  HashInfo(code: 0xb25e, length: 0x1e, hashName: 'blake2s-240'),
  HashInfo(code: 0xb25f, length: 0x1f, hashName: 'blake2s-248'),
  HashInfo(code: 0xb260, length: 0x20, hashName: 'blake2s-256'),
  HashInfo(code: 0xb301, length: 0x1, hashName: 'Skein256-8'),
  HashInfo(code: 0xb302, length: 0x2, hashName: 'Skein256-16'),
  HashInfo(code: 0xb303, length: 0x3, hashName: 'Skein256-24'),
  HashInfo(code: 0xb304, length: 0x4, hashName: 'Skein256-32'),
  HashInfo(code: 0xb305, length: 0x5, hashName: 'Skein256-40'),
  HashInfo(code: 0xb306, length: 0x6, hashName: 'Skein256-48'),
  HashInfo(code: 0xb307, length: 0x7, hashName: 'Skein256-56'),
  HashInfo(code: 0xb308, length: 0x8, hashName: 'Skein256-64'),
  HashInfo(code: 0xb309, length: 0x9, hashName: 'Skein256-72'),
  HashInfo(code: 0xb30a, length: 0xa, hashName: 'Skein256-80'),
  HashInfo(code: 0xb30b, length: 0xb, hashName: 'Skein256-88'),
  HashInfo(code: 0xb30c, length: 0xc, hashName: 'Skein256-96'),
  HashInfo(code: 0xb30d, length: 0xd, hashName: 'Skein256-104'),
  HashInfo(code: 0xb30e, length: 0xe, hashName: 'Skein256-112'),
  HashInfo(code: 0xb30f, length: 0xf, hashName: 'Skein256-120'),
  HashInfo(code: 0xb310, length: 0x10, hashName: 'Skein256-128'),
  HashInfo(code: 0xb311, length: 0x11, hashName: 'Skein256-136'),
  HashInfo(code: 0xb312, length: 0x12, hashName: 'Skein256-144'),
  HashInfo(code: 0xb313, length: 0x13, hashName: 'Skein256-152'),
  HashInfo(code: 0xb314, length: 0x14, hashName: 'Skein256-160'),
  HashInfo(code: 0xb315, length: 0x15, hashName: 'Skein256-168'),
  HashInfo(code: 0xb316, length: 0x16, hashName: 'Skein256-176'),
  HashInfo(code: 0xb317, length: 0x17, hashName: 'Skein256-184'),
  HashInfo(code: 0xb318, length: 0x18, hashName: 'Skein256-192'),
  HashInfo(code: 0xb319, length: 0x19, hashName: 'Skein256-200'),
  HashInfo(code: 0xb31a, length: 0x1a, hashName: 'Skein256-208'),
  HashInfo(code: 0xb31b, length: 0x1b, hashName: 'Skein256-216'),
  HashInfo(code: 0xb31c, length: 0x1c, hashName: 'Skein256-224'),
  HashInfo(code: 0xb31d, length: 0x1d, hashName: 'Skein256-232'),
  HashInfo(code: 0xb31e, length: 0x1e, hashName: 'Skein256-240'),
  HashInfo(code: 0xb31f, length: 0x1f, hashName: 'Skein256-248'),
  HashInfo(code: 0xb320, length: 0x20, hashName: 'Skein256-256'),
  HashInfo(code: 0xb321, length: 0x1, hashName: 'Skein512-8'),
  HashInfo(code: 0xb322, length: 0x2, hashName: 'Skein512-16'),
  HashInfo(code: 0xb323, length: 0x3, hashName: 'Skein512-24'),
  HashInfo(code: 0xb324, length: 0x4, hashName: 'Skein512-32'),
  HashInfo(code: 0xb325, length: 0x5, hashName: 'Skein512-40'),
  HashInfo(code: 0xb326, length: 0x6, hashName: 'Skein512-48'),
  HashInfo(code: 0xb327, length: 0x7, hashName: 'Skein512-56'),
  HashInfo(code: 0xb328, length: 0x8, hashName: 'Skein512-64'),
  HashInfo(code: 0xb329, length: 0x9, hashName: 'Skein512-72'),
  HashInfo(code: 0xb32a, length: 0xa, hashName: 'Skein512-80'),
  HashInfo(code: 0xb32b, length: 0xb, hashName: 'Skein512-88'),
  HashInfo(code: 0xb32c, length: 0xc, hashName: 'Skein512-96'),
  HashInfo(code: 0xb32d, length: 0xd, hashName: 'Skein512-104'),
  HashInfo(code: 0xb32e, length: 0xe, hashName: 'Skein512-112'),
  HashInfo(code: 0xb32f, length: 0xf, hashName: 'Skein512-120'),
  HashInfo(code: 0xb330, length: 0x10, hashName: 'Skein512-128'),
  HashInfo(code: 0xb331, length: 0x11, hashName: 'Skein512-136'),
  HashInfo(code: 0xb332, length: 0x12, hashName: 'Skein512-144'),
  HashInfo(code: 0xb333, length: 0x13, hashName: 'Skein512-152'),
  HashInfo(code: 0xb334, length: 0x14, hashName: 'Skein512-160'),
  HashInfo(code: 0xb335, length: 0x15, hashName: 'Skein512-168'),
  HashInfo(code: 0xb336, length: 0x16, hashName: 'Skein512-176'),
  HashInfo(code: 0xb337, length: 0x17, hashName: 'Skein512-184'),
  HashInfo(code: 0xb338, length: 0x18, hashName: 'Skein512-192'),
  HashInfo(code: 0xb339, length: 0x19, hashName: 'Skein512-200'),
  HashInfo(code: 0xb33a, length: 0x1a, hashName: 'Skein512-208'),
  HashInfo(code: 0xb33b, length: 0x1b, hashName: 'Skein512-216'),
  HashInfo(code: 0xb33c, length: 0x1c, hashName: 'Skein512-224'),
  HashInfo(code: 0xb33d, length: 0x1d, hashName: 'Skein512-232'),
  HashInfo(code: 0xb33e, length: 0x1e, hashName: 'Skein512-240'),
  HashInfo(code: 0xb33f, length: 0x1f, hashName: 'Skein512-248'),
  HashInfo(code: 0xb340, length: 0x20, hashName: 'Skein512-256'),
  HashInfo(code: 0xb341, length: 0x21, hashName: 'Skein512-264'),
  HashInfo(code: 0xb342, length: 0x22, hashName: 'Skein512-272'),
  HashInfo(code: 0xb343, length: 0x23, hashName: 'Skein512-280'),
  HashInfo(code: 0xb344, length: 0x24, hashName: 'Skein512-288'),
  HashInfo(code: 0xb345, length: 0x25, hashName: 'Skein512-296'),
  HashInfo(code: 0xb346, length: 0x26, hashName: 'Skein512-304'),
  HashInfo(code: 0xb347, length: 0x27, hashName: 'Skein512-312'),
  HashInfo(code: 0xb348, length: 0x28, hashName: 'Skein512-320'),
  HashInfo(code: 0xb349, length: 0x29, hashName: 'Skein512-328'),
  HashInfo(code: 0xb34a, length: 0x2a, hashName: 'Skein512-336'),
  HashInfo(code: 0xb34b, length: 0x2b, hashName: 'Skein512-344'),
  HashInfo(code: 0xb34c, length: 0x2c, hashName: 'Skein512-352'),
  HashInfo(code: 0xb34d, length: 0x2d, hashName: 'Skein512-360'),
  HashInfo(code: 0xb34e, length: 0x2e, hashName: 'Skein512-368'),
  HashInfo(code: 0xb34f, length: 0x2f, hashName: 'Skein512-376'),
  HashInfo(code: 0xb350, length: 0x30, hashName: 'Skein512-384'),
  HashInfo(code: 0xb351, length: 0x31, hashName: 'Skein512-392'),
  HashInfo(code: 0xb352, length: 0x32, hashName: 'Skein512-400'),
  HashInfo(code: 0xb353, length: 0x33, hashName: 'Skein512-408'),
  HashInfo(code: 0xb354, length: 0x34, hashName: 'Skein512-416'),
  HashInfo(code: 0xb355, length: 0x35, hashName: 'Skein512-424'),
  HashInfo(code: 0xb356, length: 0x36, hashName: 'Skein512-432'),
  HashInfo(code: 0xb357, length: 0x37, hashName: 'Skein512-440'),
  HashInfo(code: 0xb358, length: 0x38, hashName: 'Skein512-448'),
  HashInfo(code: 0xb359, length: 0x39, hashName: 'Skein512-456'),
  HashInfo(code: 0xb35a, length: 0x3a, hashName: 'Skein512-464'),
  HashInfo(code: 0xb35b, length: 0x3b, hashName: 'Skein512-472'),
  HashInfo(code: 0xb35c, length: 0x3c, hashName: 'Skein512-480'),
  HashInfo(code: 0xb35d, length: 0x3d, hashName: 'Skein512-488'),
  HashInfo(code: 0xb35e, length: 0x3e, hashName: 'Skein512-496'),
  HashInfo(code: 0xb35f, length: 0x3f, hashName: 'Skein512-504'),
  HashInfo(code: 0xb360, length: 0x40, hashName: 'Skein512-512'),
  HashInfo(code: 0xb361, length: 0x1, hashName: 'Skein1024-8'),
  HashInfo(code: 0xb362, length: 0x2, hashName: 'Skein1024-16'),
  HashInfo(code: 0xb363, length: 0x3, hashName: 'Skein1024-24'),
  HashInfo(code: 0xb364, length: 0x4, hashName: 'Skein1024-32'),
  HashInfo(code: 0xb365, length: 0x5, hashName: 'Skein1024-40'),
  HashInfo(code: 0xb366, length: 0x6, hashName: 'Skein1024-48'),
  HashInfo(code: 0xb367, length: 0x7, hashName: 'Skein1024-56'),
  HashInfo(code: 0xb368, length: 0x8, hashName: 'Skein1024-64'),
  HashInfo(code: 0xb369, length: 0x9, hashName: 'Skein1024-72'),
  HashInfo(code: 0xb36a, length: 0xa, hashName: 'Skein1024-80'),
  HashInfo(code: 0xb36b, length: 0xb, hashName: 'Skein1024-88'),
  HashInfo(code: 0xb36c, length: 0xc, hashName: 'Skein1024-96'),
  HashInfo(code: 0xb36d, length: 0xd, hashName: 'Skein1024-104'),
  HashInfo(code: 0xb36e, length: 0xe, hashName: 'Skein1024-112'),
  HashInfo(code: 0xb36f, length: 0xf, hashName: 'Skein1024-120'),
  HashInfo(code: 0xb370, length: 0x10, hashName: 'Skein1024-128'),
  HashInfo(code: 0xb371, length: 0x11, hashName: 'Skein1024-136'),
  HashInfo(code: 0xb372, length: 0x12, hashName: 'Skein1024-144'),
  HashInfo(code: 0xb373, length: 0x13, hashName: 'Skein1024-152'),
  HashInfo(code: 0xb374, length: 0x14, hashName: 'Skein1024-160'),
  HashInfo(code: 0xb375, length: 0x15, hashName: 'Skein1024-168'),
  HashInfo(code: 0xb376, length: 0x16, hashName: 'Skein1024-176'),
  HashInfo(code: 0xb377, length: 0x17, hashName: 'Skein1024-184'),
  HashInfo(code: 0xb378, length: 0x18, hashName: 'Skein1024-192'),
  HashInfo(code: 0xb379, length: 0x19, hashName: 'Skein1024-200'),
  HashInfo(code: 0xb37a, length: 0x1a, hashName: 'Skein1024-208'),
  HashInfo(code: 0xb37b, length: 0x1b, hashName: 'Skein1024-216'),
  HashInfo(code: 0xb37c, length: 0x1c, hashName: 'Skein1024-224'),
  HashInfo(code: 0xb37d, length: 0x1d, hashName: 'Skein1024-232'),
  HashInfo(code: 0xb37e, length: 0x1e, hashName: 'Skein1024-240'),
  HashInfo(code: 0xb37f, length: 0x1f, hashName: 'Skein1024-248'),
  HashInfo(code: 0xb380, length: 0x20, hashName: 'Skein1024-256'),
  HashInfo(code: 0xb381, length: 0x21, hashName: 'Skein1024-264'),
  HashInfo(code: 0xb382, length: 0x22, hashName: 'Skein1024-272'),
  HashInfo(code: 0xb383, length: 0x23, hashName: 'Skein1024-280'),
  HashInfo(code: 0xb384, length: 0x24, hashName: 'Skein1024-288'),
  HashInfo(code: 0xb385, length: 0x25, hashName: 'Skein1024-296'),
  HashInfo(code: 0xb386, length: 0x26, hashName: 'Skein1024-304'),
  HashInfo(code: 0xb387, length: 0x27, hashName: 'Skein1024-312'),
  HashInfo(code: 0xb388, length: 0x28, hashName: 'Skein1024-320'),
  HashInfo(code: 0xb389, length: 0x29, hashName: 'Skein1024-328'),
  HashInfo(code: 0xb38a, length: 0x2a, hashName: 'Skein1024-336'),
  HashInfo(code: 0xb38b, length: 0x2b, hashName: 'Skein1024-344'),
  HashInfo(code: 0xb38c, length: 0x2c, hashName: 'Skein1024-352'),
  HashInfo(code: 0xb38d, length: 0x2d, hashName: 'Skein1024-360'),
  HashInfo(code: 0xb38e, length: 0x2e, hashName: 'Skein1024-368'),
  HashInfo(code: 0xb38f, length: 0x2f, hashName: 'Skein1024-376'),
  HashInfo(code: 0xb390, length: 0x30, hashName: 'Skein1024-384'),
  HashInfo(code: 0xb391, length: 0x31, hashName: 'Skein1024-392'),
  HashInfo(code: 0xb392, length: 0x32, hashName: 'Skein1024-400'),
  HashInfo(code: 0xb393, length: 0x33, hashName: 'Skein1024-408'),
  HashInfo(code: 0xb394, length: 0x34, hashName: 'Skein1024-416'),
  HashInfo(code: 0xb395, length: 0x35, hashName: 'Skein1024-424'),
  HashInfo(code: 0xb396, length: 0x36, hashName: 'Skein1024-432'),
  HashInfo(code: 0xb397, length: 0x37, hashName: 'Skein1024-440'),
  HashInfo(code: 0xb398, length: 0x38, hashName: 'Skein1024-448'),
  HashInfo(code: 0xb399, length: 0x39, hashName: 'Skein1024-456'),
  HashInfo(code: 0xb39a, length: 0x3a, hashName: 'Skein1024-464'),
  HashInfo(code: 0xb39b, length: 0x3b, hashName: 'Skein1024-472'),
  HashInfo(code: 0xb39c, length: 0x3c, hashName: 'Skein1024-480'),
  HashInfo(code: 0xb39d, length: 0x3d, hashName: 'Skein1024-488'),
  HashInfo(code: 0xb39e, length: 0x3e, hashName: 'Skein1024-496'),
  HashInfo(code: 0xb39f, length: 0x3f, hashName: 'Skein1024-504'),
  HashInfo(code: 0xb3a0, length: 0x40, hashName: 'Skein1024-512'),
  HashInfo(code: 0xb3a1, length: 0x41, hashName: 'Skein1024-520'),
  HashInfo(code: 0xb3a2, length: 0x42, hashName: 'Skein1024-528'),
  HashInfo(code: 0xb3a3, length: 0x43, hashName: 'Skein1024-536'),
  HashInfo(code: 0xb3a4, length: 0x44, hashName: 'Skein1024-544'),
  HashInfo(code: 0xb3a5, length: 0x45, hashName: 'Skein1024-552'),
  HashInfo(code: 0xb3a6, length: 0x46, hashName: 'Skein1024-560'),
  HashInfo(code: 0xb3a7, length: 0x47, hashName: 'Skein1024-568'),
  HashInfo(code: 0xb3a8, length: 0x48, hashName: 'Skein1024-576'),
  HashInfo(code: 0xb3a9, length: 0x49, hashName: 'Skein1024-584'),
  HashInfo(code: 0xb3aa, length: 0x4a, hashName: 'Skein1024-592'),
  HashInfo(code: 0xb3ab, length: 0x4b, hashName: 'Skein1024-600'),
  HashInfo(code: 0xb3ac, length: 0x4c, hashName: 'Skein1024-608'),
  HashInfo(code: 0xb3ad, length: 0x4d, hashName: 'Skein1024-616'),
  HashInfo(code: 0xb3ae, length: 0x4e, hashName: 'Skein1024-624'),
  HashInfo(code: 0xb3af, length: 0x4f, hashName: 'Skein1024-632'),
  HashInfo(code: 0xb3b0, length: 0x50, hashName: 'Skein1024-640'),
  HashInfo(code: 0xb3b1, length: 0x51, hashName: 'Skein1024-648'),
  HashInfo(code: 0xb3b2, length: 0x52, hashName: 'Skein1024-656'),
  HashInfo(code: 0xb3b3, length: 0x53, hashName: 'Skein1024-664'),
  HashInfo(code: 0xb3b4, length: 0x54, hashName: 'Skein1024-672'),
  HashInfo(code: 0xb3b5, length: 0x55, hashName: 'Skein1024-680'),
  HashInfo(code: 0xb3b6, length: 0x56, hashName: 'Skein1024-688'),
  HashInfo(code: 0xb3b7, length: 0x57, hashName: 'Skein1024-696'),
  HashInfo(code: 0xb3b8, length: 0x58, hashName: 'Skein1024-704'),
  HashInfo(code: 0xb3b9, length: 0x59, hashName: 'Skein1024-712'),
  HashInfo(code: 0xb3ba, length: 0x5a, hashName: 'Skein1024-720'),
  HashInfo(code: 0xb3bb, length: 0x5b, hashName: 'Skein1024-728'),
  HashInfo(code: 0xb3bc, length: 0x5c, hashName: 'Skein1024-736'),
  HashInfo(code: 0xb3bd, length: 0x5d, hashName: 'Skein1024-744'),
  HashInfo(code: 0xb3be, length: 0x5e, hashName: 'Skein1024-752'),
  HashInfo(code: 0xb3bf, length: 0x5f, hashName: 'Skein1024-760'),
  HashInfo(code: 0xb3c0, length: 0x60, hashName: 'Skein1024-768'),
  HashInfo(code: 0xb3c1, length: 0x61, hashName: 'Skein1024-776'),
  HashInfo(code: 0xb3c2, length: 0x62, hashName: 'Skein1024-784'),
  HashInfo(code: 0xb3c3, length: 0x63, hashName: 'Skein1024-792'),
  HashInfo(code: 0xb3c4, length: 0x64, hashName: 'Skein1024-800'),
  HashInfo(code: 0xb3c5, length: 0x65, hashName: 'Skein1024-808'),
  HashInfo(code: 0xb3c6, length: 0x66, hashName: 'Skein1024-816'),
  HashInfo(code: 0xb3c7, length: 0x67, hashName: 'Skein1024-824'),
  HashInfo(code: 0xb3c8, length: 0x68, hashName: 'Skein1024-832'),
  HashInfo(code: 0xb3c9, length: 0x69, hashName: 'Skein1024-840'),
  HashInfo(code: 0xb3ca, length: 0x6a, hashName: 'Skein1024-848'),
  HashInfo(code: 0xb3cb, length: 0x6b, hashName: 'Skein1024-856'),
  HashInfo(code: 0xb3cc, length: 0x6c, hashName: 'Skein1024-864'),
  HashInfo(code: 0xb3cd, length: 0x6d, hashName: 'Skein1024-872'),
  HashInfo(code: 0xb3ce, length: 0x6e, hashName: 'Skein1024-880'),
  HashInfo(code: 0xb3cf, length: 0x6f, hashName: 'Skein1024-888'),
  HashInfo(code: 0xb3d0, length: 0x70, hashName: 'Skein1024-896'),
  HashInfo(code: 0xb3d1, length: 0x71, hashName: 'Skein1024-904'),
  HashInfo(code: 0xb3d2, length: 0x72, hashName: 'Skein1024-912'),
  HashInfo(code: 0xb3d3, length: 0x73, hashName: 'Skein1024-920'),
  HashInfo(code: 0xb3d4, length: 0x74, hashName: 'Skein1024-928'),
  HashInfo(code: 0xb3d5, length: 0x75, hashName: 'Skein1024-936'),
  HashInfo(code: 0xb3d6, length: 0x76, hashName: 'Skein1024-944'),
  HashInfo(code: 0xb3d7, length: 0x77, hashName: 'Skein1024-952'),
  HashInfo(code: 0xb3d8, length: 0x78, hashName: 'Skein1024-960'),
  HashInfo(code: 0xb3d9, length: 0x79, hashName: 'Skein1024-968'),
  HashInfo(code: 0xb3da, length: 0x7a, hashName: 'Skein1024-976'),
  HashInfo(code: 0xb3db, length: 0x7b, hashName: 'Skein1024-984'),
  HashInfo(code: 0xb3dc, length: 0x7c, hashName: 'Skein1024-992'),
  HashInfo(code: 0xb3dd, length: 0x7d, hashName: 'Skein1024-1000'),
  HashInfo(code: 0xb3de, length: 0x7e, hashName: 'Skein1024-1008'),
  HashInfo(code: 0xb3df, length: 0x7f, hashName: 'Skein1024-1016'),
  HashInfo(code: 0xb3e0, length: 0x80, hashName: 'Skein1024-1024'),
];

final supportedHashFunctions = hashTable.map((e) => e.hashName);
final supportedHashCodes = hashTable.map((e) => e.code);
