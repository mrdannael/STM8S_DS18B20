NOT-FINISHED (yet :P) One Wire DS18B20 STM8S-DISCOVERY ver 0.2


Defined ROM COMMANDS and FUNCTION COMMANDS in file C

Implemented functions (mostly in one file "main.c")
1.  RESET_PULSE(); // sending Reset pulse from master and cheking for presence response from DS18B20
2. 	WRITE_BYTE(); // sending COMMAND to DS18B20
3. 	READ_BYTE();  // reading bytes sended by DS18B20
4.  READ_ID();  // function for reading unique ID of DS18B20