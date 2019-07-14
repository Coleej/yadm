import warnings
warnings.filterwarnings('ignore', message="numpy.dtype size changed.*")

import sys
import os
import numpy as np
import scipy as sci
import scipy.constants as consts
import sympy as sym
import pint as pt
import pandas as pd
import datetime as dt
from pyproj import Proj, transform
from numpy import pi
from numpy import e

from spellchecker import SpellChecker
spellcheck = SpellChecker()

import matplotlib as mpl
mpl.use('gtk3cairo')

import matplotlib.pyplot as plt
plt.ion()

ureg = pt.UnitRegistry()
m    = ureg.m
ft   = ureg.ft
s    = ureg.s
g = consts.g * (ureg.m / ureg.s**2)
rho = 1025 * (ureg.kg / ureg.m**3)
wgs84 = Proj(init="epsg:4326")
wgs84_merc = Proj(init="epsg:3857")
nad83_grs80 = Proj(init="epsg:4269")
utm15n = Proj(init="epsg:26915")
