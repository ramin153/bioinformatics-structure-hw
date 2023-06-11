proc struct_cal {id } {
    set second_strucs {C T G B E H   };
    set total_frames [molinfo $id get numframes];
    puts "H or G: Representing an alpha-helix."
    puts "E or B: Representing a beta-strand."
    puts "C : Representing a coil or loop region."
    puts "T : Representing a turn or bend region."
    for {set frame 0} {$frame < $total_frames} {incr frame} {
        puts "frame: $frame";


        set se2 [atomselect $id "alpha" frame $frame];
        set total_residues [$se2 num];
        puts "secondery : [$se2 get {structure}]" 
        foreach second_struc $second_strucs {
            set se1 [atomselect $id "alpha and structure $second_struc" frame $frame];
            set count [expr [$se1 num] * 100  ];
            set proportion [expr {double($count) / $total_residues}];


            puts "Number of $second_struc portion: $proportion";
            

            }
        

        puts "==========================================";
        }
}