import struct

# Cabecera DOS minimal + cabecera PE minimal -> firma PE32 real y valida,
# necesaria para que el perfil File Filter (FF-BLOCK-EXE) detecte el
# archivo por firma de tipo, no solo por la extension ".exe".
dos_stub = b'MZ' + b'\x90' * 58 + struct.pack('<I', 0x80)
dos_stub = dos_stub.ljust(0x80, b'\x00')
pe_sig = b'PE\x00\x00'
coff_header = struct.pack('<HHIIIHH', 0x014c, 1, 0, 0, 0, 0xE0, 0x0102)
optional_header = b'\x0b\x01' + b'\x00' * 94

with open('test_real.exe', 'wb') as f:
    f.write(dos_stub + pe_sig + coff_header + optional_header + b'\x00' * 256)
