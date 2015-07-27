#!/usr/bin/env python

import argparse
import os
import re
import subprocess
import time

# Constants
APP_ID = "com.lyft.ios.debug"
IOS_VERSION = "8.3"
DEVICE_NAME = "iPhone 6"
SIM_PATH_FMT = "%s/Applications/iOS Simulator.app/Contents/MacOS/iOS Simulator"

# Shortcuts
DEVICE_SHORTCUTS = {
    "6": "iPhone 6",
    "6+": "iPhone 6 Plus",
    "4s": "iPhone 4s",
    "5s": "iPhone 5s",
    "5": "iPhone 5s"
}

# Calculated paths
XCODE_PATH = subprocess.check_output(['xcode-select', '-p']).strip()
SIMULATOR_PATH = SIM_PATH_FMT % XCODE_PATH


def get_device_id(ios_version, device_name):
    """
    Gets Simulator Device UUID from the list of available simulators
    """
    simulators = subprocess.check_output(["xcrun", "instruments", "-s"])
    for simulator in simulators.split("\n"):
        regex = r"%s.*?\(%s Simulator\) \[(.+)\]$" % (device_name, ios_version)
        result = re.findall(regex, simulator)
        if len(result) > 0:
            return result[0]


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument('-a', '--appid')
    parser.add_argument('-d', '--device')
    parser.add_argument('-f', '--front', action='store_true')
    parser.add_argument('-v', '--ios')
    args = parser.parse_args()

    # Launch simulator
    device = DEVICE_SHORTCUTS.get(args.device, DEVICE_NAME)
    device_id = get_device_id(args.ios or IOS_VERSION, device)
    launch_arguments = [
        SIMULATOR_PATH,
        '-CurrentDeviceUDID', device_id,
    ]
    if args.front:
        launch_arguments.extend(['-StayInFront', 'YES'])

    os.spawnv(os.P_NOWAIT, SIMULATOR_PATH, launch_arguments)

    # Open Lyft App after 1s (the simulator need some time to launch)
    time.sleep(1)

    app_id = args.appid or APP_ID

    subprocess.check_output(['xcrun', 'simctl', 'launch', device_id, app_id])


if __name__ == "__main__":
    main()
