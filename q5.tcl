proc hydrogen_show { id } {



    set hbonds [measure hbonds 20 3.4 [atomselect $id all]]
    set hbond_atoms {}
    set donor_index [lindex $hbonds 0]
    set acceptor_index [lindex $hbonds 1]
    
    lappend hbond_atoms [concat $donor_index $acceptor_index] 
    
    set unique_hbond_atoms [lsort -unique [lindex $hbond_atoms 0]]
    
    set hyd_atoms [atomselect $id "index $unique_hbond_atoms"]
    puts "{resid resname phi psi structure} : \n [ $hyd_atoms get {resid resname phi psi structure}]"
    
 

    set min_resid  [lindex [lsort -unique -real [[atomselect $id all] get resid]] 0]



    set hyd_atoms_res [$hyd_atoms get resid]
    set omega_list {}
    foreach i $hyd_atoms_res {
        if {$i > $min_resid} {

            set sel_resi_min [atomselect $id "resid [expr $i-1] and name CA"]
            set sel_C [atomselect $id "resid $i and name C"]
            set sel_N [atomselect $id "resid $i and name N"]
            set sel_resi_plus [atomselect $id "resid $i and name CA"]
            lappend omega_list [measure dihed "[$sel_resi_min get index]  [$sel_C get index] [$sel_N get index] [$sel_resi_plus get index]"]

        } else {
            lappend omega_list "OUT OF RANGE"
        }
       
    }
    puts "\nOMEGA : \n$omega_list"
    puts "\nRadius of gyration [measure rgyr $hyd_atoms]" 
}


    

