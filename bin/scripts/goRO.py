#!/usr/bin/python
import os
from sys import stderr, exit, argv
import datetime

os.system(f'google-chrome --new-window https://etherpad.wikimedia.org/p/RicercaOperativa{str(datetime.date.today())[:4]}_indice_incontri')
os.system(f'google-chrome https://etherpad.wikimedia.org/p/RicercaOperativa{str(datetime.date.today())}')
os.system(f'google-chrome https://wbo.ophir.dev/boards/LavagnaRO{str(datetime.date.today())}_1')
os.system(f'google-chrome https://univr.zoom.us/j/87547655553')
