import serial
import serial.tools.list_ports


def serial_initiate():
    # Ask user for COM port
    serial_device = serial.Serial()
    serial_device.baudrate = 9600
    com_port = input("What is the COM port?")

    # Allow user to enter number and COM#
    if com_port.isnumeric() is False:
        serial_device.port = com_port
    if com_port.isnumeric() is True:
        serial_device.port = "COM" + str(com_port)

    # Open the serial device
    serial_device.open()
    return serial_device


def serial_read(serial_device):
    raw_serial_data = serial_device.readline()
    return raw_serial_data


def find_serial_com():
    # Find available serial devices and list to user
    ports = list(serial.tools.list_ports.comports())
    for p in ports:
        print(p)
