proc cal_rmsd { id } {
    set total_frames [molinfo $id get numframes];
    for {set frame1 0} {$frame1 < $total_frames} {incr frame1} {
            

        for {set frame2 [expr $frame1 + 1]} {$frame2 < $total_frames} {incr frame2} {
            puts "frame  $frame1 : frame  $frame2 ";
            set se1 [measure rmsd [atomselect $id all frame $frame1] [atomselect $id all frame $frame2]]
            puts "result : $se1"
         }
    }
}

 