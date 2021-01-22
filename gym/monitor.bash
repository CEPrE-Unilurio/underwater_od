
#chmod 777 -Rf models/$1

tensorboard --logdir=ai4coral/models/$1 --bind_all
