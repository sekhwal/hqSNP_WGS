
### # hqSNP_WGS
Pipeline to identify high quality SNPs in whole genome sequence of bacteria

#### Create conda environment.Packages are listed in the environment.yaml file.
	conda env create -f environment.yaml
  
##### Prepare snippy file for multiple files run (More detail, please follow snippy tutorial-https://github.com/tseemann/snippy)
	snippy-multi input.tab --ref Reference.gbk --cpus 16 > runme.sh
	
##### Run the script
##### Make sure the input files (fastq.gz), a reference (name.gb) are in the same working directory
   	snippy_pipeline.sh

##### Run the output file in iTOL to make a phylogentic tree
   	RAxML_bootstrap.NAME_bootstrap

