# build (R pkgs install line commented out)
docker build --no-cache -t sinomem/cnv_master:no_Rpkgs .


# Test user
docker run --rm -it --user root --gpus all rocker/cuda:latest whoami
docker run --rm -it --user root --gpus all sinomem/cnv_master:no_Rpkgs whoami

docker run --rm -it --gpus all rocker/cuda:4.4 whoami
docker run --rm -it --gpus all rocker/cuda:latest whoami
docker run --rm -it --gpus all sinomem/cnv_master:no_Rpkgs whoami

docker run --rm -it --priviledged --gpus all sinomem/cnv_master:no_Rpkgs whoami

docker run --rm -it --gpus all rocker/ml:4.4 whoami
docker run --rm -it --gpus all sinomem/ml:latest whoami


# test GPU
docker run --rm -it --gpus all sinomem/cnv_master:no_Rpkgs nvidia-smi


# test R install (epsecially torch and Bioc)
docker run --rm -it --gpus all sinomem/cnv_master:no_Rpkgs R


# Where are we

- the user problem is in all :latest from ml rocker, but not in th :4.4
- torch cu118 might be working
- all other R pkgs seem to install fine
