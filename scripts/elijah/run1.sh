
nTips=(10 10 10 10 25 25 25 25 50 50 50 50)
Mu=(1 2 3 4 1 2 3 4 1 2 3 4)
trees=$(seq 1 100)
mats=$(seq 1 100)
my_dir_base="/Users/elijahphifer/Documents/lab_work"


#set with combo to work in
n=10
mu=1
  
my_dir="${my_dir_base}/MU_${n}_${mu}"

echo "Working in ${my_dir}"


for tree in $trees; do
    tree_dir="${my_dir}/${tree}"
    mat_dir="${tree_dir}/mat"
    #file="${tree_dir}/tree_${tree}.nex.csv"
    
    cd ${mat_dir}
    
    foss="${mat_dir}/tree_${tree}.nex.csv"
    
    cp ${foss} /Users/elijahphifer/Documents/lab_work/common_place/data_file.csv
    
    
 
    
    for matrix in *.nex
        do
        #cd ${mat_dir}
        cp $matrix /Users/elijahphifer/Documents/lab_work/common_place/matrix.nex
        #cd "/Users/elijahphifer/Documents/lab_work"
        rb /Users/elijahphifer/Documents/lab_work/FBD_tutorial1.Rev
        #mkdir -p output/${mu}_${n}/${tree}/
        cp /Users/elijahphifer/Documents/lab_work/output/samp_anc.log /Users/elijahphifer/Documents/lab_work/output/$matrix.log
        cp /Users/elijahphifer/Documents/lab_work/output/samp_anc.trees /Users/elijahphifer/Documents/lab_work/output/$matrix.trees
        cp /Users/elijahphifer/Documents/lab_work/output/samp_anc.mcc.tre /Users/elijahphifer/Documents/lab_work/output/$matrix.mcc.tre
        
    done
    
done

#for file in *.nex
#do
#cp $file file
#rb FBD_tutorial.Rev
#mv output/samp_anc.log output/$file.log
#mv output/samp_anc.trees output/$file.trees
#mv output/samp_anc.mcc.tre output/$file.mcc.tre
#done

