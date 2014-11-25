#!/usr/bin/env python3

from subprocess import check_output

def isConnection():
	interfaces = check_output(["ip", "a"]).decode()
	return ("ppp0" in interfaces)

def restartConnection():
	try:
		check_output(["sudo", "ifdown", "ppp0"])
	except:
		pass

	try:
		check_output(["sudo", "ifup", "ppp0"])
	except:
		pass

if not isConnection():
	print("No connection")
	restartConnection()
