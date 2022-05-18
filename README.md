# Velocyto
Repo containing our scripts for running velocyto


### Directory structure should be as followed:

top level directories - actions, data

actions - contains all the scripts which are used to run velocyto

data - contains each samples bam, index and barcodes file along with log files from submitting jobs

### Getting Data

Please note this getting data section is specific to the Sanger IRODs system. If you are not getting data from IRODs on the FARM ignore this step.

Ensure the file `irods.txt` contains 2 tab separated fields. The first contains a sample IDs and the second contains a path to the location on irods. 
Each row contains a single sample ID and its corresponding irods path as shown below:

```bash
HCA_BN_F12808058_and_HCA_BN_F12803234	/seq/illumina/cellranger-arc/cellranger-arc201_count_37d0d7a3dc1b6a1bbecebf69121e534e
HCA_BN_F12808059_and_HCA_BN_F12803235	/seq/illumina/cellranger-arc/cellranger-arc201_count_825b14f4c1094b82b066b4574c2a8c49
```

Run the script `get_velocyto.sh` inside the `data` directory and it will download all the relevant data. If you have different file names to the default edit `get_velocyto.sh` as the comments instruct. I recommend using a screen session for this process.
To run the script simply:

```bash
cd data
../actions/get_velocyto.sh
```

### Running velocyto

Ensure your sample ID list is contained within the `samples.txt` file. It should be a single field file containing one sample ID per row. I.e.

```bash
HCA_BN_F12808058_and_HCA_BN_F12803234
HCA_BN_F12808059_and_HCA_BN_F12803235
```

Run the script `submit_velocyto.sh` inside the `data` directory. 

```bash
cd data
../actions/submit_velocyto.sh
```

Jobs will be submitted to the FARM, they can be monitored with the command `bjobs` or you can look at the log and error files within the `data` directory.
