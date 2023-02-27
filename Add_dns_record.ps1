Add-DnsServerResourceRecordA -Name KH-ESXi-01 -IPv4Address 10.10.1.11 -ZoneName wish.kh
Add-DnsServerResourceRecordA -Name KH-ESXi-02 -IPv4Address 10.10.1.12 -ZoneName wish.kh
Add-DnsServerResourceRecordA -Name KH-ESXi-03 -IPv4Address 10.10.1.13 -ZoneName wish.kh
Add-DnsServerResourceRecordA -Name KH-VCSA -IPv4Address 10.10.1.20 -ZoneName wish.kh
Add-DnsServerPrimaryZone -NetworkId 10.10.1.0/24 -ZoneFile 1.10.10.in-addr.arpa.dns
Add-DnsServerResourceRecordPtr -Name 11 -ZoneName 1.10.10.in-addr.arpa -PtrDomainName KH-ESXi-01.wish.kh
Add-DnsServerResourceRecordPtr -Name 12 -ZoneName 1.10.10.in-addr.arpa -PtrDomainName KH-ESXi-02.wish.kh
Add-DnsServerResourceRecordPtr -Name 13 -ZoneName 1.10.10.in-addr.arpa -PtrDomainName KH-ESXi-03.wish.kh
Add-DnsServerResourceRecordPtr -Name 20 -ZoneName 1.10.10.in-addr.arpa -PtrDomainName KH-VCSA.wish.kh
