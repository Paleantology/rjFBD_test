root="/Users/elijahphifer/Desktop/rjFBD_test"
base="${root}/data/Latest_sim_data"
data="${root}/data"
scripts="${root}/scripts"

nTips=(10 10 10 10 25 25 25 25 50 50 50 50)
Mu=(1 2 3 4 1 2 3 4 1 2 3 4)
trees=$(seq 1 100)
psi=(1 2)
mats=$(seq 1 100)

#make a folder for a common place to accsess files
common="${base}/common_place"

#set with combo to work in
n=10
mu=1
  
my_dir="${base}/MU_${n}_${mu}"

echo "Working in ${my_dir}"

cd ${root}

for tree in $trees; do
    tree_dir="${my_dir}/${tree}"
    mat_dir="${tree_dir}/mat"
    mat1="${mat_dir}/1"
    mat2="${mat_dir}/2"
    #file="${tree_dir}/tree_${tree}.nex.csv"
    
    foss1="${mat_dir}/tree1_${tree}.nex.csv"
    foss2="${mat_dir}/tree2_${tree}.nex.csv"
    
    cp ${foss1} ${common}/data_file.csv

    for matrix in mat1/*.nex
        do
        #cd ${mat_dir}
        cp $matrix ${common}/matrix.nex
        #cd "/Users/elijahphifer/Documents/lab_work"
        rb ${scripts}/rjFBD.Rev
        #mkdir -p output/${mu}_${n}/${tree}/
        cp output/low.log ${base}/output/${matrix}_low.log
        cp output/low.trees ${base}/output/${matrix}_low.trees
        #cp ${base}/output/samp_anc.mcc.tre ${base}/output/$matrix.mcc.tre
        
    done
    
    
    cp ${foss2} ${common}/data_file.csv

    for matrix in mat2/*.nex
        do
        #cd ${mat_dir}
        cp $matrix ${common}/matrix.nex
        #cd "/Users/elijahphifer/Documents/lab_work"
        rb ${scripts}/rjFBD.Rev
        #mkdir -p output/${mu}_${n}/${tree}/
        cp output/low.log ${base}/output/${matrix}_low.log
        cp output/low.trees ${base}/output/${matrix}_low.trees
        #cp ${base}/output/samp_anc.mcc.tre ${base}/output/$matrix.mcc.tre
        
    done
    
done
