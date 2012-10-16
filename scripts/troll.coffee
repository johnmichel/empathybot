# Description:
#   Troll Alert
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   troll - Shun the trolls
#
# Notes:
#   Based on maddox's `ship it` script
# 
# Author:
#   johnmichel

trolls = [
  "http://f.cl.ly/items/2B2y261R0J0c3J0B3C1H/black_haired_troll.jpg",
  "http://f.cl.ly/items/181z1S0K262P3O2L0V1r/chubby_trolls.jpg",
  "http://f.cl.ly/items/0O1q332842021v382N0a/doctor_troll.jpg",
  "http://f.cl.ly/items/1s1O1J1I0b1U2X2z0S23/flower_trolls.jpg",
  "http://f.cl.ly/items/373n2B0V0Z47130O3w1X/football_troll.jpg",
  "http://f.cl.ly/items/1F1H05260C2Q3j1a1w08/hug_troll.jpg",
  "http://f.cl.ly/items/3k3z07441Y2l0T2D3i0l/karate_troll.jpg",
  "http://f.cl.ly/items/143B2h2q3n2h1Z0l0Z2L/neon_trolls.jpg",
  "http://f.cl.ly/items/1U0T3S2z1f0l3n3W3A0c/princess_troll.jpg",
  "http://f.cl.ly/items/2T2Q371o1G431K1m0y0G/pumpkin_troll.jpg",
  "http://f.cl.ly/items/3t460o2l3B0S2X3A0a01/rainbow_troll_army.jpg",
  "http://f.cl.ly/items/2G3j442Y0y0Y0U3l1Q21/sailor_troll.jpg",
  "http://f.cl.ly/items/2y3t1V0h141g0h2g200s/salesman_troll.png",
  "http://f.cl.ly/items/3F211O072Z2F3Y3c2O42/single_troll.jpg",
  "http://f.cl.ly/items/453m0c2U280k0c2y3607/skateboarder_troll.jpg",
  "http://f.cl.ly/items/2h2I0F0b3B291G2L3s0j/sparkle_trolls.png",
  "http://f.cl.ly/items/2o1K0J2F1I3q1z0e1Q0C/tennis_troll.jpg",
  "http://f.cl.ly/items/3A312E1P3p461u390O1i/troll_dolls.jpg",
  "http://f.cl.ly/items/2r2V1X2J3a3R340V3k27/troll_party.jpg",
  "http://f.cl.ly/items/3r3n1k2d2X0r3Z2i3V1E/two-headed_troll.jpg",
  "http://f.cl.ly/items/3C341T053H0G0U121w2M/velvet_trolls.jpg",
  "http://f.cl.ly/items/3q3J293M0P3u1x343S3i/wizard_troll.jpg"
]

module.exports = (robot) ->
  robot.hear /troll/i, (msg) ->
    msg.send msg.random trolls