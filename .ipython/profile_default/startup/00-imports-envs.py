import warnings
warnings.filterwarnings("ignore", message="numpy.dtype size changed.*")

import datetime as dt
import os
import sys
from importlib import reload

import matplotlib as mpl
import matplotlib.pyplot as plt
import pint as pt


mpl.use("gtk3cairo")
plt.ion()

ureg = pt.UnitRegistry()
m = ureg.m
ft = ureg.ft
s = ureg.s
