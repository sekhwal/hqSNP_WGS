
##Trimming the fastq files
echo "Trimming the dataset"
echo "Please wait....."

for i in $(ls  *_R1.fastq.gz);

do bbduk.sh -Xmx1g in=$i in2=${i/_R1/_R2} out=${i/_R1/_trim_R1} out2=${i/_R1/_trim_R2} ref=/media/mmk6053/Data/apps/Trimmomatic-0.39/adapters/NexteraPE-PE.fa k=15 qtrim=rl trimq=20 minlength=50

done

#########Calculating stat

seqkit stat *.fastq.gz > stat_run.txt

#converting space to tab tab-delimited
sed 's/ \+/\t/g' stat_run.txt > stat_.txt
#Removing files
rm *stat_run*

#Running snippy
echo "snippy running"
snippy-multi input.tab --ref *.gb --cpus 40 > runme.sh
sh ./runme.sh

echo "remove all the weird characters and replace them with N"
snippy-clean_full_aln core.full.aln > clean.full.aln

echo "Running RaXML for generating phylogenetic tree"

raxmlHPC -m GTRGAMMA -p 12345 -s clean.full.aln -n NAME_bootstrap -f a -x 12345 -N 100 -T 12
