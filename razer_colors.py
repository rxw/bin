#!/bin/env python
# Utilize pywal colors with my dad's razer
# keyboard lol :P
#
# tato - wtfpl (c)

from openrazer.client import DeviceManager
from openrazer.client import constants as c
import json
import time
import os

dev_man = DeviceManager()
kb = dev_man.devices[0]
effects = kb.fx
step = 1


if __name__ == '__main__':
    colors = json.loads(open(os.environ['HOME'] + "/.cache/wal/colors.json").read())
    rgb_colors = []
    
    for color in colors['colors']:
        hex_color = colors['colors'][color].lstrip('#')
        rgb_colors.append(tuple(int(hex_color[i:i+2], 16) for i in (0,2,4)))
    
    
    effects.breath_dual(rgb_colors[1][0],rgb_colors[1][1],rgb_colors[1][2],rgb_colors[9][0],rgb_colors[9][1],rgb_colors[9][2])

