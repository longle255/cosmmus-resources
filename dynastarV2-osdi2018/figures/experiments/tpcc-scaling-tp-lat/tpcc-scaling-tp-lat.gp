set terminal postscript eps enhanced color solid lw 2 "Times-Roman" 16
set output './tpcc-scaling-tp-lat.ps'
# set size 1.35,1.1
set multiplot
set grid ytics
set style data histogram
set style histogram cluster gap 1
set style fill pattern 0 border rgb "black"
set linetype 1 lc rgb "#888888" lw 1 pt 0
set linetype 2 lc rgb "#888888" lw 1 pt 0

set lmargin at screen 0.1
set rmargin 0
set bmargin 1.2
set size 0.9,0.5
# set title "0% Edge-cut"
set origin 0,0.5
set ylabel "Throughput (ktnx/s)" offset 1.5
set yrange [0 : 20]
set ytics 5
unset xtics

set key top left

plot 'tpcc-scaling-tp-lat.dat' using 2 fs pattern 1 lc rgb '#888888' title 'DynaStar', \
        '' using 5 fs pattern 2 lc rgb '#888888' title "S-SMR~ {.1*}"



#====================================================================================

set key default
unset title
set ylabel "Latency (ms)" offset 5
set style histogram errorbars gap 1 lw 1
set lmargin at screen 0.1;
set rmargin 0
set bmargin 1.2
set origin 0,0.05
set size 0.9,0.45
set ylabel "Latency (ms)" offset 2
unset format y
set yrange [1 : 25]
set ytics 5
# set xtics offset 0, 0
# set xrange [0 : 10]
# set xtics auto
set xtics ("1" 1, "2" 2, "4" 4, "8" 8, "16" 16)

plot 'tpcc-scaling-tp-lat.dat' using 3:4:xtic(1) fs pattern 1 lc rgb '#888888' notitle, \
        '' using 6:7:xtic(1) fs pattern 2 lc rgb '#888888' notitle

plot 'tpcc-scaling-tp-lat.dat' using 3:8 fs pattern 1 lc rgb '#888888' notitle, \
        '' using 6:8 fs pattern 2 lc rgb '#888888' notitle
