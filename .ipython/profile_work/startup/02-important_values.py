# Gustav (2008)
gustav_lf = dt.datetime(2008, 9, 1, 15)

# D3d model setup specifics
gustav_d3d_Itdate = dt.datetime(2008, 7, 25)
gustav_d3d_tstart = gustav_d3d_Itdate + pd.to_timedelta(4.8960e4, 'min')
gustav_d3d_tstop  = gustav_d3d_Itdate + pd.to_timedelta(6.0480e4, 'min')

# XBeach model
gustav_xb_start  = dt.datetime(2008, 8, 31, 6, 0, 0)  
gustav_xb_stop   = dt.datetime(2008, 9, 2, 12, 0, 0)  

# caminada metrics
cam1_vol = 2530677 * ureg.m**3 # cam I volume of placement
cam2_vol = 3897701 * ureg.m**3 # cam II volume of placement
cam_bch_z = 1.3716 * ureg.m # cam beach elevation NAVD88
cam_bch_W = 19.8 * ureg.m # cam beach width

cam_dune_z = 7 * ureg.ft
cam_dune_z.ito(ureg.m) # cam dune elevation NAVD88

cam_dc_W = 290 * ureg.ft
cam_dc_W.ito(ureg.m) # cam dune crest width

cam1_A = 303 * ureg.acre
cam1_A.ito(ureg.km**2) # cam 1 surface area

cam2_A = 489 * ureg.acre
cam2_A.ito(ureg.km**2) # cam 2 surface area

cam1_L = 31000 * ureg.ft
cam1_L.ito(ureg.km) # cam 1 length

cam2_L = 39000 * ureg.ft
cam2_L.ito(ureg.km) # cam 2 length

cam_L = cam1_L + cam2_L
