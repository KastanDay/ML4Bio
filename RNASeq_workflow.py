import subprocess


def main():
    # Execute FastQC.sh
    subprocess.run(['bash', 'FastQC.sh'])

    # Execute MultiQC.sh
    subprocess.run(['bash', 'MultiQC.sh'])

    # Execute STAR.sh
    subprocess.run(['bash', 'STAR.sh'])

    # Execute RSEM.sh
    subprocess.run(['bash', 'RSEM.sh'])

    # Execute DESeq2.R
    subprocess.run(['Rscript', 'DESeq2.R'])


if __name__ == '__main__':
    main()