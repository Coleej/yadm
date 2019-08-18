#!/bin/bash

# rename first tab
guake --rename-tab="operate"

# create new tab for ipython
guake --new-tab='/tmp'
guake --rename-current-tab="ipython"
guake --execute="vf activate ipython"
guake --execute="ipython --profile=work"

# create new tab for finch
guake --new-tab='~/Downloads'
guake --rename-current-tab="finch" 
guake --execute="/usr/bin/finch"
