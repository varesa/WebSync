#!/usr/bin/env python3

from subprocess import check_output


def getInterfaces():
	interfaces = check_output(["ip", "a"]).decode()
	return interfaces


def isWLAN():
	return "wlan0" in getInterfaces()


def isWLANConnection():
	wlan = check_output(["ip", "a", "show", "wlan0"]).decode()
	return "inet" in wlan

def isPPPConnection():
	return "ppp0" in getInterfaces()


def restartWLAN():
	try:
		check_output(["sudo", "ifdown", "wlan0"])
	except:
		pass

	try:
		check_output(["sudo", "ifup", "wlan0"])
	except:
		pass


def restartPPP():
	try:
		check_output(["sudo", "ifdown", "ppp0"])
	except:
		pass

	try:
		check_output(["sudo", "ifup", "ppp0"])
	except:
		pass


if isWLAN():
	if not isWLANConnection():
		print("WLAN found but no connection, reconnecting")
		restartWLAN()
	else:
		print("WLAN Ok")
else:
	if not isPPPConnection():
		print("No connection, trying PPP")
		restartPPP()
	else:
		print("PPP Okay")
