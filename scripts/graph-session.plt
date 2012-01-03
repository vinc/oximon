#!/usr/bin/gnuplot
reset

set terminal png enhanced size 800 500 font "~/.fonts/Inconsolata.ttf" 11
set output "/tmp/oximon-graph.png"

set xdata time
set timefmt "%Y-%m-%d %H:%M:%S"
set format x "%H:%M"
set xlabel "Time (hh:mm)"

set ylabel "Hearth rate (bpm)"
set yrange [30:90]

set y2label "Oxygen saturation (%)"
set y2range [80:100]
set y2tics border mirror

set key right center 
set grid
set style data lines

#set label 1 "falling asleep" at "2011-10-25 00:31:00",71
#set arrow 1 from "2011-10-25 00:30:00",70 to "2011-10-24 23:57:00",55 

plot "/tmp/oximon-session.dat" using 1:3 title 'HR', \
     "" using 1:4 axes x1y2 title 'SAT'
