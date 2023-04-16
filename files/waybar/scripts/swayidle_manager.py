import argparse
import dbus
import json

from time import sleep

parser = argparse.ArgumentParser(
                    prog='SwayIdle Manager',
                    description='Check/toggle swayidle status',
                    epilog='Author: Nic Roland')

parser.add_argument('-s', '--status',
                    action='store_true')
parser.add_argument('-t', '--toggle',
                    action='store_true')

icons = {
        'active': '🔒▶',
        'inactive': '🔒⏸',
        }


args = parser.parse_args()
if args.status ^ args.toggle:
    session_bus = dbus.SessionBus()
    systemd1 = session_bus.get_object(
            'org.freedesktop.systemd1', '/org/freedesktop/systemd1')
    manager = dbus.Interface(systemd1, 'org.freedesktop.systemd1.Manager')
    service = session_bus.get_object('org.freedesktop.systemd1',
            object_path=manager.GetUnit('swayidle.service'))
    interface = dbus.Interface(service,
            dbus_interface='org.freedesktop.DBus.Properties')
    active_state = interface.Get('org.freedesktop.systemd1.Unit', 'ActiveState')

    if args.status:
        print(json.dumps({'text': icons[active_state],
            'tooltip': active_state,
            'class': '',
            'percentage': 0 if active_state == 'active' else 100}))
    elif args.toggle and active_state == 'active':
        manager.StopUnit('swayidle.service', 'replace')
    elif args.toggle and active_state == 'inactive':
        manager.StartUnit('swayidle.service', 'replace')
else:
    print('You must specify either -s or -t')
