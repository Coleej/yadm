import warnings

warnings.filterwarnings("ignore", message="numpy.dtype size changed.*")

import datetime as dt
import os
import sys

import numpy as np
import pandas as pd
import scipy as sci
import sympy as sym
from numpy import *
from numpy import e, pi
from pyproj import Proj, transform

from scipy.constants import *
from spellchecker import SpellChecker

spellcheck = SpellChecker()

wgs84 = Proj("epsg:4326")
wgs84_merc = Proj("epsg:3857")
nad83_grs80 = Proj("epsg:4269")

utm15n = Proj("epsg:26915")
