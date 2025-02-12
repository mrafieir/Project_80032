readcol, "./dats/wise_all.dat", i1, i2, w1, w2, format='d,d,d,d', comm="#"
readcol, "./dats/wise_all_magcut.dat", i1x, i2x, w1x, w2x, jx, kx, format='d,d,d,d,d,d', comm="#"
readcol, "./dats/irac-errcor", irac1, irac2, format='d,d', comm="#"
;readcol, "./dats/1gyr.dat", sj1, sk1, si1_1, si2_1, format='d,d,d,d', comm='#'
;readcol, "./dats/3gyr.dat", sj2, sk2, si1_2, si2_2, format='d,d,d,d', comm='#'
;readcol, "./dats/10gyr.dat", sj3, sk3, si1_3, si2_3, format='d,d,d,d', comm='#'

xrange = [-1,2]
yrange = [18,12]

!p.thick=9
!x.thick=10
!y.thick=10
!p.charthick=8
!p.font=-1
!p.charsize=3.8

color = irac1-irac2

set_plot, 'ps'
device, filename="fig6a.eps", encapsulated=1, /cmyk, xsize=40, ysize=40

cgplot, color, irac2, $
xtitle='!6[3.6]-[4.5]', ytitle='[4.5]', $
xrange=xrange, yrange=yrange, $
psym=16, symsize=0.9

cgplot, i1-i2, i2, color='cyan', $
psym=16, symsize=0.7, /overplot

cgplot, i1x-i2x, i2x, psym=16, symsize=0.5, color='gold', /overplot

cglegend, title=['!6IRAC/WISE/2MASS','IRAC/WISE','IRAC'], $
color=['gold','cyan','black'], location=[0.94, 12.2], $
thick=7, charthick=8, charsize=2.6, vspace=3.4, /data, $
/box, bx_thick=7, /background, $
psyms=[-16, -16, -16], length=0.0, /addcmd

device, /close

;cgps2raster, 'fig6a.eps', /png, width=800
end
