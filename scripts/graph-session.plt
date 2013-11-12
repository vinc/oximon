#!/usr/bin/gnuplot
reset

set terminal pngcairo enhanced size 700,400 font '"ttf-inconsolata.otf",10'
set output "/tmp/oximon-graph.png"

set samples 1001
set datafile missing "0"

set xdata time
set timefmt "%Y-%m-%d %H:%M:%S"
set format x "%H:%M"
set xlabel "Time (hh:mm)"

set ylabel "Heart rate (bpm)"
set yrange [30:90]

set y2label "Oxygen saturation (%)"
set y2range [80:100]
set y2tics border mirror

set key right bottom
set grid
set style data lines

plot "/tmp/oximon-session.dat" u 1:4 with points axes x1y2 lc rgbcolor "#b6c2cc" pt 2 notitle, \
     "" u 1:3 with points lc rgbcolor "#ccbcb6" pt 2 notitle, \
     "" u 1:3 smooth bezier with lines t 'HR' lc rgbcolor "#cc3700" lw 2, \
     "" u 1:4 smooth bezier axes x1y2 t 'SAT' lc rgbcolor "#0073cc" lw 2
