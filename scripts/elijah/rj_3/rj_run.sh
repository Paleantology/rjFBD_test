root="/Users/elijahphifer/Desktop/rjFBD_test"
base="${root}/scripts/elijah/rj_3/data"
data="${base}"
scripts="${root}/scripts/elijah/rj_3"

rb_path="/Users/elijahphifer/Downloads/revbayes-v1.2.4 2/bin/rb"

nTips=(10 10 10 10 25 25 25 25 50 50 50 50)
Mu=(1 2 3 4 1 2 3 4 1 2 3 4)
trees=$(seq 1 12)
psi=(1 2)
mats=$(seq 1 100)

#make a folder for a common place to accsess files
common="${base}/common_place"

#set with combo to work in
n=25
mu=1
  
my_dir="${base}/${n}_${mu}"

echo "Working in ${my_dir}"

cd ${root}

for tree in $trees; do
    tree_dir="${my_dir}/${tree}"
    mat_dir="${tree_dir}/mat"
    #file="${tree_dir}/tree_${tree}.nex.csv"
    
    foss="${mat_dir}/tree_${tree}.nex.csv"
    
    cp ${foss} ${common}/data_file.csv

    for matrix in ${mat_dir}/*.nex
        do
        #cd ${mat_dir}
        cp $matrix "${common}/matrix.nex"
        #cd "/Users/elijahphifer/Documents/lab_work"
        rb ${scripts}/rjFBD.Rev
        #mkdir -p output/${mu}_${n}/${tree}/
        cp "${base}/output/low.log" "${mat_dir}/${matrix}_low.log"
        cp "${base}/output/low.trees" "${mat_dir}/${matrix}_low.trees"
        #cp ${base}/output/samp_anc.mcc.tre ${base}/output/$matrix.mcc.tre
        
    done
    
done
