# GetAddr
Get ip address from network interface

## Description
Obtain the valid IP address of the first network card in order， supports IPv4 and IPv6

## Usage
./get_addr.sh VERSION INTERFACE_1 INTERFACE_2 ... INTERFACE_N

### Example
interface: eno1  
inet 10.0.0.2  netmask 255.255.255.0  broadcast 10.0.0.1  
inet6 240e::1 prefixlen 64 Scope:global
  
interface: wlo1  
inet 10.0.0.3  netmask 255.255.255.0  broadcast 10.0.0.1  
inet6 240e::2 prefixlen 64 Scope:global  
  
Command: ./get_addr 4 eno1 wlo1  
return: 10.0.0.2  
  
command: ./get_addr 6 wlo1 eno1  
return: 240e::2
