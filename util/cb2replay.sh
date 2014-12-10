egrep "c000:[0-9,a-f]{4}" $1 |
grep -v "Running option rom at c000:0003" |
sed "s/c000\:[0-9,a-f]\{4\}\ /\t/g" |
sed "s/)/);/g" |
sed "s/=\ 0x\([0-9,a-f]*\)/\/\*\ \1\ \*\//g" |

tr '\n' '\r' |

sed "s/outl(0x0\{0,4\}\([0-9,a-f]*\), 0x2000);[^\r]*\r\toutl(0x\([0-9,a-f]*\), 0x2004);/radeon_write(0x\1, 0x\2);/g" |
sed "s/outl(0x0\{0,4\}\([0-9,a-f]*\), 0x2000);[^\r]*\r\tinl(0x2004);/radeon_read(0x\1);/g" |

sed "s/inb(0x03c3);[^\r]*\r\tinl(0x204c);[^\r]*/sync_read();/g" |

sed "s/sync_read();[^\r]*\r\tradeon_write(/radeon_write_sync(/g" |
sed "s/sync_read();[^\r]*\r\tradeon_read(/radeon_read_sync(/g" |

tr '\r' '\n'
